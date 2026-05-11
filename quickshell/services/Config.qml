pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    property alias wallpaper: json.wallpaper
    property alias bar: json.bar
    property alias volume: json.volume
    property alias power: json.power
    property alias date: json.date

    FileView {
        path: Qt.resolvedUrl("../config.json")

        watchChanges: true
        onFileChanged: reload()

        JsonAdapter {
            id: json
            property JsonObject wallpaper: JsonObject {
                property bool enable
                property string background
            }
            property JsonObject bar: JsonObject {
                property bool enable
                property JsonObject margin: JsonObject {
                    property int top
                    property int bottom
                    property int right
                    property int left
                }
                property int height
                property int shadow
            }
            property JsonObject volume: JsonObject {
                property bool enable
                property JsonObject padding: JsonObject {
                    property int left
                    property int right
                }
                property JsonObject icons: JsonObject {
                    property string muted
                    property string low
                    property string medium
                    property string high
                    property string micMuted
                }
                property string background
                property string foreground
                property real radius
                property JsonObject border: JsonObject {
                    property int width
                    property string color
                }
            }
            property JsonObject power: JsonObject {
                property bool enable
                property JsonObject padding: JsonObject {
                    property int left
                    property int right
                }
                property string background
                property string foreground
                property real radius
                property JsonObject border: JsonObject {
                    property int width
                    property string color
                }
            }
            property JsonObject date: JsonObject {
                property bool enable
                property JsonObject padding: JsonObject {
                    property int left
                    property int right
                }
                property string background
                property string foreground
                property real radius
                property string format
                property int updatePerSec
                property JsonObject border: JsonObject {
                    property int width
                    property string color
                }
            }
        }
    }
}
