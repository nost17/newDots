// ColorUtils.qml
pragma Singleton
import QtQuick
import Quickshell

Singleton {
    function isDark(c: color): bool {
        return c.hslLightness < 0.45;
    }

    function mixColor(color1: color, color2: color, weight: real): color {
        // Aseguramos que weight esté entre 0 y 1
        if (weight === undefined)
            weight = 0.5;
        const w = Math.max(0, Math.min(1, weight));
        const w1 = 1 - w; // Peso del color 1

        // Extraemos componentes (QML los da entre 0.0 y 1.0)
        const r = (color1.r * w1) + (color2.r * w);
        const g = (color1.g * w1) + (color2.g * w);
        const b = (color1.b * w1) + (color2.b * w);
        const a = (color1.a * w1) + (color2.a * w);

        return Qt.rgba(r, g, b, a);
    }
}
