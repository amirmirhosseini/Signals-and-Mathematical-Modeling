# Engineering Probability and Statistics - Computer Assignment 2

This repository contains the numerical implementations, statistical models, and exploratory data analysis for the second computer assignment (CA2) of the **Engineering Probability and Statistics** course at the **University of Tehran**. 

All modeling frameworks, discrete/continuous queue simulations, and statistical parameter estimations were built entirely using **Python**, leveraging **NumPy** for numerical workflows, **SimPy** for discrete-event process modeling, and **Matplotlib/Seaborn** for descriptive data visualization.

---

## Project Objectives & Implementation Strategy

The primary focus of this assignment is to apply Bayesian estimation to sequence data, model complex queue operations via discrete-event simulations, and analyze temporal correlations within physical datasets.

### 1. Bayesian Parameter Estimation (Coin Flipping Simulator)
* **Sequential Probability Updating:** Modeled a coin-tossing process where the true parameter governing success rates is treated as a random variable rather than a fixed unknown constant.
* **Conjugate Prior Updating (Beta-Binomial Model):** Implemented an iterative Bayesian updating
