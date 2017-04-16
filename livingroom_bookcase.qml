import QtQuick 2.5
import "components"

Row {
    Rectangle {
        width: 220
        height: 270
        color: "#CCCCCC"
        clip: true

        Person {
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
            color: "white"
            text: "270"
        }
    }
    Rectangle {
        width: 186
        height: 270
        color: "white"

        Label {
            id: shelfWidth
            anchors.horizontalCenter: parent.horizontalCenter
            text: "120"
            anchors.bottom: shelf.top
            anchors.bottomMargin: 5
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            text: "186"
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
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 130
            width: parent.width
            spacing: 30

            Repeater {
                model: 3
                Rectangle {
                    color: "#938983"
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 120
                    height: 5
                    Label {
                        height: 30
                        anchors {
                            top: parent.bottom
                            topMargin: -1
                            horizontalCenter: parent.horizontalCenter
                        }
                        verticalAlignment: Text.AlignVCenter
                        text: "30"
                        visible: model.index < 2
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
            width: 8
            height: width
            radius: width/2
            color: "#CCCCCC"
            x: 27
            anchors {
                bottom: parent.bottom
                bottomMargin: 110
            }
        }
        Rectangle {
            width: 8
            height: width
            radius: width/2
            color: "#CCCCCC"
            x: 119
            anchors {
                bottom: parent.bottom
                bottomMargin: 14
            }
        }
        Rectangle {
            width: parent.width
            height: 1
            color: "gray"
            anchors {
                bottom: parent.bottom
                bottomMargin: 5
            }
        }
    }
}

