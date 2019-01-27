import serial
from time import sleep
from imageDetection import process
import requests

ser = serial.Serial('/dev/ttyACM0', 9600)
color = {"white": '1', "green": '2', "red": '3', "off": '4'}
url = "142.44.210.56"

while True:

    # res = input()
    # ser.write(color[res].encode())

    try:
        distance = int(ser.readline())
        print(distance)
        if distance < 5:

            ser.write(color["white"].encode())
            print("yes")
            labels = process()
            data = {'labels': labels}
            print(requests.post('http://{}:8080/open/waste'.format(url), json=data).json())
            sleep(0.5)
            ser.write(color["green"].encode())
            sleep(0.5)
            ser.write(color["off"].encode())
            sleep(0.5)
            distance = 100

    except KeyboardInterrupt as e:
        exit()

    except Exception as e:
        print("error: {}".format(e))
