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
        width: column.width + 40
        height: column.height + 40

        Column {
            id: column
            spacing: 20
            anchors.centerIn: parent
            Label {
                color: "black"
                text: "Kylpyhuone"
                font.pixelSize: 40
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Row {
                id: row
                spacing: 20

                Repeater {
                    model: ListModel {
                        ListElement {
                            source: "bathroom_groundplan.qml"
                            title: "Pohjapiirros"
                        }
                        ListElement {
                            source: "bathroom_wall.qml"
                            title: "Päätyseinä"
                        }
                    }

                    Column {
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
