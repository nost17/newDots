pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.src.Widgets

DsrIconButton {
    id: root
    onClicked: Quickshell.execDetached(["wofi", "--show", "drun"])
    name: "search"
    size: 21
}
