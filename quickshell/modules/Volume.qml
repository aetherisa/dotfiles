import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import qs.services

Item {
    Layout.fillHeight: true
    Layout.preferredWidth: text.implicitWidth + Config.bar.shadow * 2
    visible: Config.volume.enable

    Rectangle {
        id: rect
        anchors.fill: parent
        color: Base16.get(Config.volume.background)
        radius: Config.volume.radius

        anchors {
            rightMargin: Config.bar.shadow
            leftMargin: Config.bar.shadow
            topMargin: Config.bar.shadow
            bottomMargin: Config.bar.shadow
        }

        border {
            color: Base16.get(Config.volume.border.color)
            width: Config.volume.border.width
        }

        Text {
            id: text
            anchors.centerIn: parent
            color: Base16.get(Config.volume.foreground)
            font {
                pixelSize: 14
            }
            text: {
                let result;

                switch (Audio.sinkState) {
                case "muted":
                    result = Config.volume.icons.muted;
                    break;
                case "low":
                    result = Config.volume.icons.low;
                    break;
                case "medium":
                    result = Config.volume.icons.medium;
                    break;
                case "high":
                    result = Config.volume.icons.high;
                    break;
                }

                if (Audio.sourceState == "muted") {
                    result += ("  " + Config.volume.icons.micMuted);
                }

                return result;
            }
            leftPadding: Config.volume.padding.left
            rightPadding: Config.volume.padding.right
        }
    }

    Behavior on Layout.preferredWidth {
        NumberAnimation {
            duration: 50
            easing.type: Easing.Linear
        }
    }

    MultiEffect {
        anchors.fill: rect
        source: rect

        shadowEnabled: true
        shadowColor: "#000000"
        shadowOpacity: 0.8
        shadowBlur: 0.5
        shadowHorizontalOffset: 1
        shadowVerticalOffset: 1
        autoPaddingEnabled: true
    }
}
