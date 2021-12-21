
# Seam Carving for Content-Aware Image Resizing (CAIR)

[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/) [![MATLAB](https://img.shields.io/badge/MATLAB-R2021a-orange)](https://www.mathworks.com/help/matlab/release-notes.html) [![macOS](https://svgshare.com/i/ZjP.svg)](https://svgshare.com/i/ZjP.svg)

This is a reimplementation of the seam-carving algorithm described in a 2007 ACM SIGGRAPH paper from S. Avidan and S. Amir.

## 🚧 Full README still under construction 🚧

## License

[MIT](https://choosealicense.com/licenses/mit/)

  
## Features

- Energy Heatmaps
- Live seam-carving
- Dynamic programming in 8-connected pixel paths
- Identification of important information
  
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
