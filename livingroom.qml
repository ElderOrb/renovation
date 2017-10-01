import QtQuick 2.0
import "components"

Rectangle {

    color: "white"
    width: container.width*container.scale
    height: container.height*container.scale

    Item {
        id: container

        scale: 1
        anchors.centerIn: parent
        width: column.width + 30
        height: column.height + 30

        Column {
            id: column
            anchors.centerIn: parent
            spacing: 20

            HeaderLabel {
                text: "Living room"
            }

            Row {
                id: row
                spacing: 20

                Repeater {
                    model: ListModel {
                        ListElement {
                            source: "livingroom_leftwall.qml"
                            title: "Left wall"
                        }
                        ListElement {
                            source: "livingroom_endwall.qml"
                            title: "End wall"
                        }
                    }

                    Column {
                        spacing: 10
                        anchors.bottom: parent.bottom

                        Loader {
                            id: loader
                            source: model.source
                        }
                        Label {
                            color: "black"
                            text: model.title
                            font.pixelSize: 25
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }
    }
}
