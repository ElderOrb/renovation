import QtQuick 2.5
import "components"

Box {
    width: 380
    height: 270

    Box {
        id: door

        width: 135
        height: 205
        anchors {
            right: parent.right
            rightMargin: 5
            bottom: parent.bottom
        }

        Box {
            anchors {
                fill: parent
                margins: 5
                bottomMargin: 0
            }
            color: Qt.rgba(0.9, 0.9, 0.9, 1.0)

            Label {
                text: parent.height.toString()
                verticalAlignment: Text.AlignVCenter
                x: 5
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    bottomMargin: 15
                }
            }
        }

        Person {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 10
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
        opacity: 0.6
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

    LabelRow {
        height: 35
        anchors.bottom: shelf.top
        anchors.bottomMargin: 30
        model: [25, television.x, television.x + television.width, door.x, door.x + door.width + door.anchors.rightMargin]
        ruler: Rectangle {
            y: -6
            width: 1
            color: "gray"
            height: parent.index > 1 && parent.index < 4 ? 75 : 33
        }
    }

    LabelColumn {
        fontPixelSize: 15
        model: [television.y, television.y + television.height, parent.parent.height]
        anchors {
            left: television.right
            leftMargin: 18
        }
        ruler: Rectangle {
            x: 7
            width: 20
            height: 1
            color: "gray"
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
                    height: shelf.spacing
                    text: shelf.spacing.toString()
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
