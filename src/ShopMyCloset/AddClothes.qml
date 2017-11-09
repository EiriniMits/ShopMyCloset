import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick.Dialogs 1.2

Rectangle
{
    Component
    {
        id:cc
        ChooseColors {}
    }
    Component
    {
        id:cm
        ChooseMaterials {}
    }

    ListModel
    {
        id: colorsModel
    }
    ListModel
    {
        id: materialsModel
    }

    FileDialog {
        id: fileDialog
        nameFilters: [ "Image files (*.jpg *.png)"]
        title: "Please choose a file"
        folder: shortcuts.pictures
        selectFolder:false
        selectMultiple:false
        selectExisting:true
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            img.source=fileDialog.fileUrl;
            fileDialog.close();
        }
        onRejected: {
            console.log("Canceled")
            fileDialog.close();
        }
        Component.onCompleted: visible = false
    }

    ToolBar
    {
        id:myToolBar
        height: 40
        anchors.rightMargin: -2
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.top: parent.top

        SaveButton
        {
            x: 585
            anchors.rightMargin: 7
            anchors.topMargin: 0
            onClicked:
            {
                var A=[];
                var B=[];
                var C=[];

                for (var i=0;i<colorsModel.count;i++)
                {
                    A[i]=colorsModel.get(i).name1;
                }
                for (i=0;i<materialsModel.count;i++)
                {
                    B[i]=materialsModel.get(i).name2;
                    C[i]=materialsModel.get(i).quantity;
                }
                msg.insertItem(item_name.text,brand.text,img.source,description.text,comboBox2.currentText,A,B,C,price.text);
                stack.pop();
            }
        }

        BackButton{}

        Text {
            id: text1
            x: 288
            y: 10
            width: 117
            height: 29
            text: qsTr("ADD A NEW ITEM IN CLOSET")
            font.bold: true
            font.family: "Courier"
            horizontalAlignment: Text.AlignRight
            font.pixelSize: 17
        }
    }

    Column
    {
        anchors.top: myToolBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 2
        spacing:30
        Row
        {
            x: 267
            height:60
            layoutDirection: Qt.LeftToRight
            anchors.horizontalCenter: parent.horizontalCenter
            spacing:9
            TextField
            {
                id:item_name
                font.bold: true
                width: 300
                placeholderText: "Item Name"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                font.family:"Courier"
            }
        }

        Row
        {
            height:150
            anchors.horizontalCenter: parent.horizontalCenter
            spacing :5
            Rectangle
            {
                width:parent.height
                height:width
                border.width: 1
                Image
                {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top:parent.top
                    anchors.bottom: parent.bottom
                    anchors.margins: 1
                    id:img
                    source: "images/images/dress.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Button
            {
                width:30
                height:30
                Image
                {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top:parent.top
                    anchors.bottom: parent.bottom
                    anchors.margins: 1
                    source: "images/images/cameraIcon.png"
                    fillMode: Image.PreserveAspectFit
                }
                onClicked: fileDialog.open();
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 2
        y: 312
        width: 302
        height: 374
        color: "#ffffff"
        Text {
            id: text5
            x: 8
            y: 14
            text: qsTr("Brand Name:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        TextField {
            id: brand
            x: 128
            y: 9
            width: 172
            height: 27
        }

        Text {
            id: text2
            x: 8
            y: 49
            text: qsTr("Description:")
            font.bold: true
            font.family: "Courier"
            font.pixelSize: 16
        }

        TextArea {
            id: description
            x: 8
            y: 71
            width: 292
            height: 100
        }

        Text {
            id: text4
            x: 6
            y: 188
            text: qsTr("Size:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        ComboBox {
            id: comboBox2
            editable: true
            currentIndex: 0
            x: 66
            y: 183
            model: ["XXS","XS","S", "M", "L","XL","XXL"]
        }

        Text {
            id: text3
            x: 6
            y: 229
            text: qsTr("Colors:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        Button {
            id: toolButton1
            x: 89
            y: 229
            width: 39
            height: 34
            Image
            {
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 1
                anchors.topMargin: 0
                source: "images/images/color-wheel-target.svg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked: stack.push({item:cc, properties:{mymodel1: colorsModel}})
        }

        ListView {
            id: listView1
            x: 8
            y: 256
            width: 156
            height: 105
            model:colorsModel
            delegate: Item {
                height:20
                width: parent.width
                Row {
                    spacing:10
                    width:parent.width
                    height:20
                    Label
                    {
                        font.family: "Courier"
                        width:parent.width*0.8
                        text: "• " + name1
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }

    Rectangle {
        id: rectangle2
        x: 373
        y: 316
        width: 185
        height: 215
        color: "#ffffff"

        Text {
            id: text8
            x: 15
            y: 8
            text: qsTr("Composition:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        Button {
            id: toolButton2
            x: 144
            y: 8
            width: 39
            height: 37

            Image {
                id: image1
                width: 39
                height: 37
                source: "images/images/Add-icon.png"
            }
            onClicked:stack.push({item:cm, properties:{mymodel2: materialsModel}})
        }

        ListView {
            id: listView2
            x: 17
            y: 51
            width: 166
            height: 81
            model:materialsModel
            delegate: Item {
                height:20
                width: parent.width
                Row {
                    spacing:10
                    width:parent.width
                    height:20
                    Label
                    {
                        font.family: "Courier"
                        width:parent.width*0.65
                        text: "• "+name2
                        verticalAlignment: Text.AlignVCenter
                    }

                    Label
                    {
                        width:parent.width*0.05
                        text:quantity + "%"
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }

        Text {
            id: text9
            x: 15
            y: 151
            text: qsTr("Price:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        TextField {
            id: price
            x: 85
            y: 149
            width: 64
            height: 21
        }

        Text {
            id: text10
            x: 149
            y: 152
            text: qsTr("$")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }
    }
}
