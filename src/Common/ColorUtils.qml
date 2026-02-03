// ColorUtils.qml
pragma Singleton
import QtQuick
import Quickshell

Singleton {
    function isDark(c: color): bool {
        return c.hslLightness < 0.45;
    }
}
