from time import sleep
import serial
seri = serial.Serial('/dev/ttyACM0', 9600)  # Establish the connection on a specific port

color = {"white": '1', "green": '2', "red": '3', "off":'4'}
chosen = color["red"]

while True:
    result = input()
    seri.write(color[result].encode())
