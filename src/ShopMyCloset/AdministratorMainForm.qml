import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
Rectangle
{

    Component
    {
        id:add
        AddClothes{}
    }

    Component
    {
        id:view
        ViewClothesAdmin {}
    }
    Component
    {
        id:clients
        ClientsList {}
    }

    Image {
        id: image1
        x: 0
        y: 35
        width: 640
        height: 445
        fillMode: Image.PreserveAspectFit
        source: "qrc:/images/images/closet.jpeg"
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
            height: 41
            color: "#ffffff"

            ToolButton {
                id: toolButton2
                x: 549
                y: 3
                width: 44
                height: 36

                Image {
                    id: image3
                    x: 1
                    y: 1
                    width: 42
                    height: 34
                    source: "qrc:/images/images/logout.jpeg"
                }
                onClicked: stack.pop();
            }

            ToolButton
            {
                anchors.right: parent.right
                id:addIcon
                x: 0
                y: 1
                width: 50
                height: 40
                anchors.rightMargin: 590
                Image
                {
                    anchors.rightMargin: 4
                    anchors.bottomMargin: 4
                    anchors.leftMargin: 4
                    anchors.topMargin: 4

                    source: "images/images/Add-Bag-icon.png"
                    anchors.fill: parent
                    anchors.margins: 4
                }
                onClicked: stack.push(add);
            }

            ToolButton {
                id: toolButton3
                x: 503
                y: 3
                width: 40
                height: 36

                Image {
                    id: image4
                    x: 3
                    y: 0
                    width: 34
                    height: 36
                    source: "qrc:/images/images/notification.png"
                }
                onClicked: stack.push(clients);
            }

            Image {
                id: image2
                x: 207
                y: -16
                width: 179
                height: 75
                source: "qrc:/images/images/SHOP MY CLOSET.png"
            }
        }
    }

    PathView {
        anchors.rightMargin: 150
        anchors.bottomMargin: 91
        anchors.leftMargin: 150
        anchors.topMargin: 209
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: myToolBar.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 150
        model:msg.clothesModel
        delegate: Rectangle {
            x: 8
            y: 46
            width: 209
            height: 343
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stack.push({item:view, properties:{itemId: id, itemName: name,itemBrand: brand, img: image, itemDescription:description, itemSize:size,itemColor:colors,itemComposition:materials,itemPrice:price}});
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
