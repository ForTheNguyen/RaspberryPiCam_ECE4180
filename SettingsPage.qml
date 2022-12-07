import QtQuick 2.0

Item {

    Rectangle  {
        id: liveViewButton
        width: 275
        height: 100
        color:"black"
        anchors.top: parent.top
        anchors.topMargin:20
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
                rootPage.reqCameraPage();
            }
        }

        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            id: liveViewText
            font.pointSize: 30
            text: qsTr("Live View")
            color:"white"
        }
    }

    Rectangle  {
        id: goToGalleryPage
        width: 275
        height: 100
        color:"black"
        anchors.top: parent.top
        anchors.topMargin:20
        anchors.left: parent.left
        anchors.leftMargin: 20
        border.color: "white"
        border.width: 2
        radius: 5

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                rootPage.reqGalleryPage();
            }
        }

        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            id: backToCameraText
            font.pointSize: 30
            text: qsTr("Gallery")
            color: "white"
        }
    }

    Rectangle {
        id: enableTimelapse
        width: 300
        height: 150
        color:"black"
        anchors.centerIn: parent
        border.color: "white"
        border.width: 2
        radius: 5

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                enableTimelapse.visible = false;
                upButton.visible = true;
                downButton.visible = true;
                timelapse_delayText.visible = true;
                disableTimelapse.visible = true;
            }
        }

        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            id: enableTimelapseText
            font.pointSize: 25
            text: qsTr("Enable Timelapse")
            color: "white"
        }
    }

    Rectangle {
        id: downButton
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "#cccccc"
        radius: 5
        visible: false

        Text {
            id: downButtonText
            text: qsTr("v")
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            font.pointSize: 40

        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                timelapseDelay.subDelay();
            }
        }
    }

    Rectangle {
        id: upButton
        width: 100
        height: 100
        anchors.bottom: downButton.top
        anchors.bottomMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "#cccccc"
        radius: 5
        visible: false

        Text {
            id: upButtonText
            text: qsTr("^")
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            font.pointSize: 55

        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
               timelapseDelay.addDelay();
            }
        }
    }

    Text {

        Connections
        {
            target: timelapseDelay

            onDelayChanged:
            {
                timelapse_delayText.text = timelapseDelay.getDelayAdjusted() + " s";
            }
        }

        id: timelapse_delayText
        text: timelapseDelay.getDelayAdjusted() + " s"
        anchors.verticalCenter: upButton.bottom
        anchors.left: upButton.right
        anchors.leftMargin: 30
        font.pointSize: 40
        color: "white"
        visible: false
    }

    Rectangle {
        id: disableTimelapse
        width: 275
        height: 100
        color:"black"
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        border.color: "white"
        border.width: 2
        radius: 5
        visible: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                enableTimelapse.visible = true;
                upButton.visible = false;
                downButton.visible = false;
                timelapse_delayText.visible = false;
                disableTimelapse.visible = false;
            }
        }

        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            id: disableTimelapseText
            font.pointSize: 30
            text: qsTr("Cancel")
            color: "white"
        }
    }

}
