pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.src.Widgets
import "../../../Common"

DsrButton {
    id: root
    onClicked: Quickshell.execDetached(["wofi", "--show", "drun"])
    bgNormal: "transparent"
    spacingChildrens: 6
    radius: Theme.radius
    borderWidth: 1
    borderColor: hovered ? Theme.borderColor : "transparent"
    overlayColor: Theme.accentPrimary
    leftPadding: padding * 2
    rightPadding: padding * 2
    DsrIcon {
        name: "search"
        color: root.hovered ? Theme.accentPrimary : Theme.textPrimary
        size: 20
        height: root.height - root.padding * 2
    }
    DsrText {
        text: "Lanzar"
        color: root.hovered ? Theme.accentPrimary : Theme.textPrimary
        fontSize: 14
        bold: true
        height: root.height - root.padding * 2
    }
}
