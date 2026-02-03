pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property string colorsFilePath: Quickshell.env("HOME") + "/.cache/quickshell/dsrcolors.json"
}
