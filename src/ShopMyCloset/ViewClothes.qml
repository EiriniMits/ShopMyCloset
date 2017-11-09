import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle
{
    property string itemId
    property string itemName
    property string itemBrand
    property string img
    property string itemDescription
    property string itemSize
    property string itemColor
    property string itemComposition
    property string itemPrice

    Component
    {
        id:buy
        BuyForm {}
    }

    ToolBar
    {
        id:myToolBar
        height: 44
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:parent.top

        Rectangle {
            id: rectangle1
            x: -6
            y: 0
            width: 640
            height: 43
            color: "#ffffff"

            BackButton{ anchors.leftMargin: 0; anchors.topMargin: 0}

            Text {
                id: name
                x: 177
                y: 13
                width: 255
                height: 15
                text:itemName
                horizontalAlignment: Text.AlignHCenter
                font.family: "Courier"
                font.bold: true
                font.pixelSize: 17
            }
        }
    }

    Rectangle {
        id: rectangle2
        x: 13
        y: 344
        width: 270
        height: 320
        color: "#ffffff"

        Text {
            id: text2
            x: 0
            y: 9
            text: qsTr("Brand:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        Label {
            id: label1
            x: 73
            y: 9
            width: 197
            height: 16
            text: itemBrand
            font.family: "Courier"
            font.pointSize: 16
        }

        Text {
            id: text3
            x: 0
            y: 48
            text: qsTr("Description:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        TextArea {
            id: textArea1
            x: 0
            wrapMode: Text.Wrap
            text:itemDescription
            y: 70
            width: 267
            height: 96
        }

        Text {
            id: text4
            x: 0
            y: 188
            text: qsTr("Size:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        Label {
            id: size
            x: 61
            y: 188
            width: 206
            height: 16
            text: itemSize
            font.family: "Courier"
            font.pointSize: 16
        }

        Text {
            id: text5
            x: 0
            y: 223
            text: qsTr("Colors:")
            font.bold: true
            font.family: "Courier"
            font.pixelSize: 16
        }


        Label {
            id: label3
            x: 83
            y: 223
            width: 184
            height: 97
            text: itemColor
            font.family: "Courier"
            font.pointSize: 14
        }
    }

    Rectangle {
        id: rectangle4
        x: 8
        y: 43
        width: 624
        height: 276
        color: "#ffffff"

        Image {
            id: image2
            x: 165
            y: 0
            width: 294
            height: 276
            fillMode: Image.PreserveAspectFit
            source:img
        }
    }

    Rectangle {
        id: rectangle3
        x: 339
        y: 344
        width: 293
        height: 320
        color: "#ffffff"

        Text {
            id: text6
            x: 16
            y: 8
            text: qsTr("Composition:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        Label {
            id: label4
            x: 16
            y: 39
            width: 269
            height: 61
            text:itemComposition
            font.family: "Courier"
            font.pointSize: 14
        }

        Text {
            id: text7
            x: 16
            y: 116
            text: qsTr("Price:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        Label {
            id: price
            x: 86
            y: 116
            width: 34
            height: 19
            text: itemPrice+"$"
            font.bold: true
            font.family: "Courier"
            font.pointSize: 15
        }

        ToolButton {
            id: toolButton1
            x: 16
            y: 161
            width: 161
            height: 46

            Image {
                id: image1
                x: -6
                y: 0
                width: 167
                height: 46
                source: "images/images/buy-now.png"
            }
            onClicked:
            {
                stack.push({item:buy, properties:{itemId:itemId, itemName:itemName,img: img, itemSize:itemSize,itemPrice:itemPrice}});
            }
        }
    }
}
