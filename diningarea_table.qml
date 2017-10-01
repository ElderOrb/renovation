import QtQuick 2.0
import "components"

Box {
    height: 360
    width: 255 + 70
    anchors.right: parent.right

    Item {
        width: 255
        height: 360

        Item {
            // original lamp position

            y: 120
            anchors.horizontalCenter: parent.horizontalCenter

            Box {
                width: 12
                height: 4
                anchors.centerIn: parent
            }
            Box {
                width: 4
                height: 12
                anchors.centerIn: parent
            }
            Rectangle {
                width: 10
                height: 2
                anchors.centerIn: parent
            }
        }

        Label {
            y: 5
            text: "255"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label {
            text: width.toString()
            anchors {
                left: parent.left
                right: table.left
                bottom: parent.bottom
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Repeater {
            // chairs
            model: 2
            Column {
                anchors.verticalCenter: table.verticalCenter
                x: table.x + (model.index === 0 ? - width + 1 : table.width - 1)

                property int index: model.index
                spacing: 20
                Repeater {
                    model: 3
                    Box {
                        // chair
                        height: 35
                        width: 8
                    }
                }
            }
        }

        Box {
            id: table
            width: 100
            height: 200
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: lamps.spacing.toString()
                anchors.centerIn: parent
            }

            Label {
                text: table.height.toString()
                anchors {
                    left: parent.right
                    leftMargin: 15
                    verticalCenter: parent.verticalCenter
                }
            }

            Label {
                text: table.width.toString()
                anchors {
                    bottom: parent.top
                    bottomMargin: 5
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                text: ((table.height - lamps.height)/2).toString()
                verticalAlignment: Text.AlignVCenter
                anchors {
                    top: parent.top
                    bottom: lamps.top
                    horizontalCenter: parent.horizontalCenter
                }
            }
            Label {
                text: ((table.height - lamps.height)/2).toString()
                verticalAlignment: Text.AlignVCenter
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: lamps.bottom
                    bottom: parent.bottom
                }
            }

            Column {
                id: lamps
                anchors.centerIn: parent
                spacing: 35
                Repeater {
                    model: 2
                    Box {
                        // lamp
                        width: 40
                        height: width
                        radius: width/2
                        color: "lightyellow"

                        Label {
                            text: parent.width.toString()
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }

    Box {
        id: coldCabinets
        width: 70
        height: 140
        anchors.right: parent.right
    }

    Label {
        y: 5
        text: (parent.height - coldCabinets.height).toString()
        verticalAlignment: Text.AlignVCenter
        anchors {
            top: coldCabinets.bottom
            bottom: parent.bottom
            right: parent.right
            rightMargin: 5
        }
    }
}
