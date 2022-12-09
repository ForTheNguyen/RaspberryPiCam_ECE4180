/*
This specific page is heavily referenced from another user's demo showcasing
the use of Qt Multimedia library on a Raspberry Pi. 
Credit is attributed accordingly:
https://github.com/vigasan/CameraRpi/tree/main/CameraRpi
*/

import QtQuick 2.0
import Qt.labs.folderlistmodel 2.12

Item {
    property string path: "file:///home/pi/Pictures/"

    GridView
    {
        id: gridView
        anchors.fill:parent
        anchors.margins: 4
        clip: true
        cellWidth: 198
        cellHeight: 149

        FolderListModel
        {
            id: folderModel
            showDirs: false
            folder: path
            nameFilters: ["*.png","*.jpg"]
        }

        model: folderModel
        delegate: delegateGridImage

        Component
        {
            id: delegateGridImage

            Item
            {
                width: 196
                height: 147

                Image
                {
                    anchors.fill: parent
                    source: path + fileName
                    asynchronous: true
                }

                Text {
                    id: imgFileName
                    text: fileName
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    color: "green"
                }

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        imagePreview.source = path + fileName
                        gridView.visible = false
                        backToHome.visible = false
                    }
                }
            }
        }
    }


    Image
    {
        id: imagePreview
        visible: !gridView.visible
        anchors.fill: parent

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                backToHome.visible = true;
                gridView.visible = true;
            }
        }

    }

    Rectangle  {
        id: backToHome
        width: 250
        height: 75
        color:"black"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        border.color: "white"
        border.width: 2
        radius: 5

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                rootPage.reqSettingsPage();
            }
        }

        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            id: backToCameraText
            font.pointSize: 30
            text: qsTr("Home")
            color:"white"
        }
    }
}
