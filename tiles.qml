import QtQuick 2.0

Rectangle {
    id: root
    property real scale: 0.5
    property int viewSize: 400
    property var spacings: [12*scale*multiplier, 15*scale*multiplier, 18*scale*multiplier]
    property size itemSize: Qt.size(215*scale, 65*scale)
    property real multiplier: 1.0

    MouseArea {
        anchors.fill: parent
        onPositionChanged: {
            multiplier = 2* mouseX/width
        }
    }

    Text {
        color: "white"
        height: 5*content.spacing
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 60
        font.family: "Source Sans Pro"
        font.weight: Font.Light
        text: "Tiili " + (itemSize.width/root.scale).toString() + "mm x " + (itemSize.height/root.scale).toString() + "mm"
    }

    color: "#808275"
    width: content.width + content.spacing*2
    height: content.height + content.spacing*6
    Row {
        id: content
        spacing: viewSize/20
        anchors.centerIn: parent
        anchors.verticalCenterOffset: spacing*2

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
                    anchors.centerIn: parent
                    anchors.horizontalCenterOffset: 15
                    anchors.verticalCenterOffset: -6
                    Text {
                        color: "white"
                        font.pixelSize: 130
                        text: Math.round(root.spacing*1.0/root.scale).toString()
                        font.family: "Source Sans Pro"
                        font.weight: Font.Bold
                        id: valueLabel
                    }
                    Text {
                        anchors.baseline: valueLabel.baseline
                        color: "white"
                        font.pixelSize: 40
                        text: "mm"
                        font.family: "Source Sans Pro"
                        font.weight: Font.Bold
                    }
                }
            }
        }
    }
}

