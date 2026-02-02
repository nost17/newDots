import QtQuick
import Quickshell
import qs.src.Widgets

DsrButton {
    id: root
    property string localeDate: clock.date.toLocaleString(Qt.locale(), "ddd MM MMM hh:mm")

    function dateUpperCase(str) {
        return str.replace(/\b\w/g, letra => letra.toUpperCase());
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    DsrText {
        text: root.dateUpperCase(root.localeDate)
        elide: Text.ElideNone
        wrapMode: Text.NoWrap
    }
}
