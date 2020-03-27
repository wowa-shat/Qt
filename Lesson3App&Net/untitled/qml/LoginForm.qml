import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Item {
    id: loginForm
    width: parent.width
    height: parent.height

    Text {
        id: title
        color: "#514d4d"
        text: qsTr("SIGN IN")
        font.pixelSize: 25
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextField {
        id: loginSignIn
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: title.bottom
        anchors.topMargin: 20
        placeholderText: "Login"
    }

    TextField {
        id: passwordSignIn
        width: parent.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 20
        anchors.top: loginSignIn.bottom
        echoMode: TextInput.Password
        anchors.topMargin: 10
        placeholderText: "Password"
    }

    Button {
        id: buttonLogin
        anchors.top: passwordSignIn.bottom
        anchors.topMargin: 10
        font.pixelSize: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Sign in"
        onClicked: {
            loadingIndicatorOpacity.restart()
            loadingIndicator.visible = true
        }
    }

    Text {
        id: passwordValues
        color: "#dd2323"
        text: qsTr("password values aren't same!")
        font.pixelSize: 15
        topPadding: 20
        anchors.top: buttonLogin.bottom
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
    }

    BusyIndicator {
        id: loadingIndicator
        anchors.top: buttonLogin.bottom
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
}
