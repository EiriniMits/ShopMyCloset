import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3


Rectangle {

    Component
    {
        id:vci
        ViewClientsInfo {}
    }

    ToolBar
    {
        id:myToolBar
        height: 44
        width:parent.width
        anchors.right: parent.right
        Rectangle {
            id: rectangle2
            x: -6
            y: -1
            width: 640
            height: 40
            color: "#ffffff"

            ToolButton
            {
                anchors.right: parent.right
                id:addIcon
                x: 0
                y: 1
                width: 50
                height: 40
                anchors.rightMargin: 590
                BackButton{}
            }

            Text {
                id: text1
                x: 277
                y: 8
                text: qsTr("ORDERS")
                horizontalAlignment: Text.AlignLeft
                font.bold: true
                font.family: "Courier"
                font.pixelSize: 18
            }
        }
    }

    GridView
    {
        id:myGridView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: myToolBar.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 10
        model:msg.clientsModel
        cellWidth:210
        cellHeight:210
        delegate: Rectangle
        {
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                stack.push({item:vci, properties:{img:image,itemPrice:price,clientName: name, clientName2: name2, clientCountry:country, clientCity:city, clientAddress:address, clientZip:zip, clientTel:telephone}});
            }
        }
        border.width:2
        width:myGridView.cellWidth-10
        height:width

        Column
        {
            width:parent.width

            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                id:l
                verticalAlignment: Text.AlignVCenter
                height:(parent.width-5)/5
                font.bold: true
                font.family: "Courier"
                text:date

            }

            Image
            {
                anchors.horizontalCenter: parent.horizontalCenter
                id:img
                height:(parent.width-5)*0.8
                width:height
                fillMode: Image.PreserveAspectFit
                source:image
            }
        }
    }
  }
}
