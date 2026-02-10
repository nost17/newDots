import QtQuick
import Quickshell
import qs.src.Widgets
import "../../../Common"

DsrButton {
    id: root
    property string localeDate: clock.date.toLocaleString(Qt.locale(), "ddd MM MMM")
    bgNormal: "transparent"
    radius: Theme.radius
    borderWidth: root.hovered ? 1 : 0
    borderColor: Theme.borderColor
    leftPadding: padding * 2
    rightPadding: padding * 2

    function dateUpperCase(str) {
        return str.replace(/\b\w/g, letra => letra.toUpperCase());
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    DsrText {
        text: root.dateUpperCase(root.localeDate)
        fontSize: 15
        height: root.implicitHeight - root.padding * 2
    }
    DsrText {
        text: Qt.formatDateTime(clock.date, "hh:mm")
        fontSize: 18
        bold: true
        color: Theme.accentPrimary
        height: root.implicitHeight - root.padding * 2
    }
}
