import QtQuick 2.0

Rectangle {
    id: tiles

    property real scale: 0.5
    property int viewSize: 400
    property real multiplier: 1.0
    property var spacings: [12*scale*multiplier, 15*scale*multiplier, 18*scale*multiplier]
    property size itemSize: Qt.size(215*scale, 65*scale)

    color: "#808275"
    width: content.width + content.spacing*2
    height: content.height + content.spacing*6

    MouseArea {
        anchors.fill: parent
        onPositionChanged: multiplier = Math.max(0.0, 2* mouseX/width)
    }

    Text {
        color: "white"
        height: 5*content.spacing
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Tiili " + (itemSize.width/tiles.scale).toString() + "mm x " + (itemSize.height/tiles.scale).toString() + "mm"
        font {
            pixelSize: 60
            weight: Font.Light
            family: "Source Sans Pro"
        }
    }

    Row {
        id: content

        spacing: viewSize/20
        anchors {
            centerIn: parent
            verticalCenterOffset: spacing*2
        }

        Repeater {
            model: spacings

            Rectangle {
                id: root

                property real spacing: modelData
                property int rowCount: (viewSize + spacing) / (itemSize.width +  spacing) + 2
                property int columnCount: (viewSize + spacing) / (itemSize.height +  spacing) + 1

                clip: true
                width: viewSize
                height: viewSize
                color: "#808275"

                Column {

                    spacing: root.spacing
                    anchors.centerIn: parent

                    Repeater {
                        model: columnCount

                        Row {
                            x: model.index % 2 === 0 ? -itemSize.width/2 : 0
                            spacing: root.spacing
                            Repeater {
                                model: rowCount

                                Rectangle {
                                    color: "#aaaaaa"
                                    width: itemSize.width
                                    height: itemSize.height
                                }
                            }
                        }
                    }
                }
                Row {
                    spacing: 10
                    anchors {
                        centerIn: parent
                        verticalCenterOffset: -6
                        horizontalCenterOffset: 15
                    }

                    Text {
                        id: valueLabel

                        color: "white"
                        text: Math.round(root.spacing*1.0/root.scale).toString()
                        font {
                            pixelSize: 130
                            weight: Font.Bold
                            family: "Source Sans Pro"
                        }
                    }

                    Text {
                        text: "mm"
                        color: "white"
                        anchors.baseline: valueLabel.baseline
                        font {
                            pixelSize: 40
                            weight: Font.Bold
                            family: "Source Sans Pro"
                        }
                    }
                }
            }
        }
    }
}
