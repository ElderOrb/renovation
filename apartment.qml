import QtQuick 2.0
import "components"

Rectangle {

    color: "white"
    width: flickable.width
    height: flickable.height
    Flickable {
        id: flickable
        contentHeight: container.height
        width: container.width
        height: 720
        Item {
            id: container

            width: column.width + 40
            height: column.height + 40

            Column {
                id: column
                anchors.centerIn: parent
                Repeater {
                    model: ["kitchen.qml", "livingroom.qml", "bathroom.qml"]
                    Loader {
                        source: modelData
                        anchors.horizontalCenter: model.index === 2 ? null : parent.horizontalCenter
                    }
                }
            }
            Loader {
                anchors.bottom: column.bottom
                anchors.right: column.right
                source: "diningarea_table.qml"
            }
        }
    }
}
