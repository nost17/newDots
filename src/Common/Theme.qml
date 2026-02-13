pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: theme

    property alias colors: themeData

    FileView {
        id: themeFile
        watchChanges: true
        path: Config.colorsFilePath
        onFileChanged: theme.reload()
        onAdapterUpdated: writeAdapter()
        onLoadFailed: function (error) {
            if (error === FileViewError.FileNotFound) {
                themeFile.themeData = {};
                writeAdapter();
            }
        }
        onLoaded: function () {
            console.log("FILE: " + Config.colorsFilePath + " loaded!");
        }
        adapter: JsonAdapter {
            id: themeData

            property bool darkTheme: true

            // Backgrounds
            property string backgroundPrimary: "#0C0D11"
            property string backgroundSecondary: "#151720"
            property string backgroundTertiary: "#1D202B"
            // Text Colors
            property string textPrimary: "#CACEE2"
            property string textSecondary: "#B7BBD0"
            property string textInverted: "#151720"
            property string textDisabled: "#6B718A"
            // Accent Colors
            property string accentPrimary: "#A8AEFF"
            property string accentSecondary: "#9EA0FF"
            property string accentTertiary: "#8EABFF"
            // Error/Warning
            property string error: "#FF6B81"
            property string warning: "#FFBB66"
            // Other
            property string border: "#44485A"
            property string overlay: "#44485A"
            property string tint: "#E3C2FF"
        }
    }

    function reload() {
        themeFile.reload();
    }

    readonly property bool darkTheme: colors.darkTheme
    readonly property color backgroundPrimary: colors.backgroundPrimary
    readonly property color backgroundSecondary: colors.backgroundSecondary
    readonly property color backgroundTertiary: colors.backgroundTertiary
    readonly property color textInverted: colors.textInverted
    readonly property color textPrimary: colors.textPrimary
    readonly property color textSecondary: colors.textSecondary
    readonly property color textDisabled: colors.textDisabled
    readonly property color accentPrimary: darkTheme ? ColorUtils.mixColor(colors.tint, colors.accentPrimary, 0.6) : ColorUtils.mixColor(Qt.lighter(colors.accentPrimary, 1.4), colors.accentSecondary, 0.5)
    readonly property color accentSecondary: colors.accentSecondary
    readonly property color accentTertiary: colors.accentTertiary
    readonly property color error: colors.error
    readonly property color warning: colors.warning
    readonly property color borderColor: colors.border
    readonly property color overlay: colors.overlay
    readonly property color tint: colors.tint
    readonly property int radius: 3
    readonly property int padding: 6
}
