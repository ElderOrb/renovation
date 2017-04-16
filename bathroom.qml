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
        width: row.width + 40
        height: row.height + 40

        Column {
            x: 50
            y: 25
            spacing: 5
            Label {
                color: "black"
                text: "Kylpyhuone"
                font.pixelSize: 40
            }
        }

        Row {
            id: row
            spacing: 20
            anchors.centerIn: parent

            Repeater {
                model: ListModel {
                    ListElement {
                        source: "bathroom_groundplan.qml"
                        title: "Pohjapiirros"
                    }
                    ListElement {
                        source: "bathroom_wall.qml"
                        title: "Peräseinä"
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
