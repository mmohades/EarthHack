# EarthHack
**A Hackathon Project at VCU**

[Link to Devpost](https://devpost.com/software/trashup-e6xznk)

## Demo
<img src="Hardware/demo.gif" width="300" height="500" />

## Inspiration
As lifestyles and technologies advance, we tend to create more pollution. Most of the pollution becomes waste and end up in landfills. Despite the fact that a great portion of the wastes can be recycled, they end up in the landfill because of lack of proper knowledge or ignorance. This project will help to increase the rate of recycling and to reduce the damage to the environment.

## What it does
It provides a quick way to sort out the recyclable waste by image processing technology. It can be used for residential purposes for categorizing regular wastes and for professional ones for such as biohazardous wastes in hospitals.

## How we built it
During the Earth hack we used a combination of cardboards and foams to build the structure of our smart trash can. We connected our software to the bin using a combination of Arduino and two Raspberry pies to control several servos and transfer the data from the Ultrasonic sensors and the webcam to dedicated servers.
After the ultrasonics and sensors detect the material, the webcam sends a picture of it to the servers that using Watson vision API to process the picture. After receiving the results from the Watson servers, we had to calibrate the results to match our goals.
By detecting the material type, it was the time to use a step motor to push the desired material into the smart can. By using the servos, to open up the different sections related to the type of material, we were able to divide the trashes.

## Accomplishments that we're proud of
We were able to design a smart trash can with high accuracy to detect different types of wastes and categorize them. In addition, it is able to measure certain recyclable wastes such as water bottles to calculate the amount of beverage container deposit on the app.

## What we learned
We learned how to use several pieces of hardware and programs to create the desired product.

## What's next for GreenAI
An official product can be designed for mass production after marketing.
