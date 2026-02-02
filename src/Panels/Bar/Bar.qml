import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.src.Panels.Bar.Components

PanelWindow {
    id: root
    anchors {
        top: true
        right: true
        left: true
    }
    implicitHeight: 44
    Rectangle {
        id: rootRect
        anchors.fill: parent
        anchors.margins: 4
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        readonly property int heightItems: root.implicitHeight - anchors.margins * 2
        color: "transparent"
        RowLayout {
            anchors.fill: parent
            spacing: 10
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
