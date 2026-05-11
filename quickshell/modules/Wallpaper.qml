import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import qs.services

Variants {
    model: Quickshell.screens
    PanelWindow {
        property var modelData
        screen: modelData

        anchors {
            left: true
            right: true
            bottom: true
            top: true
        }

        WlrLayershell.layer: WlrLayer.Background
        exclusionMode: ExclusionMode.Ignore
        color: Base16.get(Config.wallpaper.background)
        visible: Config.wallpaper.enable

        Image {
            id: image
            anchors.fill: parent
            cache: false
            fillMode: Image.PreserveAspectCrop
            source: Quickshell.dataDir + "/lutgen.jpg"
        }

        Process {
            id: wallpaper
            running: true
            environment: ({
                    LUTGEN_DIR: Quickshell.env("XDG_DATA_HOME") + "/base16"
                })
            command: ["lutgen", "apply", "-p", "lutgen", "-o", Quickshell.dataDir + "/lutgen.jpg", Quickshell.shellDir + "/assets/wallpapers/input.jpg",]
            onExited: {
                image.source = "";
                image.source = Quickshell.dataDir + "/lutgen.jpg";
            }
        }

        IpcHandler {
            target: "wallpaper"

            function rebuild() {
                wallpaper.running = true;
            }
        }
    }
}
