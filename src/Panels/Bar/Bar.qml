import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.src.Panels.Bar.Components

PanelWindow {
    id: rootBar
    anchors {
        top: true
        right: true
        left: true
    }
    implicitHeight: 44
    Rectangle {
        id: barBackground
        anchors.fill: parent
        anchors.margins: 4
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        readonly property int heightItems: rootBar.implicitHeight - anchors.margins * 2
        color: "transparent"
        RowLayout {
            anchors.left: barBackground.left
            spacing: 10
            Launcher {
                implicitHeight: barBackground.heightItems
                implicitWidth: barBackground.heightItems
            }
        }
        RowLayout {
            anchors.right: barBackground.right
            spacing: 10
            Clock {
                implicitHeight: barBackground.heightItems
            }
        }
    }
}
