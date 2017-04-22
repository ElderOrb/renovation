import QtQuick 2.0

Row {
    id: root
    property alias model: repeater.model
    property int fontPixelSize: 20
    property bool showDecimal
    property Component ruler: Rectangle {
        width: 1
        height: 20
        color: "gray"
    }
    Repeater {
        id: repeater
        Label {
            property real value: modelData
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            width: model.index > 0 ? value - repeater.itemAt(model.index - 1).value : value
            onImplicitHeightChanged: if (implicitHeight > root.height) root.height = implicitHeight
            height: parent.height

            anchors.verticalCenter: parent.verticalCenter
            text: showDecimal ? width.toFixed(1) : width.toString()
            font.pixelSize: fontPixelSize
            Loader {
                x: -1
                visible: model.index > 0
                property int index: model.index
                anchors.top: parent.bottom
                sourceComponent: ruler
            }
        }
    }
}
