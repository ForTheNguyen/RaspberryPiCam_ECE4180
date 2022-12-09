# Raspberry Pi Handheld Touchscreen Camera with Touchscreen and HQ Camera Module

Project Team Members:
David Nguyen, Saniya Datir, Dominik Fill


## Project Overview

This project combines the Raspberry Pi HQ camera module with an Adafruit 2.8" PiTFT LCD touchscreen, combination pushbutton rotary encoder, and a Raspberry Pi 4B to create a retro-style digital handheld camera.

This camera has a shutter button to take pictures, a rotary encoder to control timelapse settings, and a GUI that can be used to switch between pages, whether it'd to display images taken with the camera, or to display live view from the camera.  The 3D-printed housing still allows access to the HQ camera module's tripod mount.




## Hardware Setup

### What you'll need:

- Raspberry Pi 4B (or any Raspberry Pi platform capable of running 64-bit Raspian)

- [Raspberry Pi High Quality HQ Camera - 12MP](https://www.adafruit.com/product/4561)
(any C-mount lens is compatible with the HQ camera module. Adjustable backfocus on the module allows for most lenses to work with a given adapter to C-mount)

- [16mm 10MP Telephoto Lens for Raspberry Pi HQ Camera - 10MP](https://www.adafruit.com/product/4562)

- [Adafruit PiTFT - 320x240 2.8" TFT+Touchscreen for Raspberry Pi](https://www.adafruit.com/product/1601)

- KY-040 Rotary Encoder Module

- Wires for connecting the rotary encoder to the Pi's GPIO

## LCD

This project will be using the Adafruit PiTFT 2.8" resistive touchscreen as our display and input method. This screen was chosen mainly for convenience as its form factor and driver support allow for easy installation; however, any generic SPI LCD display can also work with a little tinkering. It will be explained more in depth later, but we'll be mirroring the Pi's HDMI output to the display using the fbcp utility rather than having the display act as a raw framebuffer device, also for convenience.


### Wiring
The LCD sits neatly on top of the Pi occupying the first 26 pins of the Pi's header, leaving a few pins open for us to use as GPIO inputs. Attach the camera and LCD like the picture below; the LCD should connect to pins 1 through 26 on the raspberry pi, which include the SPI pins that the LCD uses.


![this is an image](IMG-8537.jpg "")

We'll wire the rotary encoder to some of the Pi's GPIO pins. Two pins for the rotary encoder, CLK and DT, and one pin for the pushbutton, SW. The encoder module will need 3-5V power as well. In this case since the LCD occupies all of the Pi's VCC pins, we'll have to tie into the 26-pin socket on the LCD intended for the optional ribbon cable. 

|Raspberry Pi|Encoder|
|---|---|
|GPIO20|CLK|
|GPIO21|DT|
|GPIO16|SW|
|5V|VCC|
|GND|GND|

## Software Setup
This project will be done with QML and C++ for the front and backend respectively. The more conventional approach would be to set up a cross compiler and tool-chain to develop and compile in qtCreator on your local Linux machine. After a lot of trial and error though, we weren't able to sucessfully do that, so instead, we'll be developing with qtCreator straight on the Pi. It's not the fastest or most reliable solution, but it's simple and will work just enough for our case. Keep in mind only B-variants and the Zero W 2 can run 64-bit Raspian, so if you do not have a Pi B, then a Linux cross compiler will be your only option. 

First we'll need a 64-bit image of Raspian OS on our Pi. The setup process is fairly standard, and the Pi Foundation has a great application to help us out.
Install [Raspberry Pi Imager](https://www.raspberrypi.com/software/) on your computer, start it up, and select your boot drive. Then select your desired operating system (Raspberry Pi OS 64-bit Bullseye, the latest release at this time) and hit write. After that, plug your boot drive into the Pi and continue with the set up process. If you're developing headless, then it helps to set up SSH and WiFi settings in the Raspberry Pi Imager before writing to the drive (the gear icon bottom right). 

See installation instructions for [the LCD](https://learn.adafruit.com/adafruit-pitft-28-inch-resistive-touchscreen-display-raspberry-pi?view=all) and [QT Creator](https://forums.raspberrypi.com/viewtopic.php?t=69163) for more info for these steps.  [This link lists possible libraries needed for installing)(https://github.com/PhysicsX/QTonRaspberryPi).

Other stuff: https://forums.raspberrypi.com/viewtopic.php?t=69163

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

[Ruha Camera](https://github.com/penk/ruha.camera)

[Vintage Raspberry Pi Camera](https://www.instructables.com/Vintage-Raspberry-Pi-Camera/)

[Raspberry Pi Makes Your Retro Analogue Camera Digital](https://www.raspberrypi.com/news/raspberry-pi-makes-your-retro-analogue-camera-digital/)

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
