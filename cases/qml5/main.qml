import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("qml5")

    MessageDialog {
        id: exit
        text: "Close window?"
        standardButtons: MessageDialog.Ok | MessageDialog.Cancel
        onAccepted: window.close()
    }

    MessageDialog {
        id: about
        text: "About"
        standardButtons: MessageDialog.Ok
        onAccepted: close()
    }

    MenuBar {
        Menu {
            title: "Main"
            Action {
                    text: "About"
                    onTriggered: about.visible = true
            }
            Action {
                    text: "Exit"
                    onTriggered: exit.visible = true
            }
        }
    }
}
//Необходимо реализовать использование меню в приложении.
//На главном окне должна показывать строка меню, в котором будет только 1 пункт - “Main”.
//В разделе “Main” должно быть только 2 подпункта - “About” и “Exit”. См. скриншот: https://prnt.sc/rsf5qe.
//При нажатии на “About” должно показываться информационное сообщение с
//информацией об этом приложении (текст в сообщении - на усмотрение студента).
//При нажатии на “Exit” - программа должна закрываться.
//Note: см. MenuBar, Action, MessageDialog.
