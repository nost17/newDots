import QtQuick
import "../Common"

Text {
    property string fontFamily: "Inter"
    property double fontSize: 14
    property real fontWeight: 500
    property bool bold: font.bold
    property bool italic: font.italic

    color: Theme.textPrimary
    font.pixelSize: fontSize
    font.family: fontFamily
    font.weight: fontWeight
    elide: Text.ElideRight
    verticalAlignment: Text.AlignVCenter
    wrapMode: Text.WordWrap
    font.bold: bold
    font.italic: italic

    Behavior on color {
        ColorAnimation {
            duration: 160
            easing.type: Easing.OutCubic
        }
    }
}
