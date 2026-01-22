import QtQuick

Text {
    property string fontFamily: "Liberation Sans"
    property double fontSize: 14
    property real fontWeight: font.weight
    property bool bold: font.bold
    property bool italic: font.italic

    color: "black"
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
