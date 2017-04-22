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

            onImplicitHeightChanged: if (implicitHeight > root.height) root.height = implicitHeight
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            width: model.index > 0 ? value - repeater.itemAt(model.index - 1).value : value
            text: showDecimal ? width.toFixed(1) : width.toString()
            font.pixelSize: fontPixelSize
            height: parent.height

            Loader {
                property int index: model.index

                x: -1
                visible: model.index > 0
                anchors.top: parent.bottom
                sourceComponent: ruler
            }
        }
    }
}
