import QtQuick 2.5
import "components"

Box {
    width: row.width
    height: row.height
    color: "transparent"

    Row {
        id: row
        z: -1
        Rectangle {
            clip: true
            width: 220
            height: 270
            color: "#CCCCCC"

            Person {
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                text: "270"
                color: "white"
                anchors {
                    rightMargin: 5
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }

        Rectangle {
            width: 186
            height: 270
            color: "white"

            Label {
                id: shelfWidth
                text: "120"
                anchors {
                    bottomMargin: 5
                    bottom: shelf.top
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Label {
                text: "186"
                anchors {
                    bottomMargin: 10
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                text: "23      + "
                fontSizeMode: Text.HorizontalFit
                anchors {
                    left: parent.left
                    leftMargin: 6
                    bottom: shelf.top
                    bottomMargin: 5
                }
            }

            Label {
                text: "+     23"
                fontSizeMode: Text.HorizontalFit
                anchors {
                    right: parent.right
                    rightMargin: 6
                    bottom: shelf.top
                    bottomMargin: 5
                }
            }

            Column {
                id: shelf
                spacing: 30
                width: parent.width
                anchors { bottom: parent.bottom; bottomMargin: 130 }

                Repeater {
                    model: 3
                    Rectangle {
                        color: "#938983"
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 120
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

            Label {
                text: "130"
                anchors {
                    top: shelf.bottom
                    bottom: parent.bottom
                    bottomMargin: 15
                    horizontalCenter: parent.horizontalCenter
                }
                verticalAlignment: Text.AlignVCenter
            }

            Rectangle {
                x: 27
                width: 8
                height: width
                radius: width/2
                color: "#CCCCCC"
                anchors { bottom: parent.bottom; bottomMargin: 110 }
            }

            Rectangle {
                x: 119
                width: 8
                height: width
                radius: width/2
                color: "#CCCCCC"
                anchors { bottom: parent.bottom; bottomMargin: 14 }
            }

            Rectangle {
                width: parent.width
                height: 1
                color: "gray"
                anchors { bottom: parent.bottom; bottomMargin: 5 }
            }
        }
    }
}
