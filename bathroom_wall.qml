import QtQuick 2.0
import "components"
import QtMultimedia 5.0

Rectangle {

    color: "white"
    width: container.width*container.scale + 150
    height: container.height*container.scale + 60

    Box {
        id: container

        y: - 50
        scale: 2
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -90/scale
        width: 220
        height: 250
        border.width: 2
        color: "transparent"
        Item {
            z: -1
            id: showerArea
            width: 60
            height: parent.height
            Column {
                // shower
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 80
                spacing: -1
                Box {
                    width: 26
                    height: 8
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Box {
                    width: 4
                    height: 100
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Row {
                    height: 10
                    spacing: -1
                    anchors.horizontalCenter: parent.horizontalCenter
                    Box {
                        width: 5
                        height: parent.height
                    }
                    Box {
                        width: 30
                        height: parent.height
                    }
                    Box {
                        width: 5
                        height: parent.height
                    }
                }

            }
        }

        Item {
            z: -1
            Rectangle {
                width: 1
                height: parent.height
                color: "black"
            }

            height: parent.height
            width: parent.width - showerArea.width + 1
            anchors.right: parent.right

            Box {
                id: toilet
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    rightMargin: 15
                }

                width: 35
                height: 78
                Box {
                    width: parent.width
                    height: 42
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: toiletSound.play()
                }

                Audio {
                    id: toiletSound
                    source: "sounds/toilet.m4a"
                }
            }
            Row {
                anchors.bottom: mirror.top
                anchors.bottomMargin: 5

                anchors.horizontalCenter: mirror.horizontalCenter
                spacing: 35
                Repeater {
                    model: 2
                    Box {
                        // lamp
                        height: 14
                        width: 8.6
                    }
                }
            }

            Column {
                anchors {
                    right: toilet.left
                    rightMargin: 4
                    top: toilet.top
                    topMargin: 2
                }
                spacing: -2
                Box {
                    z: 1
                    width: 7
                    height: width
                    radius: width/2
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Box {
                    // bide
                    height: 18
                    width: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    Box {
                        width: 3
                        height: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        anchors.topMargin: -1
                        Box {
                            height: 3
                            width: 10
                            anchors.right: parent.left
                            anchors.rightMargin: -1
                            anchors.bottom: parent.bottom
                            Rectangle {
                                height: 1
                                anchors.verticalCenter: parent.verticalCenter
                                width: parent.width
                            }
                        }
                    }
                }
            }



            Box {
                id: mirror
                anchors.horizontalCenter: washbasinCabinet.horizontalCenter
                anchors.bottom: washbasinCabinet.top
                anchors.bottomMargin: 20
                width: 60
                height: 60
            }

            Column {
                id: washbasinCabinet
                anchors {
                    right: parent.right
                    rightMargin: 65
                    bottom: parent.bottom
                }
                spacing: -1

                Rectangle {
                    color: "black"
                    height: 4
                    width: 2
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                }


                Box {
                    // tap
                    height: 16
                    width: 6
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item {
                    // drawer
                    width: 60
                    height: drawer.height
                    Column {
                        id: drawer
                        width: parent.width
                        spacing: -1
                        Box {
                            width: parent.width + 2
                            height: 6
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Box {
                            width: parent.width
                            height: 29
                        }
                        Box {
                            width: parent.width
                            height: 29
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: sinkSound.play()
                    }
                    Audio {
                        id: sinkSound
                        source: "sounds/sink.m4a"
                    }
                }
                Row {
                    // legs
                    spacing: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    Repeater {
                        model: 2
                        Box {
                            height: 22
                            width: 4
                        }
                    }
                }
            }

            Box {
                // showerWall
                width: 3
                height: 190
                anchors.bottom: parent.bottom
                x: 15
            }
        }

        Person {
            anchors {
                left: parent.right
                leftMargin: 10
            }
        }
    }
}


