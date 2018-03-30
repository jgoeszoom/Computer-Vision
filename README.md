# Die Roll Counter #
Takes an image with a die on some surface, in our testing we used a gameboard such as monopoly, and calculates the value of the die which
is then displayed in the top-left corner of the image as an overlay. 
The program uses the following method to determine the die value: 
* Utilizes Otsu's method to find the appropriate thresholding value. 
* Takes the calculated the threshold and uses it for binarization of the image, separating the foreground and background pixels. 
* The output of binarization is inverted (to make the die pits foreground pixels)
* Calculates the connected components of the image
* Calculates eccentricity, major and minor axes, and centroids of connected components
* Disregards components of high eccentricity (high means non-circular)
* Overlays what is believed to be detected die pits on the image (Die pits are hopefully the most circular object in image) as well as numerical value
  
## Getting Started ##
### Prerequisites ###
You will need to install the Computer Vision and Image Processing Toolbox from Matlab.

## Running the Program ##
You will need to create a directory of the images you wish to use, labeled in ascending numerical order. 
The program is written to read all images from a directory starting from 1-N. 
This is just how the program was initially created but can be altered accordingly. 

## Built With ##
* [Matlab](https://www.mathworks.com/products/matlab.html) - Programming Environment and Language

## Authors ##
* **Joseph Gozum**
* **Patrick Schell**

## Acknowledgements ##
* [Glen De Backer](https://www.simplicity.be/article/recognizing-dices/) - Inspiration for our project

