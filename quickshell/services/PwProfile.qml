pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property list<string> states: {
        let result = ["PowerSaver", "Balanced"];
        if (PowerProfiles.hasPerformanceProfile)
            return [...result, "Performance"];
        return result;
    }

    function get() {
        let profile = PowerProfile.toString(PowerProfiles.profile);

        if (profile == "Performance" && !PowerProfiles.hasPerformanceProfile)
            throw new Error("Unreachable");

        return profile;
    }

    function set(profile) {
        if (profile == "Performance" && PowerProfiles.hasPerformanceProfile)
            PowerProfiles.profile = PowerProfile.Performance;
        else if (profile == "Balanced")
            PowerProfiles.profile = PowerProfile.Balanced;
        else if (profile == "PowerSaver")
            PowerProfiles.profile = PowerProfile.PowerSaver;
    }
}
