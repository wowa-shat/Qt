import QtQuick 2.0

Text {
    id: clickableText
    font.underline: false

    signal clicked();

    MouseArea {
        id: mouseClick
        enabled: !instance
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            clickableText.clicked();
        }
    }
}
