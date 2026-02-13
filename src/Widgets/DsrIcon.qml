import Quickshell
import QtQuick

Item {
    id: root
    // anchors.centerIn: parent
    property alias name: icon.text
    property alias color: icon.color
    property real size: 18
    property bool filled: true
    property real weight: filled ? 600 : 400

    implicitWidth: Math.round(size)
    implicitHeight: Math.round(size)

    FontLoader {
        id: materialFont
        source: Quickshell.shellPath("assets/fonts/Material_Symbols/MaterialSymbolsRounded[FILL,GRAD,opsz,wght].ttf")
    }

    DsrText {
        id: icon
        readonly property real fill: root.filled ? 1.0 : 0.0
        anchors.centerIn: parent
        // anchors.horizontalCenterOffset: -root.size * 0.05
        fontFamily: materialFont.name
        fontSize: root.size
        fontWeight: root.weight
        antialiasing: true
        renderType: Text.NativeRendering
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        layer.enabled: true
        layer.smooth: true

        font.variableAxes: {
            "FILL": fill.toFixed(1),
            "wght": fontInfo.weight
        }
    }
}
