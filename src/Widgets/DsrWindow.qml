import Quickshell
import Quickshell.Wayland

PanelWindow {
    property string layerNamespace: "window"
    property bool isActive: true
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.namespace: `dsr:${layerNamespace}`
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
}
