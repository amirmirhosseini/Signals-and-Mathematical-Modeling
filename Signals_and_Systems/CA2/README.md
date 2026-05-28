# Signals and Systems - Computer Assignment 2

This repository contains the MATLAB implementation and report for the second computer assignment of the Signals and Systems course at the University of Tehran, focusing on image processing and license plate recognition.

## Project Overview
* **Part 1 & 2 (Image Preprocessing & OCR):** Implementing custom functions for grayscale conversion, binarization, connected-component analysis, and character segmentation to read standard license plates.
* **Part 3 (Vehicle License Plate Extraction):** Utilizing multi-channel 2D Cross-Correlation (`normxcorr2`) to detect and isolate the license plate region from a full car front-view image based on the national flag template.
* **Part 4 (Video Processing & Speed Estimation - Incomplete):** An algorithmic attempt to estimate a vehicle's average speed across video frames by tracking the license plate location. The core logic uses template matching over multiple bounding boxes, though the current implementation faces execution timeouts during localized correlation loops.
