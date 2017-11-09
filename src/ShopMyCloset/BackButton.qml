import QtQuick 2.0
import QtQuick.Controls 1.4

ToolButton
{
    anchors.left: parent.left
    anchors.top: parent.top
    width: parent.height
    height:width

    Image
    {
        source: "images/images/arrow-back-128.png"
        anchors.fill: parent
        anchors.margins: 1
    }
    onClicked: stack.pop();
}
