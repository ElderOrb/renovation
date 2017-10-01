import QtQuick 2.0

Item {
    width: 60
    height: parent.height

    Label {
        anchors {
            bottom: parent.top
            bottomMargin: 5
            horizontalCenter: parent.horizontalCenter
        }
        text: parent.width.toString()
    }

    Item {
        // top shelf
        width: parent.width
        height: 28
        Rectangle {
            color: "gray"
            height: 1
            width: parent.width
            anchors.bottom: parent.bottom
        }
    }


    Rectangle {
        width: 1
        color: "black"
        height: parent.height
    }

    Rectangle {
        height: 1
        color: "gray"
        width: parent.width
        anchors {
            bottom: parent.bottom
            bottomMargin: 68
        }
    }
}
