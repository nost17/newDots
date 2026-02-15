import Quickshell
import Quickshell.Wayland
import QtQuick
import "../Common"

PanelWindow {
    id: root
    property string layerNamespace: "window"
    property bool isActive: true
    property Item content: null
    readonly property alias background: backgroundRect
    color: "transparent"

    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.namespace: `dsr:${layerNamespace}`
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    function open(): void {
        isActive = true;
    }

    function close(): void {
        isActive = false;
    }

    onIsActiveChanged: {
        mainAnim.to = root.isActive ? 1 : 0;
        mainAnim.restart();
        if (isActive)
            backgroundRect.forceActiveFocus();
    }
    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: Theme.backgroundPrimary
        opacity: 0
        focus: true
        DsrNumberAnim {
            id: mainAnim
            target: backgroundRect
            property: "opacity"
            onFinished: {
                if (backgroundRect.opacity === 0) {
                    root.closed();
                    root.visible = false;
                } else {
                    root.visible = true;
                }
            }
        }

        Component.onCompleted: {
            if (root.content) {
                root.content.parent = backgroundRect;
                root.content.anchors.fill = backgroundRect;
                Qt.callLater(() => root.content.forceActiveFocus());
            }
        }

        Connections {
            target: root
            function onContentChanged() {
                if (root.content) {
                    root.content.parent = backgroundRect;
                    root.content.anchors.fill = backgroundRect;
                    Qt.callLater(() => root.content.forceActiveFocus());
                }
            }
        }
    }
}
