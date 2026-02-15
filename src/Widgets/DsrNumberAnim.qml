import QtQuick

NumberAnimation {
    duration: 400
    easing.type: Easing.BezierSpline
    easing.bezierCurve: [0.38, 1.21, 0.22, 1, 1, 1]
}
