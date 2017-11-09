import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3


Rectangle {

    property string img
    property string itemPrice
    property string clientName
    property string clientName2
    property string clientCountry
    property string clientCity
    property string clientAddress
    property string clientZip
    property string clientTel

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
                x: 246
                y: 11
                text: qsTr("CLIENT INFO")
                horizontalAlignment: Text.AlignLeft
                font.bold: true
                font.family: "Courier"
                font.pixelSize: 18
            }
        }
    }

    Image {
        id: image1
        x: 0
        y: 50
        width: 211
        height: 249
        source: img
    }

    Text {
        id: text2
        x: 272
        y: 63
        width: 65
        height: 15
        text: qsTr("First Name:")
        font.pixelSize: 12
    }

    Label {
        id: label2
        x: 423
        y: 63
        width: 23
        height: 16
        text: clientName
        font.pointSize: 12
        font.family: "Arial"
    }

    Text {
        id: text3
        x: 272
        y: 105
        text: qsTr("Second Name:")
        font.pixelSize: 12
    }

    Label {
        id: label3
        x: 423
        y: 105
        width: 30
        height: 16
        font.pointSize: 12
        font.family: "Arial"
        text: clientName2
    }

    Text {
        id: text4
        x: 272
        y: 145
        text: qsTr("Country:")
        font.pixelSize: 12
    }

    Label {
        id: label4
        x: 423
        y: 144
        width: 25
        height: 16
        font.pointSize: 12
        font.family: "Arial"
        text: clientCountry
    }

    Text {
        id: text5
        x: 272
        y: 189
        text: qsTr("City:")
        font.pixelSize: 12
    }

    Label {
        id: label5
        x: 423
        y: 188
        width: 31
        height: 16
        font.pointSize: 12
        font.family: "Arial"
        text: clientCity
    }

    Text {
        id: text6
        x: 272
        y: 229
        text: qsTr("Address:")
        font.pixelSize: 12
    }

    Label {
        id: label6
        x: 423
        y: 228
        width: 25
        height: 16
        font.pointSize: 12
        font.family: "Arial"
        text: clientAddress
    }

    Text {
        id: text7
        x: 272
        y: 272
        text: qsTr("Post/Zip Code:")
        font.pixelSize: 12
    }

    Label {
        id: label7
        x: 423
        y: 271
        width: 30
        height: 16
        font.pointSize: 12
        font.family: "Arial"
        text: clientZip
    }

    Text {
        id: text8
        x: 272
        y: 317
        text: qsTr("Phone:")
        font.pixelSize: 12
    }

    Label {
        id: label8
        x: 424
        y: 316
        width: 30
        height: 16
        font.pointSize: 12
        font.family: "Arial"
        text: clientTel
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 353
        width: 640
        height: 96
        color: "#e9e8e8"

        Text {
            id: text10
            x: 273
            y: 15
            text: qsTr("Item Price:")
            font.pixelSize: 12
            font.family: "Courier"
        }

        Text {
            id: text12
            x: 422
            y: 15
            text: itemPrice+"$"
            font.pixelSize: 12
            font.family: "Courier"
        }

        Text {
            id: text11
            x: 273
            y: 36
            text: qsTr("Shipping:")
            font.pixelSize: 12
            font.family: "Courier"
        }

        Text {
            id: text13
            x: 422
            y: 36
            text: qsTr("5.00$")
            font.pixelSize: 12
            font.family: "Courier"
        }

        Text {
            id: text9
            x: 273
            y: 69
            text: qsTr("Order Price:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 13
        }

        Label {
            id: label1
            x: 423
            y: 68
            width: 35
            height: 16
            font.pointSize: 13
            font.family: "Courier"
            text: (Number(itemPrice)+5).toFixed(2)+"$"
            font.bold: true
        }

        Rectangle {
            id: rectangle3
            x: 8
            y: 54
            width: 586
            height: 3
            color: "#ffffff"
        }
    }
}
