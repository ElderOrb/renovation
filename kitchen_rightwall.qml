import QtQuick 2.5
import "components"

Rectangle {
    property int yOffset
    width: 149 + 40 + 120
    height: 270
    color: "transparent"
    border.width: 1
    border.color: "black"
    Row {
        z: -1
        height: parent.height
        Item {
            width: 149
            height: parent.height
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "149"
            }

            Label {
                id: shelfWidth
                anchors.horizontalCenter: parent.horizontalCenter
                text: "110"
                anchors.bottom: shelf.top
                anchors.bottomMargin: 5
            }

            Label {
                text: "19.5  + "
                fontSizeMode: Text.HorizontalFit
                anchors {
                    left: parent.left
                    leftMargin: 2
                    bottom: shelf.top
                    bottomMargin: 5
                }
            }
            Label {
                text: "+  19.5"
                fontSizeMode: Text.HorizontalFit
                anchors {
                    right: parent.right
                    rightMargin: 2
                    bottom: shelf.top
                    bottomMargin: 5
                }
            }

            Column {
                id: shelf
                anchors.bottom: table.top
                anchors.bottomMargin: 50
                width: parent.width
                spacing: 20

                Repeater {
                    model: 3
                    Rectangle {
                        color: "#938983"
                        x: 15
                        width: parent.width - 2*x
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
                    horizontalCenter: parent.horizontalCenter
                }
                verticalAlignment: Text.AlignVCenter
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
                        color: "gray"
                        width: 60
                        height: parent.height
                        Label {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "60"
                            color: "white"
                        }
                        Label {
                            x: 5
                            anchors.verticalCenter: parent.verticalCenter
                            text: "70"
                            color: "white"
                        }
                    }
                    Column {
                        width: 80
                        Rectangle {
                            color: "white"
                            width: parent.width
                            height: 20
                        }
                        Rectangle {
                            color: "gray"
                            width: parent.width
                            height: 1
                        }
                        Rectangle {
                            color: "white"
                            width: parent.width
                            height: 25
                        }
                        Rectangle {
                            color: "gray"
                            width: parent.width
                            height: 1
                        }
                        Rectangle {
                            color: "white"
                            width: parent.width
                            height: 25
                        }
                    }
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
        Rectangle {
            width: 1
            height: parent.height
            color: "gray"
        }
        Rectangle {
            width: 39
            height: parent.height
            color: "white"
            Rectangle {
                width: parent.width
                height: 1
                color: "gray"
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
            Rectangle {
                width: parent.width
                height: 1
                color: "gray"
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 84
                }
            }

            clip: true

            Person {
                anchors.horizontalCenter: parent.horizontalCenter
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
            Rectangle {
                width: parent.width
                height: 1
                color: "gray"
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 84
                }
            }
        }
    }
}
