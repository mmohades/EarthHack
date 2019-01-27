from time import sleep
import serial
from gpiozero import DistanceSensor
seri = serial.Serial('/dev/ttyACM0', 9600)  # Establish the connection on a specific port
ultrasonic = DistanceSensor(echo=17, trigger=27, threshold_distance=0.9, max_distance=50)

color = {"white": '1', "green": '2', "red": '3', "off": '4'}
chosen = color["red"]

while True:

    print(ultrasonic.distance)
    # result = input()
    # seri.write(color[result].encode())
