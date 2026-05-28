# Signals and Systems - Computer Assignment 4

This repository contains the MATLAB implementation and project report for the fourth computer assignment of the Signals and Systems course at the University of Tehran, focusing on digital communication and amplitude-based signal coding.

## Project Overview
* **Character-to-Binary Mapping:** Generating a custom 5-bit binary map (`Mapset`) for standard English characters, spaces, and punctuation marks.
* **Amplitude Coding & Decoding:** Implementing transmitter and receiver models to modulate text messages into continuous-time sinusoidal signals with varying transmission speeds (1, 2, and 3 bits/second) using multi-level amplitude decision thresholds.
* **Noise Robustness & Threshold Analysis:** Simulating communication performance over a noisy channel by introducing zero-mean Gaussian noise ($AWGN$). The analysis tracks the maximum tolerable noise variance ($\sigma^2$) for each bit-rate before decoding errors occur, evaluating the trade-off between power efficiency, transmission speed, and signal-to-noise ratio ($SNR$).
