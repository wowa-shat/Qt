import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 280
    height: 500
    title: qsTr("LOG IN")

    Text {
        id: title
        color: "#514d4d"
        text: qsTr("SIGN IN")
        font.pixelSize: 25
        topPadding: 20
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: textFieldLogin
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: title.bottom
        anchors.topMargin: 20
        placeholderText: "login..."
    }

    TextField {
        id: textFieldPassword
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: textFieldLogin.bottom
        anchors.topMargin: 10
        placeholderText: "password..."
    }

    Button {
        anchors.top: textFieldPassword.bottom
        anchors.topMargin: 10
        font.pixelSize: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Sign in"
        onClicked: {
            title.visible = !title.visible
        }
    }
}
