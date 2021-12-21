
# Seam Carving for Content-Aware Image Resizing (CAIR)

[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/) [![MATLAB](https://img.shields.io/badge/MATLAB-R2021a-orange)](https://www.mathworks.com/help/matlab/release-notes.html) [![macOS](https://svgshare.com/i/ZjP.svg)](https://svgshare.com/i/ZjP.svg)

This is a reimplementation of the seam-carving algorithm described in a 2007 ACM SIGGRAPH paper from S. Avidan and S. Amir.

## 🚧 Full README still under construction 🚧

## License

[MIT](https://choosealicense.com/licenses/mit/)

  
## Features

- [X] Resize an image both horizontally & vertically
- [X] Use of dynamic programming in 8-connected pixel paths
- [X] Sobel operator used for better gradient thresholding
- [X] Multidirectional energy maps
- [X] Seam-by-seam carving live output

## How does it work?
- Gradients are first computed on the input image for the purpose of edge detection. This is the preliminary step before a heatmap of an image is generated.
- THe next 

|         Input Image      |         Gradient Map      
:-------------------------:|:-------------------------:|
<img width="800" src="https://user-images.githubusercontent.com/49384703/146864622-9403dc23-3513-499d-b6e5-7bed8b2d3f2f.png"> |  <img width="800" src="https://user-images.githubusercontent.com/49384703/146864610-8cc3668e-7af3-4645-93d3-2abc6d6fe389.png"> 

|        Horizontal Heatmap     |        Vertical Heatmap
:-------------------------:|:-------------------------:|
| <img width="800" src="https://user-images.githubusercontent.com/49384703/146864618-cf368c50-b0a2-4443-98b5-5b36dd9062f5.png"> | <img width="800" alt="vert" src="https://user-images.githubusercontent.com/49384703/146864626-e48aa5a6-398f-4ed7-8d51-21d9fb3985a9.png">


<!-- <img width="527" src="https://user-images.githubusercontent.com/49384703/146864610-8cc3668e-7af3-4645-93d3-2abc6d6fe389.png">
<img width="886" src="https://user-images.githubusercontent.com/49384703/146864618-cf368c50-b0a2-4443-98b5-5b36dd9062f5.png">
<img width="529" src="https://user-images.githubusercontent.com/49384703/146864622-9403dc23-3513-499d-b6e5-7bed8b2d3f2f.png">
<img width="886" alt="vert" src="https://user-images.githubusercontent.com/49384703/146864626-e48aa5a6-398f-4ed7-8d51-21d9fb3985a9.png"> -->

  
## Demo

Here's a demonstration of vertically carving seams:
<p align="center">
  <img src="https://user-images.githubusercontent.com/49384703/146843024-f3e40187-f72e-43cb-8b32-b3fa738da04b.gif" width=400> 
</p>

And here's what it looks like in the horizontal direction:
<p align="center">
  <img src="https://user-images.githubusercontent.com/49384703/146843037-89a992ed-b6d1-4c71-bda7-13076cc5bef8.gif" width=400> 
</p>

Finally, here's what a full demonstration looks like.

<p align="center">
  <img src="https://user-images.githubusercontent.com/49384703/146843044-55c62bd1-e1bc-4f1a-a811-46f304c1bfb5.gif" width=400> 
</p>

## Deployment

To test this project run

```MATLAB
>> /seam-carving/a1.m
```

## Acknowledgements

 - Avidan, S., & Shamir, A. (2007). Seam carving for content-aware image resizing. In ACM SIGGRAPH 2007 papers [(pp. 10-es)](https://faculty.idc.ac.il/arik/SCWeb/imret/index.html).
