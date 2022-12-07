import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id:rootPage
    color: "black"
    width: 640
    height: 480
    visible: true
    visibility: "FullScreen"
    title: qsTr("Home")

    signal reqCameraPage()
    signal reqSettingsPage()
    signal reqGalleryPage()

    onReqCameraPage:
    {
        cameraPage.visible = true;
        settingsPage.visible = false;
        galleryPage.visible = false;

    }

    onReqSettingsPage:
    {
        cameraPage.visible = false;
        settingsPage.visible = true;
        galleryPage.visible = false;

    }

    onReqGalleryPage:
    {
        cameraPage.visible = false;
        settingsPage.visible = false;
        galleryPage.visible = true;

    }

    CameraPage
    {
        id: cameraPage
        width: parent.width
        height: parent.height
        visible: false
    }

    SettingsPage
    {
        id: settingsPage
        width: parent.width
        height: parent.height
        visible: true
    }

    GalleryPage
    {
        id: galleryPage
        width: parent.width
        height: parent.height
        visible: false
    }

}
