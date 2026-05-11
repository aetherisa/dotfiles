pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    readonly property var sinkNode: Pipewire.defaultAudioSink
    readonly property var sourceNode: Pipewire.defaultAudioSource

    PwObjectTracker {
        objects: [root.sinkNode, root.sourceNode]
    }

    readonly property var sink: QtObject {
        readonly property bool ready: root.sinkNode.ready
        readonly property int id: ready ? root.sinkNode.id : -1
        readonly property string name: ready ? root.sinkNode.name : ""
        readonly property string nickname: ready ? root.sinkNode.nickname : ""
        readonly property string description: ready ? root.sinkNode.description : ""
        readonly property real volume: ready ? root.sinkNode.audio.volume : 0
        readonly property bool muted: ready ? root.sinkNode.audio.muted : true
    }

    readonly property var source: QtObject {
        readonly property bool ready: root.sourceNode.ready
        readonly property int id: ready ? root.sourceNode.id : -1
        readonly property string name: ready ? root.sourceNode.name : ""
        readonly property string nickname: ready ? root.sourceNode.nickname : ""
        readonly property string description: ready ? root.sourceNode.description : ""
        readonly property real volume: ready ? root.sourceNode.audio.volume : 0
        readonly property bool muted: ready ? root.sourceNode.audio.muted : true
    }

    readonly property string sinkState: {
        if (sink.muted || sink.volume <= 0) {
            return "muted";
        } else if (sink.volume <= 0.33) {
            return "low";
        } else if (sink.volume <= 0.66) {
            return "medium";
        }
        return "high";
    }

    readonly property string sourceState: {
        if (source.muted || source.volume <= 0) {
            return "muted";
        } else if (source.volume <= 0.33) {
            return "low";
        } else if (source.volume <= 0.66) {
            return "medium";
        }
        return "high";
    }
}
