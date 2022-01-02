
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
- [X] Live seam-by-seam carving output

## How does it work?

### Calculating the Energy of an Image
- Gradients are first computed using the Sobel operator on the input image for the purpose of energy calculation. By taking derivatives between adjacent pixels, this algorithm is able to identify sharp changes in pixel values, better defined as 'edges'. A Sobel filter is applied through convolution to accomplish this on the input image, demonstrated on a 3x3 grid:

<div align="center"> <img width="300" src="https://user-images.githubusercontent.com/49384703/147888088-678ce123-5155-4497-a0bd-8e124d5b7578.gif"> </div>

-  This is the preliminary step and allows for rough identification of objects, which will later be used to determine optimal pixel paths. Shown below is the result of mass-applying the convolution across the whole input image to generate a gradient map:

<div align="center">
  
|         Input Image      |         Gradient Map      
:-------------------------:|:-------------------------:|
<img width="600" height="300" src="https://user-images.githubusercontent.com/49384703/146864622-9403dc23-3513-499d-b6e5-7bed8b2d3f2f.png"> |  <img width="600" height="300" src="https://user-images.githubusercontent.com/49384703/146864610-8cc3668e-7af3-4645-93d3-2abc6d6fe389.png"> 
  
</div>

### Generating Low-Cost Energy Matrices
- Once a gradient map has been produced, the process to identify pixel paths is made easier. The next step is generating heatmaps, in both the vertical and horizontal directions, to represent the low-cost energy matrix.

<div align="center">

|        Horizontal Heatmap     |        Vertical Heatmap
:-------------------------:|:-------------------------:|
| <img width="600" height="300" src="https://user-images.githubusercontent.com/49384703/146864618-cf368c50-b0a2-4443-98b5-5b36dd9062f5.png"> | <img width="600" height="300" src="https://user-images.githubusercontent.com/49384703/146864626-e48aa5a6-398f-4ed7-8d51-21d9fb3985a9.png">

</div>

- These heatmaps showcase the cumulative minimum energy for any pixel at (i,j) in either the horizontal or vertical directions. In the above images, a bottom-up matrix has been generated that considers the energies of all 3 neighboring pixels, summing energies as the image is parsed.

### Optimal Pixel Paths
- After the low-cost energy matrix is generated, pixel paths can be computed through the image, defined to be 'low-energy' seams.

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
