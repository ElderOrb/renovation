import QtQuick 2.0
import "components"

Box {
    // walls
    width: floor.width + 20
    height: floor.height + 20

    Box {
        id: floor

        height: 360
        width: 255 + 70
        anchors.right: parent.right

        Item {
            width: 255
            height: 360

            Item {
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
            }

            Label {
                y: 5
                text: "KK 255"
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                visible: false
                text: "82.5"
                anchors {
                    left: parent.left
                    right: table.left
                    bottom: parent.bottom
                }
                horizontalAlignment: Text.AlignHCenter
            }

            Box {
                id: table
                width: 90
                height: 180
                anchors {
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }

                Label {
                    text: "30"
                    anchors.centerIn: parent
                }

                Label {
                    text: "180"
                    anchors {
                        left: parent.right
                        leftMargin: 5
                        verticalCenter: parent.verticalCenter
                    }
                }

                Label {
                    text: "90"
                    anchors {
                        bottom: parent.top
                        bottomMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }
                }

                Label {
                    text: "35"
                    verticalAlignment: Text.AlignVCenter
                    anchors {
                        top: parent.top
                        bottom: lamps.top
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                Label {
                    text: "35"
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
                    spacing: 30
                    Repeater {
                        model: 2
                        Box {
                            width: 40
                            height: 40
                            radius: width/2
                            Label {
                                text: "40"
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
            text: "OH"
            verticalAlignment: Text.AlignVCenter
            anchors {
                top: coldCabinets.bottom
                bottom: parent.bottom
                right: parent.right
                rightMargin: 5
            }
        }
    }
}
