import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Dialogs 1.3
import AuthManager 1.0

Item {
    id: registration
    width: parent.width
    height: parent.height

    AuthManager {
        id:authManager
        onRegistererRequestCompleted: {
            dialog.visible = true
            dialog.text = message == "Неизвестная ошибка" ? "Вы зарегистрированы!" : "Данный логин уже зарегистрирован"
        }
    }

    MessageDialog {
        id: dialog
        standardButtons: MessageDialog.Ok
        text: ""
    }

    Text {
        id: title
        color: "#514d4d"
        text: qsTr("SIGN UP")
        font.pixelSize: 25
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: login
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: title.bottom
        anchors.topMargin: 20
        placeholderText: "Login"
    }

    TextField {
        id: password
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: login.bottom
        echoMode: TextInput.Password
        anchors.topMargin: 10
        placeholderText: "Password"
    }

    TextField {
        id: repeatPassword
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: password.bottom
        echoMode: TextInput.Password
        anchors.topMargin: 10
        placeholderText: "Please, repeat password"
    }

    TextField {
        id: nickname
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: repeatPassword.bottom
        anchors.topMargin: 10
        placeholderText: "Nickname"
    }

    Button {
        id: buttonReg
        anchors.top: nickname.bottom
        anchors.topMargin: 10
        font.pixelSize: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Sign Up"
        onClicked: {
            if (password.text !== repeatPassword.text)
            {
                passwordValues.visible = true
            }
            else
            {
                loadingIndicatorOpacity.restart()
                loadingIndicator.visible = true
                authManager.registerer(login.text, password.text)
            }
        }
    }

    Text {
        id: passwordValues
        color: "#dd2323"
        text: qsTr("password values aren't same!")
        font.pixelSize: 15
        topPadding: 20
        anchors.top: buttonReg.bottom
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
    }

    BusyIndicator {
        id: loadingIndicator
        anchors.top: buttonReg.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 50; height: 50
        running: authManager.regIsProcessing
        opacity: 0
        OpacityAnimator{
            id: loadingIndicatorOpacity
            target: loadingIndicator
            from: 0;
            to: 1;
            duration: 1000
            running: false
        }
    }
}
