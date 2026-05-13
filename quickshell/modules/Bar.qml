import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.services

PanelWindow {
    id: root

    anchors {
        left: true
        right: true
        top: true
    }

    margins {
        top: Config.bar.margin.top
        left: Config.bar.margin.left
        right: Config.bar.margin.right
        bottom: Config.bar.margin.bottom
    }

    mask: Region {}

    visible: Config.bar.enable
    color: "transparent"
    implicitHeight: Config.bar.height + Config.bar.shadow * 2
    WlrLayershell.layer: WlrLayer.Overlay
    exclusionMode: ExclusionMode.Normal

    readonly property bool fullscreen: {
        const active = ToplevelManager.activeToplevel;
        return active !== null && active.fullscreen && active.activated;
    }

    RowLayout {
        anchors.fill: parent
        spacing: 12
        opacity: root.fullscreen ? 0 : 1

        Behavior on opacity {
            NumberAnimation {
                duration: 180
                easing.type: Easing.Linear
            }
        }

        Date {}
        Power {}

        Item {
            Layout.fillWidth: true
        }

        Volume {}
    }
}
