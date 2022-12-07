import QtQuick 2.0
import QtMultimedia 5.12

Item {

    Camera
    {
        id: camera
        Component.onCompleted: camera.stop()
        viewfinder
        {
           resolution: Qt.size(640, 480)
           maximumFrameRate: 15
        }

        imageCapture {
            id: cameracapture

            onImageCaptured: {
                photoPreview.visible = true;
                photoPreview.source = preview;
                timerPreview.restart();
            }
        }
    }

    Image {
        id: photoPreview
    }

    Timer
    {
        id: timerPreview
        interval: 2000
        onTriggered:
        {
            photoPreview.visible = false;
        }
    }

    Timer
    {
        id: takePicture
        repeat: true
        triggeredOnStart: true
        running: false
        interval: timelapseDelay.getDelay()
        onTriggered:
        {
            camera.imageCapture.capture();
        }
    }

    Rectangle {
        id: startTimelapse
        width: 275
        height: 100
        color:"black"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "white"
        border.width: 5
        radius: 10
        visible: true

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {

                camera.start();
                takePicture.start();
                startTimelapse.visible = false;
                endTimelapse.visible = true;

            }
        }

        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            id: beginTimelapseText
            font.pointSize: 30
            text: qsTr("Start")
            color: "white"
        }
    }

    Rectangle {
        id: endTimelapse
        width: 150
        height: 50
        color:"black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        border.color: "white"
        border.width: 3
        radius: 10
        visible: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {

                takePicture.stop();
                camera.stop();
                rootPage.reqSettingsPage();

            }
        }

        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            id: endTimelapseText
            font.pointSize: 20
            text: qsTr("End")
            color: "white"
        }
    }
}
