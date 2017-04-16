import QtQuick 2.5
import "components"

Box {
    width: 380
    height: 270
    Box {
        id: door
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        height: 200
        width: 130
        Box {
            anchors {
                fill: parent
                margins: 10
                bottomMargin: 0
            }
        }
        Person {
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Box {
        // television
        anchors {
            bottomMargin: 10
            bottom: sideboard.top
            horizontalCenter: sideboard.horizontalCenter
        }
        width: 118.4
        height: 72
        Box {
            anchors {
                fill: parent
                margins: 5
                bottomMargin: 10
            }
        }
    }

    Column {
        id: sideboard
        anchors {
            bottom: parent.bottom
            right: door.left
            rightMargin: (parent.width - door.width - drawer.width - shelf.width)/2
        }
        Box {
            id: drawer
            width: 160
            height: 50

            Rectangle {
                x: 53
                width: 1
                height: parent.height
                color: "black"
            }
            Rectangle {
                height: 1
                x: 53
                width: 54
                color: "black"
                anchors.verticalCenter: parent.verticalCenter
            }
            Rectangle {
                anchors {
                    right: parent.right
                    rightMargin: 53
                }
                width: 1
                color: "black"
                height: parent.height
            }
        }
        Item {
            z: -1
            height: 21
            width: 160
            Box {
                x: 5
                y: -3
                width: 5
                height: 24
                rotation: 15
            }
            Box {
                anchors.right: parent.right
                y: -3
                width: 5
                height: 24
                rotation: 15
                transform: Scale { xScale: -1 }
            }
        }
    }
    Label {
        text: shelf.anchors.bottomMargin.toString()
        verticalAlignment: Text.AlignVCenter
        x: 2
        anchors {
            top: shelf.bottom
            bottom: parent.bottom
            bottomMargin: 15
        }
    }

    Column {
        id: shelf

        spacing: 30
        anchors {
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 130
        }

        Repeater {
            model: 3
            Box {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 25
                height: 5
                Label {
                    text: "30"
                    height: 30
                    visible: model.index < 2
                    verticalAlignment: Text.AlignVCenter
                    anchors {
                        top: parent.bottom
                        topMargin: -1
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
}
