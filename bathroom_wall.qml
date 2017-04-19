import QtQuick 2.0
import QtMultimedia 5.0
import "components"

Rectangle {

    color: "white"
    width: container.width*container.scale + 20
    height: container.height*container.scale + 20

    Row {
        id: container

        scale: 1
        spacing: 20
        anchors.centerIn: parent
        Box {
            id: wall
            width: 220
            height: 224
            border.width: 1
            color: "transparent"

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
                        rightMargin: 11
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
                    id: lamps
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
                            color: "lightyellow"
                        }
                    }
                }

                Column {
                    // bide

                    spacing: -2
                    anchors {
                        right: parent.right
                        rightMargin: 57
                        bottom: parent.bottom
                        bottomMargin: 76
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
                                width: 15
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

                Row {
                    anchors.bottom: parent.top
                    anchors.bottomMargin: 5
                    Repeater {
                        id: repeater2
                        model: [lamps.x, lamps.x + 8.6, lamps.x + lamps.width - 8.6, lamps.x + lamps.width, parent.parent.width]
                        Label {
                            opacity: model.index === 0 ? 0.0 : 1.0
                            property real value: modelData
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            width: model.index > 0 ? value - repeater2.itemAt(model.index - 1).value : value
                            text: width.toFixed(1)
                            font.pixelSize: 12
                            Rectangle {
                                anchors.top: parent.bottom
                                height: 20
                                width: 1
                                x: -1

                                color: "gray"
                            }
                        }
                    }
                }
                Column {
                    anchors {
                        left: lamps.right
                        leftMargin: 20
                    }
                    Repeater {
                        id: repeater
                        model: [lamps.y, lamps.y + lamps.height, mirror.y]
                        Label {
                            property int value: modelData
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            height: model.index > 0 ? value - repeater.itemAt(model.index - 1).value : value
                            text: height.toString()
                            font.pixelSize: 12
                            Rectangle {
                               anchors.bottom: parent.bottom
                                anchors.right: parent.left
                                anchors.rightMargin: 3
                                width: 15
                                height: 1
                                y: -1
                                color: "gray"
                            }
                        }
                    }
                }
                Box {
                    id: mirror
                    width: 60
                    height: 70
                    anchors {
                        bottomMargin: 15
                        bottom: washbasinCabinet.top
                        horizontalCenter: washbasinCabinet.horizontalCenter
                    }
                    Label {
                        anchors.centerIn: parent
                        text: "60x70"
                    }
                }

                Item {
                    id: wastePipeAnchor
                    anchors {
                        right: parent.right
                        rightMargin: 99
                    }
                }

                Column {
                    id: washbasinCabinet
                    anchors {
                        bottom: parent.bottom
                        horizontalCenter: wastePipeAnchor.horizontalCenter
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


            Box {
                height: 3
                width: 10
                anchors {
                    right: parent.right
                    rightMargin: 49
                    bottom: parent.bottom
                    bottomMargin: 152
                }
            }
        }
        Item {
            height: wall.height
            width: person.width
            Person { id: person }
        }
    }
}
