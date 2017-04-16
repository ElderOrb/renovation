import QtQuick 2.0
import "components"

Box {
    // walls
    // color: "#999999"
    width: floor.width + 20
    height: floor.height + 20
    Box {
        id: floor
        // color: "#ece3da"
        height: 360
        width: 255 + 70
        anchors.right: parent.right

        Item {
            height: 360
            width: 255

            Item {
                anchors.horizontalCenter: parent.horizontalCenter
                y: 120
                Box {
                    anchors.centerIn: parent
                    width: 12
                    height: 4
                    // color: "#62615d"
                }
                Box {
                    anchors.centerIn: parent
                    width: 4
                    height: 12
                    // color: "#62615d"
                }
            }

            Label {
                text: "KK 255"
                horizontalAlignment: Text.AlignHCenter
                y: 5
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                visible: false
                text: "82.5"
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: table.left
                }
                horizontalAlignment: Text.AlignHCenter
            }

            Box {
                id: table
                width: 90
                height: 180
                // color: "#938983"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                Label {
                    text: "30"
                    anchors.centerIn: parent
                    // color: "#62615d"
                }
                Label {
                    text: "180"
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 5
                    }
                }
                Label {
                    text: "90"
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: parent.top
                        bottomMargin: 5
                    }
                }

                Label {
                    text: "35"
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        bottom: lamps.top
                    }
                    verticalAlignment: Text.AlignVCenter
                }
                Label {
                    text: "35"
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: lamps.bottom
                        bottom: parent.bottom
                    }
                    verticalAlignment: Text.AlignVCenter
                }

                Column {
                    id: lamps
                    anchors.centerIn: parent
                    spacing: 30
                    Repeater {
                        model: 2
                        Box {
                            // lamp
                            // color: "#62615d"
                            width: 40
                            height: 40
                            radius: width/2
                            Label {
                                text: "40"
                                // color: "#938983"
                                anchors.centerIn: parent
                            }

                        }
                    }
                }
            }
        }
        Box {
            id: coldCabinets
            // color: "white"
            width: 70
            height: 140
            anchors.right: parent.right
        }
        Label {
            text: "OH"
            y: 5
            anchors {
                top: coldCabinets.bottom
                bottom: parent.bottom
                right: parent.right
                rightMargin: 5
            }
            verticalAlignment: Text.AlignVCenter
        }

    }
}
