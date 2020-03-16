import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.5

Window {
    id: window
    visible: true
    width: 280
    height: 500
    title: qsTr("LOG IN")
    property int status: 0

    Text {
        id: title
        color: "#514d4d"
        text: qsTr("SIGN IN")
        font.pixelSize: 25
        topPadding: 20
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
        anchors.topMargin: 10
        placeholderText: "Password"
        maximumLength: 11
    }

    TextField {
        id: repeatPassword
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: password.bottom
        anchors.topMargin: 10
        placeholderText: "Please, repeat password"
        visible: (status == 1) ? true : false
    }

    TextField {
        id: nickname
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: repeatPassword.bottom
        anchors.topMargin: 10
        placeholderText: "Nickname"
        visible: (status == 1) ? true : false
    }

    Button {
        id: button
        anchors.top: (status == 0) ? password.bottom : nickname.bottom
        anchors.topMargin: 10
        font.pixelSize: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Sign in"
        enabled: status == 0 && login.length > 4 && password.length > 4 ||
                 status == 1 && login.length > 4 && password.length > 4 &&
                 repeatPassword.length > 4 && nickname.length > 4 && password.text == repeatPassword.text
        onClicked: {
            loadingIndicatorOpacity.start()
        }
    }

    BusyIndicator {
        id: loadingIndicator
        anchors.top: button.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        width: 50; height: 50
        running: true
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

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        bottomPadding: 20
        spacing: 10

        Text {
            id: signIn
            text: qsTr("Sign in")
            font.underline: true

            MouseArea {
                id: mouseSignIn
                enabled: !instance
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    window.status = 0
                    title.text = "SIGN IN"
                    login.text = ""
                    password.text = ""
                    repeatPassword.text = ""
                    nickname.text = ""
                }
            }
        }

        Text {
            id: slash
            text: qsTr("/")
        }

        Text {
            id: signUp
            text: qsTr("Sign up")
            font.underline: true

            MouseArea {
                id: mouseSignUp
                enabled: !instance
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    window.status = 1
                    title.text = "SIGN UP"
                    login.text = ""
                    password.text = ""
                    repeatPassword.text = ""
                    nickname.text = ""
                }
            }
        }
    }
}
