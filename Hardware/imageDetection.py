from pygame.locals import *
import pygame.camera

pygame.init()
pygame.camera.init()
cam = pygame.camera.Camera("/dev/video0", (320, 180))

import io
import os

from google.cloud import vision
from google.cloud.vision import types

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "vision.json"
client = vision.ImageAnnotatorClient()

# The name of the image file to annotate


def process_image(image_name):
    # Loads the image into memory
    with io.open(image_name, 'rb') as image_file:
        content = image_file.read()

    image = types.Image(content=content)

    # Performs label detection on the image file
    response = client.label_detection(image=image)
    labels = response.label_annotations

    print('Labels:')
    for label in labels:
        print(label.description)
    return [label.description for label in labels]


def capture(image_name="image.png"):
    try:
        os.remove(image_name)
    except Exception as e:
        print(e)
    cam.start()
    image = cam.get_image()
    cam.stop()
    pygame.image.save(image, image_name)
    return image_name


def process():

    print("processing")
    try:
        name = capture()
        process_image(name)
    except Exception as e:
        print(e)
