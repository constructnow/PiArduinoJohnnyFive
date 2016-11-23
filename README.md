# PiArduinoJohnnyFive
Connecting and controlling an arduino through a Raspberry Pi and the Johnny Five library

This repo will demonstrate how to setup a raspberry pi and control and arduino on the same wireless network by
hosting a local nodejs server using express and serving a website to act as a controller for your device.

The end result will be an LED controlled by a web interface allowing us to switch the LED on and off

## What you will need:
- 1 x Raspberry Pi 3 (can use raspberry pi 2 with wireless adapter)
- 1 x Arduino (arduino nano used in this tutorial)
- 1 x Power pack / Powersource for the Raspberry Pi
- 1 x USB cable for the arduino
- A component of choice to control (We'll be using an LED)
- nodejs
- Firmata

## Steps
### 0. Prepairing your machine
This step will walkthrough the setup of node version manager nvm and install the latest stable version of nodejs.
If you have already installed nodejs and have npm, skip ahead to step 1.

First install NVM, NVM is a version manager for nodejs allowing you to have multiple versions of nodejs installed and easily switch between verions
To install NVM:

Mac/Linux: https://github.com/creationix/nvm#installation
Windows: https://github.com/coreybutler/nvm-windows

Now with nvm installed run the following command to install the latest version of nodejs
```
nvm install node
```

Once installed, you will need to tell nvm to use the latest version of nodejs
```
nvm use node
```


### 1. Flash the Arduino with Firmata
Install the Arduino desktop software on your PC/Mac from the link https://www.arduino.cc/en/Main/Software

Once the software's installed, install Interchange
Interchange is tool that allows you to install custom firmatas on your arduino device without using Arduino softare or compling firmware.
Install interchange globally using
```
npm install -g nodebots-interchange
```
Next, we're going to install the firmata software on the arduino board, plug in your Arduino. 

Firmata is a firmware that allows the arduino to relay information to and from it's components from a computer controlling the board.
It means we don't have to upload our code to arduino everytime we make a change.

```
interchange install --interactive
```
This will start an interactive propmt which allows us to select options with the arrow and enter keys.

The first question will be `Choose a firmware`, Select `StandardFirmata`


Then it will ask `Choose a board`, select which type of Arduino you're using


Finally it will ask you what port to choose, this will look for the COM port that your arduino device is connected on, select the COM port

Interchange will now pull in the correct firmware and flash your Arduino with Firmata.



### 2. Install Raspbian on the Raspberry Pi using NOOBS
### 3. Configure Raspbian
In a terminal run the following command:
``` 
sudo raspiconfig
```
This will open the Raspberry Pi configuration tool.

We want to change the device to allow ssh and vnc access.

We also want to change the hostname to something we can remember but also so it doesn't conflict with any other hostnames on the network, the default is raspberrypi.local

### 4. Setup your project on the Raspberry Pi
### 5. Run the express server on your network

## Refernces
Johnny Five Javascript Robotics & IOT library - http://johnny-five.io/
Interchange - https://github.com/johnny-five-io/nodebots-interchange