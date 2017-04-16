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
                        text: parent.width == 26 ? 25 : (parent.width == 64 ? 65 : parent.width)
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }

        Box {
            id: box
            width: 315
            height: 270
            y: 30
            color: "transparent"

            Image {
                id: image
                anchors.centerIn: parent
                source: "images/kitchen_endwall.png"
                scale: 1/2.133333
                z: -1
                anchors.horizontalCenterOffset: 6
                anchors.verticalCenterOffset: 23
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
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.top
                            text: "5"
                            font.pixelSize: 8
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
                anchors.left: cookerHood.right
                anchors.right: shelf.left
                Row {
                    x: 20-lampWidth/2
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
                anchors.bottom: table.top
                anchors.bottomMargin: 50
                anchors.right: parent.right

                spacing: 20

                Repeater {
                    model: 3
                    Box {
                        width: 30

                        height: 5
                        Label {

                            height: 20
                            anchors {
                                top: parent.bottom
                                topMargin: -1
                                horizontalCenter: parent.horizontalCenter
                            }
                            verticalAlignment: Text.AlignVCenter
                            text: "20"
                            visible: model.index < 2
                        }
                    }
                }
            }

            Label {
                text: "50"
                anchors {
                    top: shelf.bottom
                    bottom: table.top
                    right: parent.right
                    rightMargin: 5
                }
                verticalAlignment: Text.AlignVCenter
            }

            Rectangle {
                color: "white"
                anchors.fill: cookerHood
                anchors.margins: -5
            }

            Column {
                id: cookerHood
                anchors {
                    bottom: table.top
                    bottomMargin: 62
                }
                x: 11 + 60

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
                width: parent.width
                anchors.bottom: parent.bottom
                visible: false
                Rectangle {
                    // table top
                    height: 4
                    width: parent.width
                    color: "black"
                }
                opacity: 0.3
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

