
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

- For generating an energy map in the horizontal direction, this formula is used for any (i,j) pixel:
<div align="center">
  
```MATLAB
M(i,j) = Energy(i,j) + min(M(i-1,j-1), M(i,j-1), M(i+1,j-1))
```
  
</div>

- And, for the vertical direction, the below formula is used for all (i,j) pixels:
<div align="center">
  
```MATLAB
M(i,j) = Energy(i,j) + min(M(i-1,j-1), M(i-1,j), M(i-1,j+1)) 
```
  
</div>


### Optimal Pixel Paths Using Dynamic Programming
- After the low-cost energy matrix is generated, pixel paths can be computed through the image, defined to be 'low-energy' seams. Let's walkthrough an example of finding a pixel path in the vertical direction. We start with E, our energy matrix:

<div align="center">
  
```python
      1    3    0
E  =  2    8    9
      5    2    6
```
  
</div>

- Then, the M (low-cost energy) matrix is generated as a heatmap, with the aforementioned M functions:
<div align="center">
  
```python
      1     3     0
M  =  3     8     9
      8     5    14
```
</div>

- Finally, a pixel path is identified using a low-cost approach from the bottom-up:
  
<div align="center">
  
```python
      [1]   3     0
M  =  [3]   8     9
       8   [5]   14
```
  
</div>

- This leaves us with our optimal path, `5 -> 3 -> 1` in the M matrix, which is `2 -> 2 -> 1` in the E matrix. From our original input image, the first vertical seam to be removed would look like this: 

<div align = "center">
<img width="450" src="https://user-images.githubusercontent.com/49384703/147892253-3f2c8bce-1c58-4ec1-b120-db9259994a65.png">
</div>


<!-- <img width="527" src="https://user-images.githubusercontent.com/49384703/146864610-8cc3668e-7af3-4645-93d3-2abc6d6fe389.png">
<img width="886" src="https://user-images.githubusercontent.com/49384703/146864618-cf368c50-b0a2-4443-98b5-5b36dd9062f5.png">
<img width="529" src="https://user-images.githubusercontent.com/49384703/146864622-9403dc23-3513-499d-b6e5-7bed8b2d3f2f.png">
<img width="886" alt="vert" src="https://user-images.githubusercontent.com/49384703/146864626-e48aa5a6-398f-4ed7-8d51-21d9fb3985a9.png"> -->

  
## Demo

Here's a demonstration of vertically carving seams. Notice how it carves around the Porsche 911, removing low-energy paths:
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

## More Examples
Let's look at some more naive (crop) resizes vs CAIR.

|         Input Image      |         Naive Resize      | CAIR    
:-------------------------:|:-------------------------:|:-------------------------:|
<img width="1000" height="250" src="https://user-images.githubusercontent.com/49384703/148001141-237ded52-ce41-47aa-8033-4b4db84990b6.png"> |  <img width="475" height="250" src="https://user-images.githubusercontent.com/49384703/148001138-25eb577d-d9e0-4a9b-8119-c8bcfd6c0202.png"> |  <img width="475" height="250" src="https://user-images.githubusercontent.com/49384703/148001134-660aacb9-000d-4b6c-88a6-078f53f5e81c.png"> 
<!-- 
![750boat](https://user-images.githubusercontent.com/49384703/148001134-660aacb9-000d-4b6c-88a6-078f53f5e81c.png)
![naive750boat](https://user-images.githubusercontent.com/49384703/148001138-25eb577d-d9e0-4a9b-8119-c8bcfd6c0202.png)
![originalboat](https://user-images.githubusercontent.com/49384703/148001141-237ded52-ce41-47aa-8033-4b4db84990b6.png) -->


## Deployment

To test this project run

```MATLAB
>> /seam-carving/a1.m
```

## Acknowledgements

 - Avidan, S., & Shamir, A. (2007). Seam carving for content-aware image resizing. In ACM SIGGRAPH 2007 papers [(pp. 10-es)](https://faculty.idc.ac.il/arik/SCWeb/imret/index.html).
