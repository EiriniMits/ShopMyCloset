import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.2

Rectangle
{
    property ListModel mymodel1

    ListModel
    {
        id: basketModel
    }

    Dialog {
            id :dialog
            visible: false
            width: 300
            Text {
                id: text5
                y:5
                width: 70
                height: 27
                text: "Add Color:"
                font.family: "Courier"
                font.bold: true
                font.pixelSize: 16
            }
            TextArea {
                id: newcolor
                x : 100
                width: 175
                height: 27
            }

            standardButtons: StandardButton.Save | StandardButton.Cancel

            onAccepted: {
                listmodel.append({name: newcolor.text, colorCode: newcolor.text})
                   dialog.close();
            }
            onRejected: {
                console.log("Canceled")
                dialog.close();
            }

    }

    ToolBar
    {
        id:myToolBar
        height: 40
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        SaveButton
        {
            onClicked:
            {
                for (var i=0;i<basketModel.count;i++)
                {
                    mymodel1.append({"name1":basketModel.get(i).name});
                }
                stack.pop();
            }
        }
        BackButton{}

        Text {
            id: text1
            x: 244
            y: 9
            width: 118
            height: 15
            text: qsTr("CHOOSE COLORS")
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.family: "Courier"
            font.pixelSize: 17
        }
    }

    Column
    {
        anchors.top: myToolBar.bottom
        anchors.margins: 20
        anchors.horizontalCenter: parent.horizontalCenter
        width:parent.width*0.9
        height:parent.height*0.9
        spacing :15
        Rectangle
        {
            width:parent.width
            height:parent.height*0.4
            border.width: 1
            ToolBar
            {
                id:toolbar1
                height:30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top:parent.top
                anchors.margins: 1
                Label
                {
                    y: 7
                    text:"Basket"
                    anchors.horizontalCenterOffset: 1
                    font.pixelSize: 16
                    font.family: "Courier"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Component
            {
                id: highlight2
                Rectangle {
                    width: 500; height: 60
                    color: "lightsteelblue"; radius: 5
                    y: basket.currentItem.y
                }
            }

            ListView
            {
                id:basket
                model:basketModel
                clip:true
                highlight:highlight2
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top:toolbar1.bottom
                anchors.margins: 1
                delegate:Item
                {
                width:parent.width
                height:20

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        basket.currentIndex = index;
                    }
                    Row
                    {
                        width:parent.width
                        spacing:5
                        Label
                        {
                            id:lab
                            anchors.verticalCenter: parent.verticalCenter
                            text:name
                            width:parent.width*0.6
                        }
                    }
                }
            }
        }
    }

    Row
    {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing:20
        ToolButton
        {
            width:30
            height:30
            Image
            {
                anchors.fill: parent
                anchors.margins: 1
                source: "images/images/arrow-up-5-xxl.png"
            }
            onClicked: basketModel.append({"name": list.currentItem.myModel.name});
        }

        ToolButton
        {
            width:30
            height:30
            Image
            {
                anchors.fill: parent
                anchors.margins: 1
                source: "images/images/arrow-45-128.png"
            }
            onClicked: basketModel.remove(basket.currentIndex);
        }
    }

    Rectangle
    {
        width:parent.width
        height:parent.height*0.4
        border.width: 1
        ToolBar
        {
            id:toolbar2
            height:30
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top:parent.top
            anchors.margins: 1
            Label
            {
                y: 7
                text:"Colors"
                anchors.horizontalCenterOffset: 1
                font.pixelSize: 16
                font.family: "Courier"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ToolButton
            {
                anchors.right: parent.right
                anchors.top: parent.top
                id:addIngredient
                width: parent.height
                height:width
                Image
                {
                    source: "images/images/paint.png"
                    anchors.fill: parent
                    anchors.margins: 1
                }
                onClicked: dialog.open();
            }
        }

        Rectangle
        {

             border.width: 1
             anchors.margins: 2
             anchors.left: parent.left
             anchors.right:parent.right
             anchors.bottom: parent.bottom
             anchors.top : toolbar2.bottom

             Component
             {
                  id: highlight
                  Rectangle
                  {
                      width: 500; height: 60
                      color: "lightsteelblue"; radius: 5
                      y: list.currentItem.y
                  }
             }

             ListView
             {
                 clip:true
                 id:list
                 anchors.fill: parent
                 highlight: highlight
                 highlightFollowsCurrentItem: true
                 delegate: Item
                 {
                    property var myModel: model

                    height:20
                    width: parent.width
                    Row
                    {
                        width:parent.width
                        spacing:5
                        anchors.verticalCenter: parent.verticalCenter
                        Rectangle {
                            width: 20
                            height: 20
                            color: colorCode
                        }
                        Label
                        {
                            text: name
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                        }
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: list.currentIndex = index;
                    }
                }
                model: ListModel {
                        id: listmodel
                        ListElement {
                            name: "Black"
                            colorCode: "black"
                        }
                        ListElement {
                            name: "Red"
                            colorCode: "red"
                        }

                        ListElement {
                            name: "Blue"
                            colorCode: "blue"
                        }

                        ListElement {
                            name: "Green"
                            colorCode: "green"
                        }
                        ListElement {
                            name: "Pink"
                            colorCode: "pink"
                        }
                        ListElement {
                            name: "White"
                            colorCode: "white"
                        }
                        ListElement {
                            name: "Grey"
                            colorCode: "grey"
                        }
                        ListElement {
                            name: "Brown"
                            colorCode: "Brown"
                        }
                        ListElement {
                            name: "Turquoise"
                            colorCode: "Turquoise"
                        }
                        ListElement {
                            name: "Blue"
                            colorCode: "Blue"
                        }
                        ListElement {
                            name: "Yellow"
                            colorCode: "Yellow"
                        }
                        ListElement {
                            name: "Orange"
                            colorCode: "Orange"
                        }
                        ListElement {
                            name: "Purple"
                            colorCode: "Purple"
                        }
                        ListElement {
                            name: "Gold"
                            colorCode: "Gold"
                        }
                        ListElement {
                            name: "Silver"
                            colorCode: "Silver"
                        }
                        ListElement {
                            name: "Khaki"
                            colorCode: "Khaki"
                        }
                        ListElement {
                            name: "Beige"
                            colorCode: "Beige"
                        }
                   }
              }
          }
       }
    }
}
