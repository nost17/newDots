pragma ComponentBehavior: Bound
import QtQuick
import "../Common"

Item {
    id: root
    default property alias data: contentItem.data
    focus: true
    activeFocusOnTab: true
    property int radius: Theme.radius
    property color bgNormal: Theme.backgroundSecondary
    property color bgActive: Theme.accentPrimary
    property color overlayColor: ColorUtils.isDark(Theme.overlay) ? Theme.textPrimary : Theme.textInverted
    property double padding: 6
    property bool active: false
    property bool centered: true
    property int borderWidth: 0
    property color borderColor: Theme.borderColor
    property color borderFocusColor: Theme.tint
    property alias spacingChildrens: contentItem.spacing
    property alias leftPadding: contentItem.leftPadding
    property alias rightPadding: contentItem.rightPadding
    property alias bottomPadding: contentItem.bottomPadding
    property alias topPadding: contentItem.topPadding
    property bool hovered: mouse.containsMouse
    property bool pressed: mouse.pressed

    implicitWidth: contentItem.implicitWidth
    implicitHeight: contentItem.implicitHeight

    signal clicked

    Keys.onReturnPressed: root.clicked()

    Item {
        implicitHeight: root.implicitHeight
        implicitWidth: root.implicitWidth
        scale: root.pressed ? 0.96 : 1
        Rectangle {
            id: backgroundRect
            anchors.fill: parent
            color: root.active ? root.bgActive : root.bgNormal
            radius: root.radius
            border {
                color: root.activeFocus ? root.borderFocusColor : root.borderColor
                width: root.borderWidth
            }
            Behavior on border.color {
                ColorAnimation {
                    duration: 160
                    easing.type: Easing.OutCubic
                }
            }
            Behavior on border.width {
                NumberAnimation {
                    duration: 160
                    easing.type: Easing.OutCubic
                }
            }
            Behavior on color {
                ColorAnimation {
                    duration: 160
                    easing.type: Easing.OutCubic
                }
            }
        }

        Row {
            id: contentItem
            anchors.centerIn: root.centered ? parent : null
            spacing: 5
            opacity: root.hovered ? 0.9 : 1
            padding: root.padding
        }

        Rectangle {
            id: overlayRect
            anchors.fill: parent
            radius: root.radius
            color: root.overlayColor
            opacity: {
                if (root.activeFocus && !root.pressed && !root.hovered) {
                    return 0.05;
                } else if (root.pressed) {
                    return 0.25;
                } else if (root.hovered) {
                    return 0.15;
                } else {
                    return 0;
                }
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }
        }

        Behavior on scale {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutBack
            }
        }
    }
    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
        enabled: root.enabled
        onClicked: root.clicked()
    }
}
