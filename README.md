# High Quality Digital Camera with GUI Touchscreen

## Project Team Members

David Nguyen, Saniya Datir, Dominik Fill

## Project Overview

//Summarize goals of project, desired capabilities, and primary hardware components.

This project combines a high-quality camera with an LCD touchscreen and a Raspberry Pi 4B+ //TODO to create a functional camera held together with a retro 3D printed housing.  This camera has a shutter button to snap pictures and timelapse, and has a GUI that can be used to switch between these modes, to display images taken with the camera that are stored in memory, and to display live view from the camera.  The 3D-printed housing allows space for a battery //TODO and has openings for connections to the camera's tripod mount and the raspberry pi's power connector.  //TODO encoder

## Hardware Setup

### Components List

[Raspberry Pi 4B+ //TODO](//TODO)

[High Quality Camera](https://www.adafruit.com/product/4561)

[LCD Touchscreen](https://www.adafruit.com/product/1601)

Pushbutton

[Encoder](//TODO)

Power Supply //TODO give some specs like amps and voltage

### Schematic

//TODO picture and a diagram

|Raspberry Pi|LCD|Pushbutton|Encoder|
|---|---|---|---|
|||||
|||||
|||||
|||||
|||||
|||||

## Software Setup

Start with formatting SD card followed by Pi configuration settings and Adafruit instructions for LCD software setup and for the camera, then talk about installing QT creator.  Then clone this repository?

## Assembly

3D print the stl files, get some glue and put this thing together.

## Results

Say what we achieved, and show videos and maybe pictures.

## Future work

List some improvements we didn't get around to.

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
