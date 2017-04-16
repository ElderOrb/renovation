import QtQuick 2.0

Column {
    property int lampHeightOffset: -10

    property alias cordHeight: coord.height
    property int absoluteX
    Component.onCompleted: absoluteX = mapToItem(box, width/2, 0).x

    Rectangle {
        id: coord
        height: 100 + lampHeightOffset
        width: 1
        smooth: true
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Rectangle {
        color: "black"
        height: 8.6
        width: 4.9
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Rectangle {
        color: "lightyellow"
        width: 4
        height: 3
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Rectangle {
        color: "lightyellow"
        width: 12
        height: width
        radius: width/2
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
