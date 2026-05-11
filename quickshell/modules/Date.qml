import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Io
import qs.services

Item {
    Layout.fillHeight: true
    Layout.preferredWidth: date.implicitWidth + Config.bar.shadow * 2
    visible: Config.date.enable

    Rectangle {
        id: rect

        anchors.fill: parent
        color: Base16.get(Config.date.background)
        radius: Config.date.radius

        anchors {
            rightMargin: Config.bar.shadow
            leftMargin: Config.bar.shadow
            topMargin: Config.bar.shadow
            bottomMargin: Config.bar.shadow
        }

        border {
            color: Base16.get(Config.date.border.color)
            width: Config.date.border.width
        }

        Text {
            id: date
            anchors.centerIn: parent
            color: Base16.get(Config.date.foreground)
            font {
                pixelSize: 14
                bold: true
                family: "CaskaydiaCove Nerd Font"
            }
            leftPadding: Config.date.padding.left
            rightPadding: Config.date.padding.right
        }

        Process {
            id: process
            running: false
            command: ["date", "+" + Config.date.format]
            stdout: StdioCollector {
                onStreamFinished: date.text = this.text.trim()
            }
        }

        Timer {
            interval: Config.date.updatePerSec * 1000
            running: true
            repeat: true
            triggeredOnStart: true
            onTriggered: process.running = true
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
