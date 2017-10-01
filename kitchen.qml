import QtQuick 2.0
import "components"

Rectangle {
    color: "white"
    width: container.width*container.scale + 40
    height: container.height*container.scale + 30

    Item {
        id: container

        width: column.width
        height: column.height
        anchors.centerIn: parent

        Column {
            id: column
            spacing: 10

            HeaderLabel {
                text: "Kitchen"
            }

            Row {
                id: row
                spacing: 20
                Repeater {
                    model: ListModel {
                        ListElement {
                            source: "kitchen_endwall.qml"
                            title: "End wall"
                        }
                        ListElement {
                            source: "kitchen_rightwall.qml"
                            title: "Right wall"
                        }
                    }

                    Column {

                        Item {
                            width: 1
                            height: 30 - loader.item.yOffset
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
                        Label {
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: model.title
                            font.pixelSize: 25
                            color: "black"
                        }
                    }
                }
            }
        }
    }
}
