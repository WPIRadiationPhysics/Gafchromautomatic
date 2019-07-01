# Gafchromautomatic
Scan, explore, and analyze RGB channels of irradiated Gafchromic film with MATLAB

## Synopsis
TODO

## Features
  - Course-grain scan of region-of-interest to find vertex of lowest grayscale
  - Immediate anisotropic critical-angle-of-interest from defined vertex location
  - Graphical and text output of radial and absolute/averaged angular grayscale data

## Usage
  1. Run gafchromautomatic.m in MATLAB
  2. Select an RGB Tiff image with *File->Open TIFF*
  3. Scan the image to find the vertex of lowest grayscale:
    a. Zoom into a sub-area of the image with *Zoom* and *Reset*
    b. Set image dots-per-inch parameter with *dpi*
    c. Choose courseness of averaging matrix scanning with *scan NxN*
    d. Initialize analysis with *Guess vertex*
  4. Override analysis parameters including vertex, location with horizontal and vertical sliders
  5. Select analyzing radius and averaging tolerance with respective sliders
  6. Override critical angle with slider
  7. Save absolute/averaged angular data to files with *File->Save outputs*

## Wishlist (priority)
  - Manage non-RGB TIFF images or non-TIFF images altogether (low)
  - Average multiple trials of film scans prior to analysis of combined (low)
  - Write-up synopsis of software in the context of intended projects (low)
  - Fix incorrect displays of critical angle editbox, slider values, and drawing (med)
  - Fix incorrect display of radial grayscale function plot (med)
  - Use native dialog box for file saving instead of instant local file creation (med)
  - Save radial grayscale function data to file (med)