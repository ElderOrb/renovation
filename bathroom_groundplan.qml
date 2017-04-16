import QtQuick 2.0
import "components"
import QtMultimedia 5.0

/*
Bathroom
- dimensions (100-120)x(64+156)x250
- washbasin cabinet 60x49x(25+64=89 legs-drawer, 64=6+29+29)
- toilet 70x35x(42-78)
- mirror 60x96cm http://www.ikea.com/fi/fi/catalog/products/10182165/#/30149132
- shower wall 48x190
- lamps 8.6x15x14
*/

Rectangle {

    color: "white"
    width: container.width*container.scale + 60
    height: container.height*container.scale + 60

    Item {
        id: container

        y: - 50
        scale: 2
        width: 120
        height: 220
        anchors.centerIn: parent

        Item {
            // borders
            anchors.fill: parent

            Rectangle {
                id: bottomLeftEdge

                width: 2
                height: 60
                color: "black"
                anchors.bottom: parent.bottom
            }

            Rectangle {
                id: topLeftEdge

                height: 2
                width: 20
                color: "black"
                anchors.bottom: bottomLeftEdge.top
            }

            Rectangle {
                width: 2
                color: "black"
                x: topLeftEdge.width
                height: parent.height - bottomLeftEdge.height
            }

            Rectangle {
                width: 2
                color: "black"
                height: parent.height
                anchors.right: parent.right
            }

            Rectangle {
                height: 2
                color: "black"
                width: parent.width - 20
                anchors.right: parent.right
            }

            Rectangle {
                height: 2
                color: "black"
                width: parent.width
                anchors.bottom: parent.bottom
            }
        }

        Item {
            x: 21

            width: parent.width - x
            height: parent.height - bottomLeftEdge.height

            Box {
                // door
                y: 60
                width: 6
                height: 70
                anchors {
                    right: parent.right
                    rightMargin: -2
                }
            }

            Box {
                // toilet
                y: 15
                width: 67
                height: 35

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
                // washbasin cabinet
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
                    width: 3
                    height: parent.height
                }
                Column {
                    spacing: 20
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

            Rectangle {

                // person
                width: 43
                height: 21
                radius: 10
                color: "gray"
                anchors {
                    rightMargin: 4
                    right: parent.right
                    verticalCenter: parent.top
                    verticalCenterOffset: -15
                }

                Rectangle {

                    // head
                    radius: 8
                    width: 17
                    height: 21
                    color: "gray"
                    anchors.centerIn: parent
                }
            }
        }
    }
}
