import QtQuick 2.0
import "components"

Rectangle {
    color: "white"
    width: container.width*container.scale + 40
    height: container.height*container.scale + 30

    Item {
        id: container

        scale: 1
        width: column.width
        height: column.height
        anchors.centerIn: parent


        Column {
            id: column
            spacing: 15

            HeaderLabel {
                text: "Dining area"
            }

            Loader {
                source: "diningarea_table.qml"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
