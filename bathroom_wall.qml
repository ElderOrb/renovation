import QtQuick 2.0
import QtMultimedia 5.0
import "components"

Rectangle {

    color: "white"
    width: container.width*container.scale + 150
    height: container.height*container.scale + 60

    Box {
        id: container

        y: - 50
        scale: 2
        width: 220
        height: 250
        border.width: 2
        color: "transparent"
        anchors {
            centerIn: parent
            horizontalCenterOffset: -90/scale
        }

        Item {
            id: showerArea

            z: -1
            width: 60
            height: parent.height

            Column {
                // shower
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 80
                    horizontalCenter: parent.horizontalCenter
                }
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
            height: parent.height
            anchors.right: parent.right
            width: parent.width - showerArea.width + 1

            Rectangle {
                width: 1
                height: parent.height
                color: "black"
            }
            Box {
                id: toilet

                width: 35
                height: 78
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    rightMargin: 15
                }

                Box {
                    height: 42
                    width: parent.width
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
                // bide

                spacing: -2
                anchors {
                    right: toilet.left
                    rightMargin: 4
                    top: toilet.top
                    topMargin: 2
                }

                Box {
                    z: 1
                    width: 7
                    height: width
                    radius: width/2
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Box {
                    height: 18
                    width: 5
                    anchors.horizontalCenter: parent.horizontalCenter

                    Box {
                        width: 3
                        height: 30
                        anchors {
                            top: parent.bottom
                            topMargin: -1
                            horizontalCenter: parent.horizontalCenter
                        }

                        Box {
                            height: 3
                            width: 10
                            anchors {
                                right: parent.left
                                rightMargin: -1
                                bottom: parent.bottom
                            }
                            Rectangle {
                                height: 1
                                width: parent.width
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }

            Box {
                id: mirror
                width: 60
                height: 60
                anchors {
                    bottomMargin: 20
                    bottom: washbasinCabinet.top
                    horizontalCenter: washbasinCabinet.horizontalCenter
                }
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
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Box {
                    // tap
                    width: 6
                    height: 16
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
                            height: 29
                            width: parent.width
                        }
                        Box {
                            height: 29
                            width: parent.width
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
                        Box { width: 4; height: 22 }
                    }
                }
            }

            Box {
                // showerWall
                x: 15
                width: 3
                height: 190
                anchors.bottom: parent.bottom
            }
        }

        Person {
            anchors { left: parent.right; leftMargin: 10 }
        }
    }
}


