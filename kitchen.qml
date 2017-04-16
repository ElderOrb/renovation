import QtQuick 2.0
import "components"

Rectangle {
    color: "white"
    width: container.width*container.scale + 40
    height: container.height*container.scale + 70


    Item {
        id: container
        scale: 1
        y: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width: column.width
        height: column.height

        Column {
            anchors {
                bottom: parent.bottom
                right: parent.right
                bottomMargin: -30
            }

            spacing: 5
            Label {
                color: "black"
                text: "Hyllyt 110cm x 30cm x 5cm"
                anchors.right: parent.right
            }
            Label {
                color: "black"
                text: "Pöytä 90cm x 180cm"
                anchors.right: parent.right
            }
        }

        Column {
            id: column
            spacing: 10
            Label {
                color: "black"
                text: "Keittiö"
                font.pixelSize: 30
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Row {
                id: row
                spacing: 20
                Repeater {
                    model: ListModel {
                        ListElement {
                            source: "kitchen_endwall.qml"
                            title: "Päätyseinä"
                        }
                        ListElement {
                            source: "kitchen_rightwall.qml"
                            title: "Oikea seinä"
                        }
                    }

                    Column {
                        Label {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: model.title
                            color: "black"
                        }
                        Item {
                            width: 1
                            height: 30 -loader.item.yOffset
                        }
                        Rectangle {
                            width: loader.width + 2
                            height: loader.height + 2
                            color: "transparent"
                            Loader {
                                id: loader
                                anchors.centerIn: parent
                                source: model.source
                            }
                        }
                    }
                }
            }
        }
    }
}
