# High Quality Digital Camera with GUI Touchscreen

## Project Team Members

David Nguyen, Saniya Datir, Dominik Fill

## Project Overview

//Summarize goals of project, desired capabilities, and primary hardware components.

This project combines a high-quality camera with an LCD touchscreen, an encoder, and a Raspberry Pi 4B to create a functional camera held together with a retro 3D printed housing.  This camera has a shutter button to snap pictures and timelapse, an encoder to control exposure compensation, and has a GUI that can be used to switch between these modes, to display images taken with the camera that are stored in memory, and to display live view from the camera.  The 3D-printed housing allows space for attachment to a power supply and has openings for connections to the camera's tripod mount and the raspberry pi's power connector.

## Hardware Setup

### Components List

Raspberry Pi 4B

[Raspberry Pi High Quality HQ Camera - 12MP](https://www.adafruit.com/product/4561)

[16mm 10MP Telephoto Lens for Raspberry Pi HQ Camera - 10MP](https://www.adafruit.com/product/4562)

[Adafruit PiTFT - 320x240 2.8" TFT+Touchscreen for Raspberry Pi](https://www.adafruit.com/product/1601)

KY-040 Rotary Encoder Module

Power Supply //TODO give some specs like amps and voltage

### Wiring

Attach the camera and LCD according to the picture below; the LCD should connect to pins 1 through 26 on the raspberry pi, which include the SPI pins that the LCD uses.

![this is an image](IMG-8537.jpg "")

Wire the encoder to the raspberry pi as described in the following pinout.

|Raspberry Pi|Encoder|
|---|---|
|GPIO20|CLK|
|GPIO21|DT|
|GPIO16|SW|
|5V|VCC|
|GND|GND|

## Software Setup

Install [Raspberry Pi Imager](https://www.raspberrypi.com/software/) on computer and format the SD card with the Raspberry Pi OS (64-bit) operating system.  This systems is necessary for use with QT Creator for the GUI.  Boot up raspberry pi, follow the prompts on the screen, and once finished, run the following commands to update and install necessary software for LCD and GUI.
See installation instructions for [the LCD](https://learn.adafruit.com/adafruit-pitft-28-inch-resistive-touchscreen-display-raspberry-pi?view=all) and [QT Creator](https://forums.raspberrypi.com/viewtopic.php?t=69163) for more info for these steps.  [This link lists possible libraries needed for installing)(https://github.com/PhysicsX/QTonRaspberryPi).

```
sudo apt-get update
sudo apt-get upgrade
//TODO adafruit LCD stuff
//TODO QT creator stuff
```

Pi configuration settings and Adafruit instructions for LCD software setup and for the camera, then talk about installing QT creator.  Then clone this repository?

## Assembly

Download all .stl files in this repository and 3D print each of them.  //TODO
First screw 

## Results

Say what we achieved, and show videos and maybe pictures.

## Future work

The most lacking significant improvement is the use of a rechargeable battery instead of a power supply.  Future work for visual content capabilities includes video capture and playback, and a photo burst capability.  Lastly, the GUI could be further developed to edit images stored in memory.

## References

[Project that interfaces GPIO with QML](https://github.com/vigasan/RpiGpio)

[Project that intefaces the camera with C++ and QML](https://github.com/vigasan/CameraRpi)

## List of similar projects

Websites and Repos

[Ruha Camera](https://github.com/penk/ruha.camera)

[Vintage Raspberry Pi Camera](https://www.instructables.com/Vintage-Raspberry-Pi-Camera/)

[Raspberry Pi Makes Your Retro Analogue Camera Digital](https://www.raspberrypi.com/news/raspberry-pi-makes-your-retro-analogue-camera-digital/)

https://forums.raspberrypi.com/viewtopic.php?t=69163

## Notes (should be deleted eventually)

//introduction
//schema how cpp -> qml

//components list
---

//todo: hardware setup, schematic
3d printing, buttons, LCD

rpi setup
//todo: sd card imaging process, ssh, vnc

64-bit building directly on PI using QTcreator

terminal commands
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install ...

sudo apt-get install libqt5multimedia5-plugins qml-module-qtmultimedia
sudo apt-get install qml-module-qt-labs-folderlistmodel

//lcd setup
sudo apt-get install <LCD>..

//run on boot rc.local
