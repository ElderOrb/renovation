import QtQuick 2.0
import "components"

Rectangle {
    property int lampWidth: 12
    property alias yOffset: labelRow.height

    color: "white"
    width: column.width
    height: column.height

    Column {
        id: column
        x: 10

        LabelRow {
            id: labelRow
            model: [lamp1.absoluteX, lamp2.absoluteX, lamp3.absoluteX, lamp4.absoluteX, lamp5.absoluteX, lamp6.absoluteX, lamp7.absoluteX, box.width]
            height: implicitHeight + 10
            ruler: null
        }

        Box {
            id: box

            y: 30
            width: 315
            height: 270

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
                            text: parent.width.toString()
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
                    x: 25 - lampWidth/2
                    spacing: 25 - lampWidth
                    Lamp {
                        id: lamp1
                        cordHeight: 90
                        bulbWidth: 12.5
                    }
                    Lamp {
                        id: lamp2
                        cordHeight: 80
                        bulbWidth: 6

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
                        bulbWidth: 9.5
                    }
                    Lamp {
                        id: lamp4
                        cordHeight: 100
                        bulbWidth: 12.5
                    }
                    Lamp {
                        id: lamp5
                        cordHeight: 85
                        bulbWidth: 6
                    }
                    Lamp {
                        id: lamp6
                        cordHeight: 95
                        bulbWidth: 6
                    }
                    Lamp {
                        id: lamp7
                        cordHeight: 105
                        bulbWidth: 9.5
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
                            text: shelf.spacing.toString()
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
                text: shelf.anchors.bottomMargin.toString()
                verticalAlignment: Text.AlignVCenter
                anchors {
                    top: shelf.bottom
                    bottom: table.top
                    right: parent.right
                    rightMargin: 5
                }
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
                width: parent.width
                anchors.bottom: parent.bottom

                Rectangle {
                    // table top
                    height: 4
                    width: parent.width
                    color: "black"
                }

                Row {
                    width: parent.width
                    Column {
                        id: cabins

                        width: parent.width - corner.width
                        Row {

                            height: 70
                            width: parent.width
                            Item {
                                Label {
                                    anchors {
                                        right: parent.left
                                        rightMargin: 4
                                        verticalCenter: parent.verticalCenter
                                    }
                                    text: parent.height.toString()
                                }

                                width: 12
                                height: parent.height
                            }

                            Segment {
                                // clothing washer
                                Rectangle {
                                    color: "black"
                                    y: 2
                                    height: 1
                                    width: parent.width
                                }
                                SmallLabel {
                                    text: "Clothing\nWasher"
                                    anchors.centerIn: parent
                                }
                            }

                            Segment {
                                // oven
                                Rectangle {
                                    color: "black"
                                    height: 1
                                    width: parent.width
                                    y: 12
                                }
                                Row {
                                    y: 6
                                    spacing: 16
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    Repeater {
                                        model: 2
                                        Box {
                                            width: 4
                                            height: width
                                            radius: width/2
                                        }
                                    }
                                }

                                Box {
                                    width: parent.width - 20
                                    y: 17
                                    height: 34
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    SmallLabel {
                                        text: "Oven"
                                        anchors.centerIn: parent
                                    }

                                }

                                Rectangle {
                                    color: "black"
                                    anchors {
                                        bottom: parent.bottom
                                        bottomMargin: 7
                                    }
                                    height: 1
                                    width: parent.width
                                }
                                Rectangle {
                                    color: "black"
                                    width: 1
                                    height: parent.height
                                }
                            }

                            Segment {
                                // sink drawer
                                Rectangle {
                                    color: "black"
                                    height: 1
                                    width: parent.width
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                Box {
                                    y: -1
                                    width: 50
                                    height: 21 - 4
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    SmallLabel {
                                        text: "Sink"
                                        anchors.centerIn: parent
                                    }
                                }

                                Column {
                                    // tap
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.bottom: parent.top
                                    Rectangle {
                                        color: "black"
                                        width: 3
                                        height: 19
                                        anchors.horizontalCenter: parent.horizontalCenter
                                    }
                                    Rectangle {
                                        color: "black"
                                        width: 7
                                        height: 15
                                    }
                                }
                                height: parent.height
                            }
                            Segment {
                                // dish washer
                                Rectangle {
                                    color: "black"
                                    y: 2
                                    height: 1
                                    width: parent.width
                                }
                                SmallLabel {
                                    text: "Dish\nWasher"
                                    anchors.centerIn: parent
                                }
                                Rectangle {
                                    color: "black"
                                    height: parent.height
                                    anchors.right: parent.right
                                    width: 1
                                }
                            }
                        }

                        Box {
                            // cabin list
                            Label {
                                anchors {
                                    right: parent.left
                                    rightMargin: 4
                                    verticalCenter: parent.verticalCenter
                                }
                                text: parent.height.toString()
                            }

                            color: "white"
                            width: parent.width
                            height: 16
                        }
                    }

                    Rectangle {
                        id: corner
                        color: "gray"
                        width: 63
                        height: cabins.height
                    }
                }
            }
        }
    }
}
