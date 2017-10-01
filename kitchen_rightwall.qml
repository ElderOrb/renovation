import QtQuick 2.5
import "components"

Rectangle {
    property int yOffset
    height: 270
    width: 149 + 40 + 120
    color: "transparent"
    border { width: 1; color: "black" }

    Row {
        z: -1
        height: parent.height

        Item {
            width: 149
            height: parent.height

            Label {
                text: parent.width.toString()
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: shelf.width.toString()
                anchors {
                    bottom: shelf.top
                    bottomMargin: 5
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                id: shelf
                anchors { bottom: table.top; bottomMargin: 50 }
                x: 19.5
                width: parent.width - 2*x
                spacing: 20

                Repeater {
                    model: 3

                    Box {
                        // drawer
                        height: 5
                        width: parent.width

                        Label {
                            text: height.toString()
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
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Column {
                id: table
                width: parent.width
                anchors.bottom: parent.bottom

                Rectangle {
                    height: 4
                    width: parent.width
                    color: "black"
                }

                Row {
                    height: 70
                    width: parent.width

                    Rectangle {
                        id: corner
                        width: 60
                        height: parent.height
                        color: "gray"
                        Label {
                            text: parent.width.toString()
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Label {
                            x: 5
                            text: parent.height.toString()
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Column {
                        // drawer

                        width: parent.width - corner.width
                        Rectangle {
                            height: 20
                            color: "white"
                            width: parent.width
                        }
                        Rectangle {
                            color: "gray"
                            height: 1
                            width: parent.width
                        }
                        Rectangle {
                            height: 25
                            color: "white"
                            width: parent.width
                        }
                        Rectangle {
                            color: "gray"
                            height: 1
                            width: parent.width
                        }
                        Rectangle {
                            height: 25
                            color: "white"
                            width: parent.width
                        }
                    }
                }

                Rectangle {
                    height: 1
                    color: "gray"
                    width: parent.width
                }

                Rectangle {
                    height: 15
                    color: "white"
                    width: parent.width
                }
            }
        }

        Column {
            width: longCabinets
            height: parent.height
            Box {
                id: topWall
                width: parent.width
                height: 34
            }

            Row {
                id: longCabinets
                z: 1
                height: parent.height - topWall.height - cabinetList.height - 1

                Cabinet {
                    // dry goods drawer
                    width: 40
                    SmallLabel {
                        y: 40
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Dry\nGoods"
                    }
                }

                Cabinet {
                    // first cold cabinet
                    SmallLabel {
                        y: 40
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Fridge"
                    }
                    Person {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: -cabinetList.height + 1
                    }
                }

                Cabinet {
                    // second cold cabinet
                    SmallLabel {
                        y: 40
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Fridge"
                    }
                    SmallLabel {
                        anchors {
                            bottom: parent.bottom
                            bottomMargin: 30
                        }

                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Freezer"
                    }

                }
            }
            Rectangle {
                color: "gray"
                height: 1
                width: parent.width
            }

            Rectangle {
                id: cabinetList
                height: 15
                color: "white"
                width: parent.width
            }
        }
    }
}
