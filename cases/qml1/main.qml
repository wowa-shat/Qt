import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Dialogs 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    FontDialog {
        id:fontDialog
    }

    ColorDialog {
        id: colorDialog
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        Text {
            id: text
            text: "измени меня"
            font: fontDialog.font
            color: colorDialog.color
        }

        Button {
            text: "Изменить шрифт"
            onClicked: {
                fontDialog.visible = true
            }
        }

        Button {
            text: "Изменить цвет"
            onClicked: {
                colorDialog.visible = true
            }
        }
    }
}
//В приложении на главном окне должна находится текстовая метка с любым текстом.
//Приложение должно позволять с помощью диалогов выбрать цвет текста и шрифт.
//Note: см. ColorDialog и FontDialog;
