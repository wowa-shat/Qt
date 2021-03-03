import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        Text {
            id: text
            text: "измени меня"
            font.pixelSize: parseInt(changeSize.currentText)
            color: changeColor.currentText
        }

        ComboBox {
            id: changeColor
            model: ["red", "green", "blue"]
        }

        ComboBox {
            id: changeSize
            model: ["10", "20", "30"]
        }
    }
}
//Необходимо на главном окне разместить текстовую метку и дать возможность выбрать цвет и размер этой метки.
//Для выбора цвета необходимо использовать выпадающий список. В списке необходимо задать несколько цветов (на выбор студента).
//В списке с размерами также задать несколько значений (на выбор студента).
//Note: см. ComboBox тип;
