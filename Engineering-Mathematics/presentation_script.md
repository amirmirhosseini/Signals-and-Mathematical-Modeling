# Technical Presentation Script: The Nyquist-Shannon Sampling Theorem

## 1. Introduction & Historical Context
This research explores the historical breakthroughs that shaped modern digital communications and signal processing. Before Harry Nyquist, the understanding of communication networks was highly empirical. In 1928, Nyquist published a revolutionary paper proving that communication channels possess physical bandwidth limitations that attenuate higher frequencies. He addressed a fundamental question: *How many discrete frequency components are required to fully preserve a continuous signal's information?* Nyquist proved that if samples are maintained at intervals of $1/2f$, the complete signal profile remains retrievable. Twenty years later, in 1948, Claude Shannon formalized this concept mathematically, establishing the cornerstone of information theory known today as the **Nyquist-Shannon Sampling Theorem**.

## 2. Mathematical Proof & Signal Reconstruction
The theorem states that a continuous-time signal $x(t)$ band-limited to $f_m$ Hz can be uniquely determined and perfectly reconstructed from its discrete samples if it is sampled at a rate $f_s$ greater than or equal to the Nyquist rate ($f_s \ge 2f_m$). 

The analytical proof utilizes the Fourier Transform of the sampled signal, denoted as $X_{sampled}(f)$, which creates periodic replicas of the original spectrum $X(f)$ shifted by multiples of $f_s$. If the Nyquist criterion is met, these replicas do not overlap. Consequently, the original analog signal can be perfectly reconstructed in the time domain by passing the discrete samples through an ideal low-pass filter, which mathematically translates to a convolution with a $sinc$ interpolation function.

## 3. The Aliasing Phenomenon & Engineering Constraints
When a system samples below the required threshold ($f_s < 2f_m$), the periodic spectral replicas overlap in the frequency domain. This distortion is known as **Aliasing**. Once aliasing occurs, high-frequency components masquerade as lower frequencies, making perfect reconstruction mathematically impossible. In practical engineering systems, since ideal brick-wall filters do not exist, engineers utilize **Oversampling** and analog anti-aliasing filters to create a guard band, ensuring signal integrity before digitization.

## 4. Biomedical Application: MRI Brain Imaging
The practical section of this project examines how the sampling theorem governs data acquisition in **Magnetic Resonance Imaging (MRI)** systems. Instead of sampling directly in the spatial domain, an MRI scanner collects data in the spatial-frequency domain, known as **K-Space**. 

When performing an MRI scan of human anatomy (such as brain tissue), the field of view (FOV) and the grid matrix size determine the spatial sampling interval ($\Delta k$). If the spatial sampling rate is too low—failing to satisfy the Nyquist criterion for the target FOV—it induces a specific spatial aliasing artifact known as **Wrap-Around**. This causes anatomical structures outside the selected FOV (e.g., the back of the head or ears) to fold over and fold back onto the opposite side of the final reconstructed image, severely corrupting the diagnostic value of the medical scan.

## 5. Visualizing Mathematics via Manim (Python)
To provide an intuitive and dynamic understanding of the Fourier transformations and sampling intervals, several plot animations within the video presentation were programmatically generated using **Manim (Mathematical Animation Engine)** in **Python**. By converting mathematical equations into vectorized code, we simulated the dynamic stretching of spectrums, real-time impulse train sampling, and the literal "overlapping" of frequencies during aliasing. This programmatic approach ensures high-fidelity visual accuracy, matching the rigorous theoretical framework of the presentation.
