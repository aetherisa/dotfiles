pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    readonly property alias base00: json.base00
    readonly property alias base01: json.base01
    readonly property alias base02: json.base02
    readonly property alias base03: json.base03
    readonly property alias base04: json.base04
    readonly property alias base05: json.base05
    readonly property alias base06: json.base06
    readonly property alias base07: json.base07
    readonly property alias base08: json.base08
    readonly property alias base09: json.base09
    readonly property alias base0A: json.base0A
    readonly property alias base0B: json.base0B
    readonly property alias base0C: json.base0C
    readonly property alias base0D: json.base0D
    readonly property alias base0E: json.base0E
    readonly property alias base0F: json.base0F

    signal updated

    function get(name) {
        switch (name) {
        case "red":
            return base08;
        case "orange":
            return base09;
        case "yellow":
            return base0A;
        case "green":
            return base0B;
        case "cyan":
            return base0C;
        case "blue":
            return base0D;
        case "purple":
        case "magenta":
            return base0E;
        case "brown":
            return base0F;
        case "base00":
            return base00;
        case "base01":
            return base01;
        case "base02":
            return base02;
        case "base03":
            return base03;
        case "base04":
            return base04;
        case "base05":
            return base05;
        case "base06":
            return base06;
        case "base07":
            return base07;
        case "base08":
            return base08;
        case "base09":
            return base09;
        case "base0A":
            return base0A;
        case "base0B":
            return base0B;
        case "base0C":
            return base0C;
        case "base0D":
            return base0D;
        case "base0E":
            return base0E;
        case "base0F":
            return base0F;
        default:
            return base05;
        }
    }

    FileView {
        path: Quickshell.env("XDG_DATA_HOME") + "/base16/quickshell"

        watchChanges: true
        onFileChanged: {
            reload();
            root.updated();
        }

        JsonAdapter {
            id: json
            property color base00
            property color base01
            property color base02
            property color base03
            property color base04
            property color base05
            property color base06
            property color base07
            property color base08
            property color base09
            property color base0A
            property color base0B
            property color base0C
            property color base0D
            property color base0E
            property color base0F
        }
    }
}
