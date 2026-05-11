import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services

Rectangle {
    Layout.preferredHeight: 16
    Layout.preferredWidth: Layout.preferredHeight
    Layout.alignment: Qt.AlignVCenter

    color: Base16.get("base0B")
    radius: height / 2
}
