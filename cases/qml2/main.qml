import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Dialogs 1.1

Window {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("выбор файлов изображений с помощью диалога фалов")

    Column {
        topPadding: 20
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        Button {
            id: callDialog
            text: "select file"
            onClicked: fileDialog.open()
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: img
            height: window.height
            width: sourceSize.width * height / sourceSize.height
        }
    }
    FileDialog {
        id: fileDialog
        title: "Add New Image"
        folder: shortcuts.desktop
        selectMultiple : false

        nameFilters: ["Image File (*.png *.jpg *.bmp)"]
        onAccepted: {
            img.source = fileDialog.fileUrl
        }
    }
}
//Необходимо реализовать простейший просмотрщик изображений.
//На главном окне в верхней части должна показываться кнопка выбора изображения.
//По нажатию должен открываться диалог выбора изображения.
//Необходимо давать возможность выбрать только изображения формата jpg и png.
//Если пользователь выбрал изображение, необходимо его отобразить.
//Компонент изображения растянуть по родителю. Кнопка выбора файла должна быть
//над изображением.
