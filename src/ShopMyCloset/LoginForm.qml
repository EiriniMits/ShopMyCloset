import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0
import QtQuick 2.2
import QtQuick.Dialogs 1.1


Rectangle
{

    Component
    {
        id:admin
        AdministratorMainForm {}
    }

    Component
    {
        id:user
        UserMainForm {}
    }

    MessageDialog {
        id: messageDialog
        icon: StandardIcon.Information
        text: "The Email or the Password you've entered, is incorrect."
        onAccepted: {
            visible = false
        }
        Component.onCompleted: visible = false
    }

    MessageDialog {
        id: messageDialog2
        icon: StandardIcon.Information
        text: "This Email is already taken."
        onAccepted: {
            visible = false
        }
        Component.onCompleted: visible = false
    }

    MessageDialog {
        id: messageDialog3
        icon: StandardIcon.Information
        text: "Please fill in all the Sign Up fields."
        onAccepted: {
            visible = false
        }
        Component.onCompleted: visible = false
    }

    ToolBar
    {
        id:myToolBar
        height: 40
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.top: parent.top

        Rectangle {
            id: rectangle2
            x: -6
            y: 0
            width: 640
            height: 67
            color: "#ffffff"

            TextField {
                id: email1
                x: 206
                y: 53
                width: 158
                height: 22
                placeholderText: qsTr("mycloset@yahoo.com")
            }

            TextField {
                id: password
                x: 383
                y: 53
                width: 105
                height: 22
                echoMode: TextInput.Password
                placeholderText: qsTr("*********")
            }

            Text {
                id: text1
                x: 206
                y: 26
                width: 34
                height: 15
                text: qsTr("Email:")
                font.pixelSize: 12
            }

            Text {
                id: text2
                x: 383
                y: 26
                text: qsTr("Password:")
                font.pixelSize: 12
            }

            Button {
                id: button1
                x: 512
                y: 53
                width: 59
                height: 22

                Image {
                    id: image5
                    width: 59
                    height: 22
                    source: "qrc:/images/images/login-icon.jpeg"
                }
                onClicked:
                {
                    if(msg.loginUser(email1.text,password.text)===2){
                          stack.push(admin);
                    }
                    else if(msg.loginUser(email1.text,password.text)===1){
                          stack.push( {item:user, properties:{userName: msg.getname(email1.text), userName2: msg.getlastname(email1.text)}})
                    }
                    else {
                         messageDialog.open();
                    }
                }
            }

            Image {
                id: image1
                x: 0
                y: 0
                width: 183
                height: 107
                source: "qrc:/images/images/SHOP MY CLOSET.png"
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 8
        y: 113
        width: 581
        height: 51
        color: "#338790"

        Image {
            id: image2
            x: 0
            y: 0
            width: 581
            height: 51
            source: "qrc:/images/images/Pattern.png"
        }
    }

    Rectangle {
        id: rectangle3
        x: 8
        y: 163
        width: 581
        height: 329
        color: "#ffffff"

        TextField {
            id: name2
            x: 130
            y: 66
            width: 120
            height: 34
            placeholderText: qsTr("First Name")
        }

        TextField {
            id: lastname
            x: 273
            y: 66
            width: 167
            height: 34
            placeholderText: qsTr("Last Name")
        }

        TextField {
            id: email
            x: 130
            y: 130
            width: 310
            height: 34
            placeholderText: qsTr("Email")
        }

        TextField {
            id: password2
            x: 130
            y: 192
            echoMode: TextInput.Password
            width: 310
            height: 34
            placeholderText: qsTr("Password")
        }

        Rectangle {
            id: rectangle4
            x: 0
            y: 328
            width: 581
            height: 56
            color: "#338790"

            Image {
                id: image3
                x: 0
                y: 0
                width: 581
                height: 56
                source: "qrc:/images/images/Pattern.png"
            }
        }

        Button {
            id: toolButton2
            x: 363
            y: 259
            width: 65
            height: 20
            onClicked:
            {
                if(msg.check(name2.text,lastname.text,email.text,password2.text)===1){
                    if(msg.signupUser(name2.text,lastname.text,email.text,password2.text)===0){
                        stack.push({item:user, properties:{userName:name2.text,userName2:lastname.text}});
                    }
                    else{
                         messageDialog2.open();
                    }
                }
                else{
                    messageDialog3.open();
                }
            }

            Image {
                id: image4
                x: -4
                y: -3
                width: 76
                height: 27
                source: "qrc:/images/images/Signup.png"
            }
        }
    }
}
