import QtQuick 2.0
import "components"
import QtMultimedia 5.0

Rectangle {

    color: "white"
    width: container.width*container.scale + 20
    height: container.height*container.scale + 20

    Item {
        id: container

        scale: 1
        width: 115
        height: 220
        anchors.centerIn: parent

        Item {
            // borders
            anchors.fill: parent

            Rectangle {
                id: bottomLeftEdge

                width: 1
                height: 65
                color: "black"
                anchors.bottom: parent.bottom
            }

            Rectangle {
                id: topLeftEdge

                height: 1
                width: 18
                color: "black"
                anchors.bottom: bottomLeftEdge.top
            }

            Rectangle {
                width: 1
                color: "black"
                x: topLeftEdge.width
                height: parent.height - bottomLeftEdge.height
            }

            Rectangle {
                width: 1
                color: "black"
                height: parent.height
                anchors.right: parent.right
            }

            Rectangle {
                height: 1
                color: "black"
                width: parent.width - topLeftEdge.width
                anchors.right: parent.right
            }

            Rectangle {
                height: 1
                color: "black"
                width: parent.width
                anchors.bottom: parent.bottom
            }
        }

        Box {
            // sewer grate

            x: 15
            anchors {
                bottom: parent.bottom
                bottomMargin: 19
            }
            width: 19
            height: width
        }

        Item {
            x: topLeftEdge.width + 1

            width: parent.width - x
            height: parent.height - bottomLeftEdge.height

            Box {
                // door
                y: 60
                width: 6
                height: 80
                anchors {
                    right: parent.right
                    rightMargin: -2
                }
            }

            Box {
                // toilet
                x: 5
                y: 11
                width: parent.width - 29.5 - x
                height: 35

                Box {
                    width: 14
                    height: parent.height
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

            Box {
                // bide
                x: -1
                y: 57
                width: 7
                height: width
            }

            Item {
                id: wastePipeAnchor
                y: 99
            }

            Box {
                // washbasin cabinet
                x: -1
                anchors.verticalCenter: wastePipeAnchor.verticalCenter
                y: 65
                width: 49
                height: 60

                Box {
                    // sink
                    x: 12
                    width: parent.width*0.6
                    height: parent.height - 10
                    anchors.verticalCenter: parent.verticalCenter

                    Rectangle {
                        width: 11
                        height: 11
                        radius: width/2
                        anchors { centerIn: parent; horizontalCenterOffset: -5 }
                        border { width: 1; color: "black" }
                    }
                }

                Box {
                    // tap
                    x: 5
                    height: 5
                    width: 5
                    radius: 2
                    anchors.verticalCenter: parent.verticalCenter

                    Box {
                        height: 3
                        width: 10
                        anchors {
                            left: parent.right
                            leftMargin: -1
                            verticalCenter: parent.verticalCenter
                        }
                    }

                    Rectangle {
                        anchors { fill: parent; margins: 1 }
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

                Box {
                    // mirror

                    z: -1
                    width: 3
                    height: parent.height
                }

                Column {
                    spacing: 35
                    anchors.verticalCenter: parent.verticalCenter

                    Repeater {
                        model: 2
                        Box {
                            // lamp
                            width: 15
                            height: 8.6
                        }
                    }
                }
            }

            Row {
                // shower wall
                x: -1
                anchors.bottomMargin: 15
                anchors.bottom: parent.bottom
                spacing: 1

                Box {
                    width: 5
                    height: 3
                }

                Box {
                    property bool open
                    rotation: open ? 90 : 0
                    Behavior on rotation { NumberAnimation {}}
                    transformOrigin: Item.TopLeft
                    width: 42
                    height: 3
                    MouseArea {
                        anchors {
                            fill: parent
                            margins: -20
                        }
                        onClicked: parent.open = !parent.open
                    }
                }

            }
        }

        Item {
            width: parent.width
            height: bottomLeftEdge.height
            anchors.bottom: parent.bottom

            Box {
                // shower
                width: 12
                height: 20
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 20
                }
            }

            Rectangle {

                // person
                width: 43
                height: 21
                radius: 10
                color: "gray"
                anchors {
                    rightMargin: 5
                    right: parent.right
                    verticalCenter: parent.top
                }
            }
        }
    }
}
