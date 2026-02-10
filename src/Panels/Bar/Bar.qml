import Quickshell
import QtQuick
import QtQuick.Layouts
import "./Components"
import "../../Common"

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
        color: Theme.backgroundPrimary
    }
    Rectangle {
        id: barMargin
        anchors.fill: parent
        anchors.margins: 4
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        readonly property int heightItems: rootBar.implicitHeight - anchors.margins * 2
        color: "transparent"
        RowLayout {
            anchors.left: barMargin.left
            spacing: 10
            Launcher {
                implicitHeight: barMargin.heightItems
                // implicitWidth: barMargin.heightItems
            }
        }
        RowLayout {
            anchors.right: barMargin.right
            spacing: 5
            Clock {
                implicitHeight: barMargin.heightItems
            }
        }
    }
}
