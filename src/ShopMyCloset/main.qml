import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true
    width : 600
    height: 800

    Component
    {
        id:zero;
        LoginForm {}
    }

    StackView
    {
        anchors.fill: parent
        initialItem: zero
        id: stack
    }
}
