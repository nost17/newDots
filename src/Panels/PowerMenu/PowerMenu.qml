pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.src.Widgets
import "../../Common"

DsrWindow {
    id: root
    required property LazyLoader loader
    isActive: loader.active
    focusable: isActive
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    property bool showActions: true
    readonly property var actionList: [
        {
            name: "Cerrar sesion",
            icon: "logout",
            command: "notify-send salir",
            confirm: true
        },
        {
            name: "Suspender",
            icon: "bedtime",
            command: "notify-send suspender"
        },
        {
            name: "Reinicar",
            icon: "replay",
            command: "notify-send reiniciar",
            confirm: true
        },
        {
            name: "Apagar",
            icon: "power_settings_new",
            command: "notify-send apagar",
            confirm: true
        },
    ]

    onClosed: {
        loader.active = false;
    }

    onIsActiveChanged: {
        actionGrid.children[0].forceActiveFocus();
    }
    onShowActionsChanged: {
        if (!showActions)
            actionConfirmOk.forceActiveFocus();
    }

    function startConfirm(cmd: string): void {
        root.showActions = false;
        setCommand(cmd);
    }

    function setCommand(cmd: string): void {
        actionConfirmOk.command = cmd;
    }

    function execCommand(cmd: string): void {
        setCommand("");
        close();
        Quickshell.execDetached(cmd.split(" "));
    }

    implicitHeight: Screen.height
    implicitWidth: Screen.width
    background.Keys.onEscapePressed: root.close()
    background.color: ColorUtils.applyAlpha(Theme.overlay, 0.4)
    content: Item {
        MouseArea {
            anchors.fill: parent
            onClicked: root.close()
        }
        Rectangle {
            width: 500
            height: 100
            anchors.centerIn: parent
            color: Theme.backgroundPrimary
            MouseArea {
                anchors.fill: parent
                onClicked: actionGrid.children[0].forceActiveFocus()
                onPressed: actionGrid.children[0].forceActiveFocus()
            }
            GridLayout {
                id: actionGrid
                focus: true
                rows: 1
                columnSpacing: 10
                anchors.fill: parent
                anchors.margins: 10
                uniformCellWidths: true
                Repeater {
                    model: root.actionList
                    delegate: ActionButton {
                        required property var modelData
                        visible: root.showActions
                        name: modelData.icon
                        command: modelData.command
                        onClicked: {
                            if (modelData.confirm) {
                                root.startConfirm(command);
                            } else {
                                root.execCommand(command);
                            }
                        }
                    }
                }
                ActionButton {
                    id: actionConfirmCancel
                    visible: !root.showActions
                    name: "close"
                    onClicked: root.close()
                }
                ActionButton {
                    id: actionConfirmOk
                    visible: !root.showActions
                    name: "check"
                    onClicked: {
                        root.execCommand(command);
                    }
                }
            }
        }
    }
    component ActionButton: DsrIconButton {
        readonly property color fgDimmed: Qt.lighter(Theme.textPrimary, Theme.darkTheme ? 0.8 : 3)
        property string command: ""
        Layout.fillWidth: true
        Layout.fillHeight: true
        borderWidth: 1
        size: 24
        weight: 500
        padding: 0
        fgNormal: activeFocus ? Theme.accentPrimary : fgDimmed
        Keys.onRightPressed: event => {
            nextItemInFocusChain(true).forceActiveFocus();
            event.accepted = true;
        }

        Keys.onLeftPressed: event => {
            nextItemInFocusChain(false).forceActiveFocus();
            event.accepted = true;
        }
    }
}
