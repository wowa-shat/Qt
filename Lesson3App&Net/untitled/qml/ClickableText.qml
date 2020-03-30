import QtQuick 2.0

Text {
    id: clickableText
    font.underline: false

    signal clicked();

    MouseArea {
        id: mouseClick
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            clickableText.clicked();
        }
    }
}
