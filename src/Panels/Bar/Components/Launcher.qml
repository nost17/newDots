pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.src.Widgets
import "../../../Common"

DsrIconButton {
    id: root
    onClicked: Quickshell.execDetached(["wofi", "--show", "drun"])
    bgNormal: "transparent"
    name: "search"
    spacingChildrens: 6
    radius: root.width / 2
    borderWidth: root.hovered ? 1 : 0
    borderColor: Theme.borderColor
    leftPadding: padding * 2
    rightPadding: padding * 2
    size: 20
    DsrText {
        text: "Lanzar"
        height: root.height - root.padding * 2
        fontSize: 14
        bold: true
    }
}
