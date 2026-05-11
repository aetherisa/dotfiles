pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property var displayDevice: UPower.displayDevice

    readonly property bool ready: displayDevice.ready
    readonly property real timeToEmpty: ready ? displayDevice.timeToEmpty : 0
    readonly property real timeToFull: ready ? displayDevice.timeToFull : 0
    readonly property real percentage: ready ? displayDevice.percentage : 0

    readonly property bool isCharging: {
        if (!ready)
            return false;
        return UPowerDeviceState.toString(displayDevice.state) != "Discharging";
    }
}
