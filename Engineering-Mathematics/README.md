# Nyquist-Shannon Sampling Theorem & Biomedical Applications - Winter 2024

This folder contains the core research documentation, analytical models, and presentation details regarding the **Nyquist-Shannon Sampling Theorem** and its critical role in advanced medical imaging systems.

## Research Overview & Core Objectives
The presentation bridges the gap between foundational information theory and real-world engineering, tracking the evolution of sampling concepts from Harry Nyquist's 1928 breakthrough on communication channel limits to Claude Shannon's 1948 mathematical proofs.

### Key Topics Covered:
* **Mathematical Foundation:** Continuous-to-discrete signal conversion and perfect reconstruction using ideal low-pass filtering and $sinc$ interpolation.
* **The Aliasing Phenomenon:** Analytical and frequency-domain evaluation of signal overlapping when the sampling rate falls below the Nyquist rate ($f_s < 2f_m$).
* **Practical Constraints:** Oversampling requirements ($f_s > 2f_m$) due to the non-ideal, physical nature of real-world analog filters.

## Special Focus: MRI Brain Scans & Aliasing Artifacts
A major highlight of this project is demonstrating how the sampling theorem dictates data acquisition parameters in **Magnetic Resonance Imaging (MRI)** systems:
* **K-Space Spatial Sampling:** Understanding how frequency and phase encoding sample biological tissues (like brain structures) at specific spatial frequencies.
* **Wrap-Around Artifacts:** Simulating and analyzing how under-sampling spatial frequencies leads to severe **Aliasing (Wrap-around)** artifacts, where peripheral parts of the brain wrap into the opposite sides of the reconstructed medical image.

---

---

## Deliverables & Media Assets
**[presentation_script.md](./presentation_script.md):** The comprehensive, slide-by-slide technical script and full textual breakdown of the research.
**Python & Manim Animations:** To visually demonstrate complex mathematical concepts such as spectrum replication, filtering, and aliasing, custom mathematical animations were programmatically generated using **Python (Manim Engine)**.
**Video Presentation:** Due to GitHub's file size limits for media assets, the high-definition recorded presentation is hosted securely on Google Drive.
**Language Note:** Please note that while the repository documentation is in English, the final video presentation and research discussion are delivered in **Persian (فارسی)**.

[Watch the Full Video Presentation on Google Drive](https://drive.google.com/file/d/1G5XNtvLQjFOQXdnJPuheBMlEgmqPN6Rc/view)
