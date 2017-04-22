import QtQuick 2.5
import "components"

Box {
    width: 380
    height: 270

    Box {
        id: door
        anchors {
            right: parent.right
            rightMargin: 5
            bottom: parent.bottom
        }
        height: 205
        width: 135

        Box {
            anchors {
                fill: parent
                margins: 5
                bottomMargin: 0
            }
            Label {
                text: parent.height.toString()
                verticalAlignment: Text.AlignVCenter
                x: 5
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    bottomMargin: 15
                }
                font.pixelSize: 15
            }
        }
        Person {
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Box {
        id: television
        anchors {
            bottomMargin: 15
            bottom: sideboard.top
            horizontalCenter: sideboard.horizontalCenter
        }
        width: 124
        height: 75

        Box {
            anchors {
                fill: parent
                margins: 5
                bottomMargin: 10
            }
        }
    }

    Label {
        anchors {
            top: television.bottom
            bottom: sideboard.top
            horizontalCenter: television.horizontalCenter
        }
        verticalAlignment: Text.AlignVCenter

        text: height.toString()
        font.pixelSize: 15
    }

    Column {
        id: sideboard
        opacity: 0.3
        anchors {
            bottom: parent.bottom
            right: door.left
            rightMargin: (parent.width - door.width - door.anchors.rightMargin - drawer.width - shelf.width)/2
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
            clip: true
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

    Row {
        height: 35
        anchors.bottom: shelf.top
        anchors.bottomMargin: 10

        Repeater {
            id: repeater
            model: [25, television.x, television.x + television.width, door.x, door.x + door.width + door.anchors.rightMargin]

            Label {
                property int value: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                width: model.index > 0 ? value - repeater.itemAt(model.index - 1).value : modelData
                text: width === 51 ? "50" : width.toString()
                height: parent.height
                Rectangle {
                    y: 10
                    height: model.index > 1 && model.index < 4 ? 75 : 20
                    width: 1
                    color: "gray"
                }
            }
        }
    }

    Column {
        anchors {
            left: television.right
            leftMargin: 22
        }

        Repeater {
            id: repeater2
            model: [television.y, television.y + television.height, parent.parent.height]

            Label {
                property int value: modelData
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                height: model.index > 0 ? value - repeater2.itemAt(model.index - 1).value : modelData
                text: (model.index === 0 ? "\n\n" : "") +  height.toString()
                font.pixelSize: 15

                Rectangle {
                    width: 20
                    x: -width
                    height: 1
                    color: "gray"
                }
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
                    height: shelf.spacing.toString()
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
