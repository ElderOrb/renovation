import QtQuick 2.0

Column {
    property alias bulbWidth: bulb.width
    property int absoluteX
    property int lampHeightOffset: -10
    property alias cordHeight: coord.height

    width: 12
    spacing: -1
    Component.onCompleted: absoluteX = mapToItem(box, width/2, 0).x

    Rectangle {
        id: coord
        height: 100 + lampHeightOffset
        width: 1
        smooth: true
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        Label {
            font.pixelSize: 10
            text: parent.height.toString()
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.right
                leftMargin: 2
            }
        }
    }

    Rectangle {
        color: "black"
        height: 9
        width: 4
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        color: "lightyellow"
        width: 3
        height: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.alignWhenCentered: false
    }

    Rectangle {
        id: bulb

        width: 12
        height: width
        radius: width/2
        color: "lightyellow"
        anchors {
            horizontalCenter: parent.horizontalCenter
            alignWhenCentered: false
        }

        Label {
            color: "black"
            font.pixelSize: 5
            text: parent.width.toString()
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.bottom
            }
        }
    }
}
