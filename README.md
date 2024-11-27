<<<<<<< HEAD
# Package description
A package that contains different image filters to apply to you image.
Contains four different filters; grayscale, cutoff, red/green/blue and chosen 
color based on RBG values. Provide the path to your image and the package will
enable you to apply the different filters and save the image to your directory.
You need to load your image path to the object "image_path" and loaf both the 
magick and ImageFilter library. Then you can use the provided "apply_filter"
functions to generate a filtered image which can then be saved. 

Contains:
- Functions which filter the image
- Functions which apply the filters
- Function to convert the raw vector to a image # Or build if you open the R project file


# How to run the package and examples 
**Install packages**  
install.packages("magick")  
install.packages("ImageFilter") 

**Load libraries**  
library(ImageFilter)  
library(magick)


**Load the image**  
**Assign the path to the image you want to use in the filter (replace with your file path or image name if in the working directory)**    
image_path <- "Test_image_1.jpg"  


**Apply the chosen filter to your image**  
**Assign the filter function to an object to be able to print and save the image**

**Apply filter**  
***Filter_type chosen form examples below:***
  
  ***For grayscale : "grayscale_filter"***
  
  ***For cutoff : "cutoff_filter"***
  
  ***For red : "red_filter"***
  
  ***For green : "green_filter"***
  
  ***For blue : "blue_filter"***
  
  ***For custom color : "custom_filter", RGB = c(155, 0, 155)***
  
  filtered_image <- apply_filter(image_path, filter_type, RGB)   
**View the final image**  
print(gray_image)  
**Save the final image as a JPEG, change path to the name and location desired**  
image_write(gray_image, path = "gray_image.jpg", format = "jpeg")

# ImageFilterUpdate
Updated version of the imagefilter

