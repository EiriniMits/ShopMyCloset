import QtQuick 2.0
import QtQuick.Controls 1.4

ToolButton
{
    anchors.right: parent.right
    anchors.top: parent.top
    id:addIcon
    width: parent.height
    height:width
    Image
    {
        source: "images/images/done.png"
        anchors.fill: parent
        anchors.margins: 1
    }
}
