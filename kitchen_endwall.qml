import QtQuick 2.0
import "components"

Rectangle {
    property int lampWidth: 12
    property alias yOffset: labelRow.height

    color: "white"
    width: image.width*image.scale
    height: image.height*image.scale

    Column {
        x: 10

        Row {
            id: labelRow

            Repeater {
                id: repeater
                model: [lamp1.absoluteX, lamp2.absoluteX, lamp3.absoluteX, lamp4.absoluteX, lamp5.absoluteX, lamp6.absoluteX, lamp7.absoluteX, box.width]

                Item {
                    property int absoluteX: modelData
                    width: modelData - x // (model.index === 0 ? 0 : repeater.itemAt(model.index -1).absoluteX)
                    height: label.height + 5
                    Label {
                        id: label
                        text: parent.width == 26 ? 25 : (parent.width == 64 ? 65 : (parent.width == 101 ? 100 : parent.width))
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }

        Box {
            id: box

            y: 30
            width: 315
            height: 270
            color: "transparent"

            Image {
                id: image
                z: -1
                scale: 1/2.133333
                source: "images/kitchen_endwall.png"
                anchors {
                    centerIn: parent
                    verticalCenterOffset: 23
                    horizontalCenterOffset: 6
                }
            }

            Box {
                height: 3
                width: lamp7.absoluteX - x + 5
                anchors {
                    left: leftLamps.left
                    leftMargin: lamp1.parent.x + lamp1.width/2 - 5
                }

                Repeater {
                    model: 2

                    Item {
                        width: 5
                        height: 2
                        x: model.index == 0 ? 0 : parent.width - width
                        Label {
                            text: "5"
                            font.pixelSize: 8
                            anchors {
                                bottom: parent.top
                                horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }
            }

            Item {
                id: leftLamps
                width: cookerHood.x
                Row {
                    x: 25-lampWidth/2
                    spacing: 25 - lampWidth
                    Lamp {
                        id: lamp1
                        cordHeight: 90
                    }
                    Lamp {
                        id: lamp2
                        cordHeight: 80
                    }
                }
            }

            Item {
                id: rightLamps
                anchors { left: cookerHood.right; right: shelf.left }

                Row {
                    x: 20 - lampWidth/2
                    spacing: 25 - lampWidth

                    Lamp {
                        id: lamp3
                        cordHeight: 80
                    }
                    Lamp {
                        id: lamp4
                        cordHeight: 100
                    }
                    Lamp {
                        id: lamp5
                        cordHeight: 85
                    }
                    Lamp {
                        id: lamp6
                        cordHeight: 95
                    }
                    Lamp {
                        id: lamp7
                        cordHeight: 105
                    }
                }
            }

            Column {
                id: shelf
                spacing: 20
                anchors {
                    bottom: table.top
                    bottomMargin: 50
                    right: parent.right
                }

                Repeater {
                    model: 3

                    Box {
                        width: 30
                        height: 5
                        Label {
                            text: "20"
                            height: 20
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

            Label {
                text: "50"
                verticalAlignment: Text.AlignVCenter
                anchors {
                    top: shelf.bottom
                    bottom: table.top
                    right: parent.right
                    rightMargin: 5
                }
            }

            Rectangle {
                color: "white"
                anchors { fill: cookerHood; margins: -5 }
            }

            Column {
                id: cookerHood
                x: 11 + 60
                anchors { bottom: table.top; bottomMargin: 62 }

                Rectangle {
                    height: 75
                    width: 24
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "black"
                }

                Rectangle {
                    height: 5
                    width: 60
                    color: "black"
                }
            }

            Column {
                id: table

                opacity: 0.3
                visible: false
                width: parent.width
                anchors.bottom: parent.bottom

                Rectangle {
                    // table top
                    height: 4
                    width: parent.width
                    color: "black"
                }
                Rectangle {
                    // boxes
                    color: "white"
                    height: 70
                    width: parent.width
                }
                Rectangle {
                    color: "gray"
                    width: parent.width
                    height: 1
                }
                Rectangle {
                    color: "white"
                    width: parent.width
                    height: 15
                }
            }
        }
    }
}

