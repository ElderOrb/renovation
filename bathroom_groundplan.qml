import QtQuick 2.0
import "components"
import QtMultimedia 5.0

Rectangle {

    color: "white"
    width: container.width*container.scale + 60
    height: container.height*container.scale + 60

    Item {
        id: container

        y: - 50
        scale: 2
        anchors.centerIn: parent
        width: 120
        height: 220

        Item {
            // borders
            anchors.fill: parent
            Rectangle {
                id: bottomLeft

                width: 2
                height: 60
                color: "black"
                anchors.bottom: parent.bottom
            }

            Rectangle {
                id: edge

                height: 2
                width: 20
                color: "black"
                anchors.bottom: bottomLeft.top
            }

            Rectangle {
                width: 2
                color: "black"
                x: edge.width
                height: parent.height - bottomLeft.height
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
            height: parent.height - bottomLeft.height

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
                // washbasinCabinet
                y: 65
                width: 49
                height: 60
                Box {
                    // sink
                    x: 12
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height - 10
                    width: parent.width*0.6
                    Rectangle {
                        width: 11
                        height: 11
                        radius: width/2
                        anchors.centerIn: parent
                        anchors.horizontalCenterOffset: -5
                        border.width: 1
                        border.color: "black"
                    }
                }
                Box {
                    // tap
                    x: 5
                    height: 5
                    width: 5
                    radius: 2

                    Box {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.right
                        anchors.leftMargin: -1
                        height: 3
                        width: 10
                    }

                    anchors.verticalCenter: parent.verticalCenter

                    Rectangle {
                        anchors {
                            fill: parent
                            margins: 1
                        }
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
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 20
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
                // showerWall
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
            height: bottomLeft.height
            anchors.bottom: parent.bottom

            Rectangle {

                // person
                width: 43
                height: 21
                radius: 10
                color: "gray"
                anchors {
                    verticalCenter: parent.top
                    verticalCenterOffset: -15
                    right: parent.right
                    rightMargin: 4
                }

                Rectangle {

                    // head
                    width: 17
                    height: 21
                    color: "gray"
                    anchors.centerIn: parent
                    radius: 8
                }
            }
        }
    }
}

/*
Kylpyhuone
- Pohjapiirros
- Takaseinä
- kylpyhuone (100-120)x(64+156)x250
- washbasinCabinet 60x49x(25+64=89 jalat-kaappi, 64=6+29+29)
- vessa 70x35x(42-78 - pönttö-selkänoja)
- peili 60x96cm http://www.ikea.com/fi/fi/catalog/products/10182165/#/30149132
- showerWall hietakari 48x190 https://www.netrauta.fi/kylpyhuone/suihkuseinat-ja-nurkat/suihkuseinat/suihkuseina-hietakari-express-812-kaantyva-670x1900mm-kirkas
- 2 Nordlux Marina 8.6x15x14 -lamppua, mutta niihin minulla ei ole vielä mittoja http://media.taloon.com/image/upload/q_70,f_auto,w_400,h_650,c_limit/cloud/k/nordlux/seinavalaisin-nordlux-marina-maxi-ip44-140x245x225mm-mustaopaali-lasi-2.jpg
http://www.taloon.info/pdf/nordlux/seinavalaisin_marina_ip44_86x150x140_mm_kromi_opaali_lasi_asennusohje.pdf
*/
