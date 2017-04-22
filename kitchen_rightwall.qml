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
                id: shelfWidth
                text: "110"
                anchors {
                    bottom: shelf.top
                    bottomMargin: 5
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Repeater {
                model: 2
                Label {
                    text: "19.5"
                    fontSizeMode: Text.HorizontalFit
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    anchors {
                        left: model.index == 0 ? parent.left : undefined
                        leftMargin: 2
                        right: model.index == 1 ? parent.right : undefined
                        rightMargin: 2
                        bottom: shelf.top
                    }
                }
            }


            Column {
                id: shelf
                anchors { bottom: table.top; bottomMargin: 50 }
                x: 15
                width: parent.width - 2*x
                spacing: 20

                Repeater {
                    model: 3

                    Box {
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
                text: "50"
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
                        width: 60
                        height: parent.height
                        color: "gray"
                        Label {
                            text: "60"
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Label {
                            x: 5
                            text: "70"
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Column {
                        width: 80
                        Rectangle {
                            height: 20
                            color: "white"
                            width: parent.width
                        }
                        Rectangle {
                            height: 1
                            color: "gray"
                            width: parent.width
                        }
                        Rectangle {
                            height: 25
                            color: "white"
                            width: parent.width
                        }
                        Rectangle {
                            height: 1
                            color: "gray"
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

        Rectangle {
            width: 1
            height: parent.height
            color: "gray"
        }

        Rectangle {
            width: 39
            color: "white"
            height: parent.height
            Rectangle {
                height: 1
                color: "gray"
                width: parent.width
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 84
                }
            }
        }

        Rectangle {
            width: 1
            height: parent.height
            color: "gray"
        }

        Rectangle {
            width: 59
            height: parent.height
            color: "white"
            clip: true
            Rectangle {
                height: 1
                width: parent.width
                color: "gray"
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 84
                }
            }

            Person {
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            width: 1
            color: "gray"
            height: parent.height
        }

        Rectangle {
            width: 59
            height: parent.height
            color: "white"
            Rectangle {
                height: 1
                color: "gray"
                width: parent.width
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 84
                }
            }
        }
    }
}
