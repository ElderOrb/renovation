import QtQuick 2.0

Column {
    property color color: "gray"
    width: 32
    spacing: 2

    Rectangle {
        width: parent.width
        height: width
        color: parent.color
        radius: width/2
    }

    Rectangle {
        color: parent.color
        width: parent.width
        height: 166 + radius - 2 - width - leftLeg.height // head and spacing
        radius: width/2
    }
    Row {
        spacing: parent.spacing
        height: implicitHeight - leftLeg.radius*3
        width: parent.width
        Rectangle {
            id: leftLeg
            height: 85
            width: (parent.width - parent.spacing)/2
            color: parent.parent.color
            radius: width/2
            anchors.bottom: parent.bottom
        }
        Rectangle {
            width: (parent.width - parent.spacing)/2
            height: leftLeg.height
            color: parent.parent.color
            radius: width/2
            anchors.bottom: parent.bottom
        }
    }
    anchors {
        bottom: parent.bottom
        bottomMargin: 2
    }
}
