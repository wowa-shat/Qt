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

    Loader{
        id: pageLoader
        anchors.fill: parent
        source: "qml/LoginForm.qml"
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        bottomPadding: 20
        spacing: 10

        ClickableText {
            id: signIn
            text: qsTr("Sign in")
            font.underline: true

            onClicked: {
                signUp.font.underline = false
                signIn.font.underline = true
                pageLoader.source = "qml/LoginForm.qml"
            }
        }

        Text {
            id: slash
            text: qsTr("/")
        }

        ClickableText {
            id: signUp
            text: qsTr("Sign up")

            onClicked: {
                    signIn.font.underline = false
                    signUp.font.underline = true
                    pageLoader.source = "qml/Registration.qml"
            }
        }
    }
}
