import QtQuick

Item {
    id: root
    default property alias data: contentItem.data
    property int radius: 0
    property color bgNormal: "lightslategray"
    property color bgActive: "darkseagreen"
    property double padding: 6
    property bool active: false
    property bool centered: true
    property int borderWidth: 0
    property color borderColor: "gray"
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
                color: root.borderColor
                width: root.borderWidth
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
            color: "black"
            opacity: {
                if (root.pressed) {
                    return 0.2;
                } else if (root.hovered) {
                    return 0.1;
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
