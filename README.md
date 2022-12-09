# High Quality Digital Camera with GUI Touchscreen

## Project Team Members

David Nguyen, Saniya Datir, Dominik Fill

## Project Overview

//Summarize goals of project, desired capabilities, and primary hardware components.

This project combines a high-quality camera with an LCD touchscreen, an encoder, and a Raspberry Pi 4B to create a functional camera held together with a retro 3D printed housing.  This camera has a shutter button to snap pictures and timelapse, an encoder to control exposure compensation, and has a GUI that can be used to switch between these modes, to display images taken with the camera that are stored in memory, and to display live view from the camera.  The 3D-printed housing allows space for attachment to a power supply and has openings for connections to the camera's tripod mount and the raspberry pi's power connector.

## Hardware Setup

### Components List

Raspberry Pi 4B

[High Quality Camera](https://www.adafruit.com/product/4561)

[LCD Touchscreen](https://www.adafruit.com/product/1601)

KY-040 Rotary Encoder Module

Power Supply //TODO give some specs like amps and voltage

### Wiring

Attach the camera and LCD according to the picture below, and wire the encoder to the raspberry pi as described in the following pinout.

|Raspberry Pi|Encoder|
|---|---|
|GPIO20|CLK|
|GPIO21|DT|
|GPIO16|SW|
|5V|VCC|
|GND|GND|

## Software Setup

Install [Raspberry Pi Imager](https://www.raspberrypi.com/software/) on computer and format the SD card with the Raspberry Pi OS (64-bit) operating system.  This systems is necessary for use with QT Creator for the GUI.  Boot up raspberry pi, follow the prompts on the screen, and once finished, run the following commands to update and install necessary software for LCD and GUI.  See installation instructions for [the LCD](https://learn.adafruit.com/adafruit-pitft-28-inch-resistive-touchscreen-display-raspberry-pi?view=all) and [QT Creator](https://forums.raspberrypi.com/viewtopic.php?t=69163) for more info for these steps.

```
sudo apt-get update
sudo apt-get upgrade
//TODO adafruit LCD stuff
//TODO QT creator stuff
```

Pi configuration settings and Adafruit instructions for LCD software setup and for the camera, then talk about installing QT creator.  Then clone this repository?

## Assembly

Download all .stl files in this repository and 3D print each of them.  //TODO
3D print the stl files, get some glue and put this thing together.

## Results

Say what we achieved, and show videos and maybe pictures.

## Future work

The most lacking significant improvement is the use of a rechargeable battery instead of a power supply.  Future work for visual content capabilities includes video capture and playback, and a photo burst capability.  Lastly, the GUI could be further developed to edit images stored in memory.

## List of similar projects

64-bit building directly on PI using QTcreator

Youtube videos

https://www.youtube.com/watch?v=8PDsi6aq5ho

https://www.youtube.com/watch?v=HxNHlhv74tA

Websites and Repos

ruha.camera

https://learn.adafruit.com/adafruit-pitft-28-inch-resistive-touchscreen-display-raspberry-pi

https://forums.raspberrypi.com/viewtopic.php?t=69163

https://github.com/PhysicsX/QTonRaspberryPi

https://github.com/vigasan/RpiGpio
https://github.com/vigasan/CameraRpi

//introduction
//schema how cpp -> qml

//components list
---

//todo: hardware setup, schematic
3d printing, buttons, LCD

rpi setup
//todo: sd card imaging process, ssh, vnc

terminal commands
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install ...

sudo apt-get install libqt5multimedia5-plugins qml-module-qtmultimedia
sudo apt-get install qml-module-qt-labs-folderlistmodel

//lcd setup
sudo apt-get install <LCD>..

//run on boot rc.local
