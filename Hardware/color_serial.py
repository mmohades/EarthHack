import serial
from time import sleep
ser = serial.Serial('/dev/cu.usbmodem141401', 9600)


color = {"white": '1', "green": '2', "red": '3', "off": '4'}

while True:

    # res = input()
    # ser.write(color[res].encode())

    try:
        distance = int(ser.readline())
        print(distance)
        if distance < 5:
            print("yes")
            sleep(0.5)
            ser.write(color["white"].encode())
            sleep(0.5)
            ser.write(color["green"].encode())
            sleep(0.5)
            ser.write(color["off"].encode())
            sleep(0.5)
            distance = 100

    except:
        print("data was not integer")
