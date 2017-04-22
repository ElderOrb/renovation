import QtQuick 2.5
import "components"

Box {
    width: row.width
    height: row.height
    color: "transparent"

    Row {
        id: row
        z: -1

        Box {
            clip: true
            width: 220
            height: 270
            color: "transparent"

            Person {
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
                text: shelf.width.toString()
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
                text: "33"
                fontSizeMode: Text.HorizontalFit
                anchors {
                    left: parent.left
                    leftMargin: 6
                    bottom: shelf.top
                    bottomMargin: -height/2 - 5/2 + 1
                }
            }

            Label {
                text: "33"
                fontSizeMode: Text.HorizontalFit
                anchors {
                    right: parent.right
                    rightMargin: 6
                    bottom: shelf.top
                    bottomMargin: -height/2 - 5/2 + 1
                }
            }

            Column {
                id: shelf
                spacing: 30
                anchors {
                    bottomMargin: 130
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }

                Repeater {
                    model: 3
                    Box {
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
                text: shelf.anchors.bottomMargin.toString()
                anchors {
                    top: shelf.bottom
                    bottom: parent.bottom
                    bottomMargin: 15
                    horizontalCenter: parent.horizontalCenter
                }
                verticalAlignment: Text.AlignVCenter
            }

            Box {
                x: 27
                width: 8
                height: width
                radius: width/2
                anchors { bottom: parent.bottom; bottomMargin: 110 }
            }

            Box {
                x: 119
                width: 8
                height: width
                radius: width/2
                anchors { bottom: parent.bottom; bottomMargin: 14 }
            }
        }
    }
}
