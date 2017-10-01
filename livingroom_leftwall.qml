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
            color: Qt.rgba(0.9, 0.9, 0.9, 1.0)

            Label {
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 5
                    left: parent.left
                    right: pillar.left
                }
                horizontalAlignment: Text.AlignHCenter
                text: width.toString()
            }

            Box {
                id: pillar
                x: 42
                width: 32
                height: parent.height

                Label {
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }
                    text: parent.width.toString()
                }

                SmallLabel {
                    text: "Pillar"
                    anchors.centerIn: parent
                }
            }

            Person {
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: parent.height.toString()
                anchors {
                    rightMargin: 5
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }

            Label {
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 5
                    left: pillar.right
                    right: parent.right
                }
                horizontalAlignment: Text.AlignHCenter
                text: width.toString()
            }
        }

        Rectangle {
            width: 186
            height: 270
            color: "white"

            Label {
                text: shelf.width.toString()
                anchors {
                    bottomMargin: 5
                    bottom: shelf.top
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                text: parent.width.toString()
                anchors {
                    bottomMargin: 10
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                text: ((parent.width - shelf.width)/2).toString()
                fontSizeMode: Text.HorizontalFit
                anchors {
                    left: parent.left
                    leftMargin: 6
                    bottom: shelf.top
                    bottomMargin: -height/2 - 5/2 + 1
                }
            }

            Label {
                text: ((parent.width - shelf.width)/2).toString()
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
                            text: shelf.spacing.toString()
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
                // light switch
                x: 27
                width: 8
                height: width
                radius: width/2
                anchors { bottom: parent.bottom; bottomMargin: 110 }
            }

            Box {
                // socket
                x: 119
                width: 8
                height: width
                radius: width/2
                anchors { bottom: parent.bottom; bottomMargin: 14 }
            }
        }
    }
}
