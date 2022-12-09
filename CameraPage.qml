import QtQuick 2.0
import QtMultimedia 5.12

Item {

    onVisibleChanged:
    {
        camera.start();
    }

    Camera
    {
        id: camera

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
                startTimelapse.visible = false;
            }
        }
    }
    VideoOutput
    {
       id: videoOut
       source: camera
       anchors.fill: parent
       fillMode: VideoOutput.PreserveAspectCrop
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
            startTimelapse.visible = true;
        }
    }

    Connections
    {
        target: input1

        onInputChanged:
        {
            if (value == 0){
                camera.imageCapture.captureToLocation("/home/pi/Pictures/");
            }

        }
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            camera.stop();
            rootPage.reqSettingsPage();
        }
    }

    //begin timelapse stuff

    Timer
    {

        id: takePicture
        repeat: true
        triggeredOnStart: true
        running: false
        interval: timelapseDelay.getDelay()
        onTriggered:
        {
            camera.imageCapture.captureToLocation("/home/pi/Pictures/");
        }

    }

    Connections
    {
        target: timelapseDelay
        onDelayChanged:
        {
            takePicture.interval = timelapseDelay.getDelay();
        }
    }

    Rectangle {
        id: startTimelapse
        width: 150
        height: 100
        color:"black"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        border.color: "white"
        border.width: 2
        radius: 5
        visible: true

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
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
            font.pointSize: 20
            text: qsTr("Start TL")
            color: "white"
        }
    }

    Rectangle {
        id: endTimelapse
        width: 150
        height: 100
        color:"black"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        border.color: "white"
        border.width: 2
        radius: 5
        visible: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                takePicture.stop();
                startTimelapse.visible = true;
                endTimelapse.visible = false;
            }
        }

        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill:parent
            id: endTimelapseText
            font.pointSize: 20
            text: qsTr("End TL")
            color: "white"
        }
    }


}
