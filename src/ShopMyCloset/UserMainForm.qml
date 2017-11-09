import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle
{
    property string userName
    property string userName2

    Component
    {
        id:view
        ViewClothes {}
    }

    Image {
        id: image1
        x: 0
        y: 60
        width: 640
        height: 445
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/images/closet.jpeg"
    }

    ToolBar
    {
        id:myToolBar
        height: 75
        width:parent.width
        anchors.right: parent.right
        Rectangle {
            id: rectangle2
            x: -6
            y: -1
            width: 640
            height: 71
            color: "#ffffff"

            ToolButton {
                id: toolButton2
                x: 519
                y: 23
                width: 42
                height: 41

                Image {
                    id: image3
                    x: 0
                    y: 4
                    width: 43
                    height: 34
                    source: "qrc:/images/images/logout.jpeg"
                }
                onClicked: stack.pop();
            }

            ToolButton {
                id: toolButton3
                x: 457
                y: 23
                width: 49
                height: 42
            }

            Text {
                id: text1
                x: 355
                y: 0
                text: qsTr(" Logged in as: ")
                font.family: "Courier"
                font.pixelSize: 10
            }

            Text {
                id: text2
                x: 445
                y: 0
                width: 39
                height: 10
                text: userName+" "+userName2
                font.bold: true
                font.pixelSize: 10
                font.family: "Courier"
            }

            Image {
                id: image2
                x: 0
                y: -20
                width: 201
                height: 112
                source: "qrc:/images/images/SHOP MY CLOSET.png"
            }
        }
    }

    PathView {
        anchors.rightMargin: 150
        anchors.bottomMargin: 91
        anchors.leftMargin: 150
        anchors.topMargin: 202
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: myToolBar.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 150
        model:msg.clothesModel
        delegate: Rectangle {
            x: 8
            y: 40
            width: 220
            height: 350
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stack.push({item:view, properties:{itemId:id, itemName: name,itemBrand: brand, img: image, itemDescription:description, itemSize:size,itemColor:colors,itemComposition:materials,itemPrice:price}});
                }
            }

            Column {
                x: 0
                y: -6
                width:parent.width

                Image
                {
                    anchors.horizontalCenter: parent.horizontalCenter
                    id:img
                    height:(parent.width-5)*1
                    width:height
                    source:image
                }

                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    id:l
                    verticalAlignment: Text.AlignVCenter
                    height:(parent.width-5)/5
                    text:name
                    font.family: "Courier"
                    font.pixelSize: 10

                }

                Label{
                    anchors.horizontalCenter: parent.horizontalCenter
                    id:la
                    verticalAlignment: Text.AlignVCenter
                    height:parent.width/12
                    text:price+"$"
                    font.bold: true
                    font.family: "Courier"
                    font.pixelSize: 12

                }
            }
        }

        path: Path {
            id: myPath
            startX: 0; startY: 150
            PathAttribute {name: "rotateY"; value: 50.0}
            PathAttribute {name: "scalePic"; value: 0.5}
            PathAttribute {name: "zOrder"; value: 1}

            PathLine{x:180; y: 150}
            PathPercent {value: 0.44}
            PathAttribute {name: "rotateY"; value: 50.0}
            PathAttribute {name: "scalePic"; value: 0.5}
            PathAttribute {name: "zOrder"; value: 10}

            PathQuad{x:320; y: 190; controlX: 290; controlY: 190}
            PathPercent {value: 0.50}
            PathAttribute {name: "rotateY"; value: 0.0}
            PathAttribute {name: "scalePic"; value: 1.0}
            PathAttribute {name: "zOrder"; value: 50}

            PathQuad{x:460; y: 150; controlX: 510; controlY: 150}
            PathPercent {value: 0.56}
            PathAttribute {name: "rotateY"; value: -50.0}
            PathAttribute {name: "scalePic"; value: 0.5}
            PathAttribute {name: "zOrder"; value: 10}

            PathLine{x:640; y: 150}
            PathPercent {value: 1.00}
            PathAttribute {name: "rotateY"; value: -50.0}
            PathAttribute {name: "scalePic"; value: 0.5}
            PathAttribute {name: "zOrder"; value: 1}
        }
        focus: true
        Keys.onLeftPressed: decrementCurrentIndex()
        Keys.onRightPressed: incrementCurrentIndex()
    }
}
