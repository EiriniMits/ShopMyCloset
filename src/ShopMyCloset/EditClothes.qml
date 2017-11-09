import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick.Dialogs 1.2

Rectangle
{
    property string itemId
    property string itemName
    property string itemBrand
    property string image
    property string itemDescription
    property int itemSize
    property string itemColor
    property string itemComposition
    property string itemPrice

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

    MessageDialog {
        id: messageDialog4
        icon: StandardIcon.Question
        text: "Are you Sure you want to Save your Changes?"
        standardButtons: StandardButton.Yes |  StandardButton.No
        onYes: {
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

            if(colorsModel.count===0 && materialsModel.count===0){
                //msg.deleteItem(item_name.text);
                msg.changeItem1(itemId,item_name.text,brand.text,img.source,description.text,comboBox2.currentText,price.text);
                msg.deleteItem(itemId);
                stack.pop();
                stack.pop();
            }
            else if(materialsModel.count===0){
                msg.changeItem2(itemId,item_name.text,brand.text,img.source,description.text,comboBox2.currentText,A,price.text);
                msg.deleteItem(itemId);
                stack.pop();
                stack.pop();
            }
            else if(colorsModel.count===0){
                msg.changeItem3(itemId,item_name.text,brand.text,img.source,description.text,comboBox2.currentText,B,C,price.text);
                msg.deleteItem(itemId);
                stack.pop();
                stack.pop();
            }
            else{
                msg.insertItem(item_name.text,brand.text,img.source,description.text,comboBox2.currentText,A,B,C,price.text);
                msg.deleteItem(itemId);
                stack.pop();
                stack.pop();
            }
            messageDialog4.close();
        }
        onNo: messageDialog4.close();
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
                messageDialog4.open();
            }
        }

        BackButton{}

        Text {
            id: text1
            x: 288
            y: 10
            width: 117
            height: 29
            text: qsTr("MAKE CHANGES - EDIT")
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
            TextEdit
            {
                id:item_name
                width: 300
                text: itemName
                cursorVisible: true
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                font.family:"Verdana"
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
                    source: image
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
                onClicked:fileDialog.open();
            }
        }

        Rectangle {
            id: rectangle1
            width: 300
            height: 400
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

            TextEdit {
                id: brand
                x: 120
                y: 14
                text:itemBrand
                cursorVisible: true
                width: 172
                height: 27
                wrapMode: TextEdit.Wrap
                font.pixelSize: 16
                font.family: "Courier"
            }

            Flickable {
                id: flick
                x: 0
                y: 47
                width: 300; height: 149
                clip: true
                function ensureVisible(r)
                {
                    if (contentX >= r.x)
                        contentX = r.x;
                    else if (contentX+width <= r.x+r.width)
                        contentX = r.x+r.width-width;
                    if (contentY >= r.y)
                        contentY = r.y;
                    else if (contentY+height <= r.y+r.height)
                        contentY = r.y+r.height-height;
                }

                Text {
                    id: text2
                    x: 8
                    y: 9
                    text: qsTr("Description:")
                    font.bold: true
                    font.family: "Courier"
                    font.pixelSize: 16
                }

                TextEdit{
                    id: description
                    x: 8
                    y: 31
                    width: 292
                    text:itemDescription
                    cursorVisible: true
                    focus: true
                    wrapMode: TextEdit.Wrap
                    onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
                    height: 100
                    font.pixelSize: 15
                }
            }

            ComboBox {
                id: comboBox2
                editable: true
                x: 66
                y: 183
                currentIndex: itemSize
                model: ["XXS","XS","S", "M", "L","XL","XXL"]
            }

            Text {
                id: text4
                x: 8
                y: 188
                text: qsTr("Size:")
                font.family: "Courier"
                font.bold: true
                font.pixelSize: 16
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
                x: 237
                y: 252
                width: 39
                height: 34
                Image
                {
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 2
                    anchors.topMargin: 0
                    source: "images/images/color-wheel-target.svg"
                    fillMode: Image.PreserveAspectFit
                    anchors.fill: parent
                    anchors.margins: 1
                }
                onClicked:stack.push({item:cc, properties:{mymodel1: colorsModel}})
            }

            Label {
                id: label3
                x: 6
                y: 292
                width: 124
                height: 100
                text: itemColor
                font.family: "Courier"
                font.bold: false
                font.pointSize: 12
            }

            ListView {
                id: listView1
                x: 145
                y: 292
                width: 131
                height: 100
                model:colorsModel
                delegate: Item {
                    height:20
                    width: parent.width
                    Row {
                        spacing:15
                        width:parent.width
                        height:30
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

            Rectangle {
                id: rectangle2
                x: 128
                y: 251
                width: 2
                height: 131
                color: "#f0efef"
            }

            Rectangle {
                id: rectangle4
                x: 6
                y: 251
                width: 270
                height: 4
                color: "#f0efef"
            }

            Text {
                id: text6
                x: 25
                y: 261
                text: qsTr("Already Chosen")
                font.underline: true
                font.pixelSize: 12
            }

            Text {
                id: text7
                x: 160
                y: 261
                text: qsTr("Choose New")
                font.underline: true
                font.pixelSize: 12
            }
        }
    }

    Rectangle {
        id: rectangle3
        x: 373
        y: 316
        width: 187
        height: 291
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
        Label {
            id: label4
            x: 16
            y: 69
            width: 163
            height: 59
            text:itemComposition
            font.family: "Courier"
            font.bold: false
            font.pointSize: 12
        }

        Button {
            id: toolButton2
            x: 146
            y: 134
            width: 39
            height: 37

            Image {
                id: image1
                x: 0
                y: 0
                width: 39
                height: 37
                source: "images/images/Add-icon.png"
            }
            onClicked: stack.push({item:cm, properties:{mymodel2: materialsModel}})
        }

        ListView {
            id: listView2
            x: 19
            y: 172
            width: 166
            height: 66
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
                        text: "• " +name2
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
            id: text11
            x: 37
            y: 145
            text: qsTr("Choose New")
            font.underline: true
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle5
            x: 2
            y: 134
            width: 183
            height: 3
            color: "#f0efef"
        }

        Rectangle {
            id: rectangle6
            x: 0
            y: 30
            width: 3
            height: 208
            color: "#f0efef"
        }

        Rectangle {
            id: rectangle7
            x: 2
            y: 30
            width: 183
            height: 3
            color: "#f0efef"
        }

        Text {
            id: text12
            x: 37
            y: 40
            text: qsTr("Already Chosen")
            font.underline: true
            font.pixelSize: 12
        }

        Rectangle {
            id: rectangle8
            x: 2
            y: 235
            width: 185
            height: 3
            color: "#f0efef"
        }

        Text {
            id: text9
            x: 19
            y: 250
            text: qsTr("Price:")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }

        TextEdit {
            id: price
            x: 83
            y: 250
            text:itemPrice
            cursorVisible: true
            width: 54
            height: 21
            font.pixelSize: 16
            font.family: "Courier"
        }

        Text {
            id: text10
            x: 138
            y: 250
            text: qsTr("$")
            font.family: "Courier"
            font.bold: true
            font.pixelSize: 16
        }
    }
}
