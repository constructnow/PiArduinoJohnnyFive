mkdir control_arduino_pi
cd control_arduino_pi

sudo apt-get install arduino -y
git clone https://github.com/nanpy/nanpy
git clone https://github.com/nanpy/nanpy-firmware

cd nanpy-firmware
./configure.sh

# you need to manually configure the nanpy-firware 
# nano Nanpy/cfg.h
# once configured run the following below

cd ..

cp -avr nanpy-firmware/ ~/sketchbook/libraries

# now you need to use the arduino gui to uplaod the firmare to the arduino

sudo python nanpy/setup.py install

cd ..

sudo tee buttonLED.py <<EOF
from nanpy import (ArduinoApi, SerialManager)
from time import sleep

ledPin = 7
buttonPin = 8
ledState = False
buttonState = 0

try:
	connection = SerialManager()
	a = ArduinoApi(connection = connection)
except:
	print "Failed to connect to Arduino"

# Setup the pinModes as if we were in the Arduino
a.pinMode(ledPin, a.OUTPUT)
a.pinMode(buttonPin, a.INPUT)

try:
	while True:
		buttonState = a.digitalRead(buttonPin)
		print "Our button state is {}".format(buttonState)
		if buttonState:
			if ledState:
				a.digitalWrite(ledPin, a.LOW)
				ledState = False
				print "LED Off"
				sleep(1)
			else:
				a.digitalWrite(ledPin, a.HIGH)
				ledState = True
				print "LED On"
				sleep(1)
except:
	a.digitalWrite(ledPin, a.LOW)
EOF