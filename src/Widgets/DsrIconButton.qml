import QtQuick
import "../Common"

DsrButton {
    id: root
    property alias name: icon.name
    property alias size: icon.size
    property alias filled: icon.filled
    property alias weight: icon.weight
    property color fgNormal: Theme.textPrimary
    property color fgActive: Theme.textInverted

    DsrIcon {
        id: icon
        color: root.active ? root.fgActive : root.fgNormal
        height: root.height - root.padding * 2
    }
}
