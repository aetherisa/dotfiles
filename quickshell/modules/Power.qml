import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import qs.services

Item {
    Layout.fillHeight: true
    Layout.preferredWidth: battery.implicitWidth + Config.bar.shadow * 2
    visible: Config.power.enable

    Rectangle {
        id: rect
        anchors.fill: parent
        color: Base16.get(Config.power.background)
        radius: Config.power.radius

        anchors {
            rightMargin: Config.bar.shadow
            leftMargin: Config.bar.shadow
            topMargin: Config.bar.shadow
            bottomMargin: Config.bar.shadow
        }

        border {
            color: Base16.get(Config.power.border.color)
            width: Config.power.border.width
        }

        Text {
            id: battery
            anchors.centerIn: parent
            opacity: 1
            color: Base16.get(Config.power.foreground)
            font {
                family: "CaskaydiaCove Nerd Font"
                bold: true
                pixelSize: 14
            }
            leftPadding: Config.power.padding.left
            rightPadding: Config.power.padding.right
            text: {
                let result = "";

                if (UPower.isCharging) {
                    if (UPower.percentage <= 0.95)
                        result += (UPower.timeToFull / 3600).toFixed(2).toString() + " Hours to Full";
                    else
                        result += "Fully Charged";
                } else {
                    result += (UPower.timeToEmpty / 3600).toFixed(2).toString() + " Hours to Empty";
                }

                return result;
            }

            Behavior on opacity {
                NumberAnimation {
                    duration: 50
                    easing.type: Easing.Linear
                }
            }
        }
    }

    Behavior on Layout.preferredWidth {
        NumberAnimation {
            duration: 100
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
