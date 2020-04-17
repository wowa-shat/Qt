import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import "qml"

Window {
    id: window
    visible: true
    width: 280
    height: 500
    title: qsTr("LOG IN")
    property int status: 0

    Loader{
        id: pageLoader
        anchors.fill: parent
        source: (window.status == 0) ? "qml/LoginForm.qml" : "qml/Registration.qml"
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        bottomPadding: 20
        spacing: 10

        ClickableText {
            id: signIn
            text: qsTr("Sign in")
            font.underline: (status == 0) ? true : false

            onClicked: status = 0
        }

        Text {
            id: slash
            text: qsTr("/")
        }

        ClickableText {
            id: signUp
            text: qsTr("Sign up")
            font.underline: (status == 0) ? false : true
            onClicked: status = 1
        }
    }
}
