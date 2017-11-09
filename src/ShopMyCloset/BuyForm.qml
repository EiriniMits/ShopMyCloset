import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick 2.2
import QtQuick.Dialogs 1.1


Rectangle {

    property string itemId
    property string itemName
    property string img
    property string itemSize
    property string itemPrice

    MessageDialog {
        id: messageDialog
        icon: StandardIcon.Information
        text: " ORDER SUCCESSFUL\n\n\n Your order was successfully submitted! \n\n Thank you for your purchase:)"
        onAccepted: {
            visible = false
            stack.pop();
            stack.pop();
        }
        Component.onCompleted: visible = false
    }

    MessageDialog {
        id: messageDialog2
        icon: StandardIcon.Warning
        text: "You must fill in all the fields."
        onAccepted: {
            visible = false
        }
        Component.onCompleted: visible = false
    }

    MessageDialog {
        id: messageDialog4
        icon: StandardIcon.Question
        text: "Are you Sure you want to Submit this Order?"
        standardButtons: StandardButton.Yes |  StandardButton.No
        onYes: {
            msg.deleteItem(itemId);
            msg.insertClient(name.text,name2.text,image1.source,country.text,city.text,address.text,zip.text,tel.text,itemPrice);
            messageDialog4.close();
            messageDialog.open();
        }
        onNo: messageDialog4.close();
        Component.onCompleted: visible = false
    }

    Rectangle {
        id: rectangle2
        x: 8
        y: 8
        width: 581
        height: 32
        color: "#e1dede"

        Text {
            id: text1
            x: 161
            y: 9
            text: qsTr("Item")
            font.bold: true
            font.family: "Courier"
            font.pixelSize: 15
        }

        Text {
            id: text2
            x: 431
            y: 9
            text: qsTr("Total")
            font.bold: true
            font.family: "Courier"
            font.pixelSize: 15
        }

        BackButton{ width: 47; height: 42; anchors.leftMargin: -6; anchors.topMargin: -5}
    }

    Rectangle {
        id: rectangle1
        x: 8
        y: 46
        width: 581
        height: 119
        color: "#ffffff"

        Label {
            id: label1
            x: 125
            y: 20
            width: 50
            height: 15
            text: itemName
            font.underline: false
            verticalAlignment: Text.AlignVCenter
            font.family: "Courier"
            font.pointSize: 14
        }

        Text {
            id: text3
            x: 124
            y: 57
            text: qsTr("Size:")
            font.family: "Courier"
            font.pixelSize: 14
        }

        Label {
            id: label2
            x: 175
            y: 57
            width: 13
            height: 15
            text: itemSize
            font.family: "Courier"
            font.pointSize: 14
        }

        Image {
            id: image1
            x: 0
            y: 0
            width: 107
            height: 119
            source: img
        }

        Text {
            id: text14
            x: 375
            y: 21
            text: qsTr("Item Price")
            font.family: "Courier"
            font.pointSize: 14
        }

        Label {
            id: price
            x: 512
            y: 20
            width: 44
            height: 15
            text: itemPrice+"$"
            font.bold: true
            font.family: "Courier"
            font.pointSize: 13
        }

        Text {
            id: text15
            x: 375
            y: 49
            text: qsTr("Shipping")
            font.family: "Courier"
            font.pointSize: 14
        }

        Text {
            id: text4
            x: 520
            y: 49
            width: 36
            height: 15
            text: "5.00"+"$"
            font.bold: true
            font.family: "Courier"
            font.pointSize: 13
        }

        Text {
            x: 375
            y: 96
            text: qsTr("Order Total")
            font.bold: true
            font.family: "Courier"
            font.pointSize: 15
        }

        Label {
            id: total
            x: 507
            y: 97
            width: 36
            height: 14
            text: (Number(itemPrice) +5).toFixed(2)+"$"
            font.bold: true
            font.family: "Courier"
            font.pointSize: 15
        }
    }

    Rectangle {
        id: rectangle3
        x: 8
        y: 165
        width: 581
        height: 5
        color: "#e1dede"
    }

    Rectangle {
        id: rectangle4
        x: 8
        y: 201
        width: 581
        height: 367
        color: "#ffffff"

        Text {
            id: text5
            x: 8
            y: 6
            width: 58
            height: 15
            text: "First Name:"
            font.pixelSize: 12
        }

        TextField {
            id: name
            x: 149
            y: 0
            width: 374
            height: 30
        }

        Text {
            id: text6
            x: 8
            y: 48
            text: qsTr("Last Name:")
            font.pixelSize: 12
        }

        TextField {
            id: name2
            x: 149
            y: 42
            width: 374
            height: 28
        }

        Text {
            id: text7
            x: 9
            y: 88
            text: qsTr("Country:")
            font.pixelSize: 12
        }

        TextField {
            id: country
            x: 149
            y: 82
            width: 374
            height: 29
        }

        Text {
            id: text8
            x: 8
            y: 130
            text: qsTr("City:")
            font.pixelSize: 12
        }

        TextField {
            id: city
            x: 149
            y: 124
            width: 374
            height: 27
        }

        Text {
            id: text9
            x: 8
            y: 173
            text: qsTr("Address:")
            font.pixelSize: 12
        }

        TextField {
            id: address
            x: 149
            y: 166
            width: 374
            height: 27
        }

        Text {
            id: text10
            x: 8
            y: 221
            text: qsTr("Post/Zip Code:")
            font.pixelSize: 12
        }

        TextField {
            id: zip
            x: 149
            y: 219
            width: 374
            height: 30
        }

        Text {
            id: text11
            x: 8
            y: 267
            text: qsTr("Phone:")
            font.pixelSize: 12
        }

        TextField {
            id: tel
            x: 149
            y: 261
            width: 374
            height: 26
        }

        Text {
            id: text12
            x: 149
            y: 199
            width: 377
            height: 10
            text: qsTr("Please offer us your exactly room, building number and street name!")
            font.pixelSize: 8
        }

        Text {
            id: text13
            x: 149
            y: 293
            text: qsTr("Please leave your correct tel number because the postman need call you to sign your parcel")
            font.pixelSize: 8
        }

        ToolButton {
            id: toolButton1
            x: 406
            y: 327
            width: 117
            height: 35

            Image {
                id: image2
                x: 0
                y: 0
                width: 117
                height: 35
                source: "qrc:/images/images/submit.jpg"
            }
            onClicked:
            {
                if(msg.check2(name.text,name2.text,country.text,city.text,address.text,zip.text,tel.text)===1){
                    messageDialog4.open();
                }
                else{
                     messageDialog2.open();
                }
            }
        }
    }
}

