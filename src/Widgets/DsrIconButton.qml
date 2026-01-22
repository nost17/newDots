import QtQuick

DsrButton {
    id: root
    property alias name: icon.name
    property alias size: icon.size
    property color fgNormal: "black"
    property color fgActive: "white"

    DsrIcon {
        id: icon
        color: root.active ? root.fgActive: root.fgNormal
    }
}
