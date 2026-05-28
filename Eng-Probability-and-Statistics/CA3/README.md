# Engineering Probability and Statistics - Computer Assignment 3

This repository contains the numerical implementations, statistical models, and theoretical analysis for the third computer assignment (CA3) of the **Engineering Probability and Statistics** course at the **University of Tehran**. 

All computational tasks, stochastic simulations, and optimization frameworks were built entirely using **Python**, leveraging **NumPy** and **SciPy** for statistical computing and mathematical operations, and **Matplotlib/Seaborn** for data visualization.

---

## Project Objectives & Implementation Strategy

The primary focus of this assignment is to validate asymptotic convergence theorems, investigate geometric optimization in error minimization, and evaluate the efficiency of statistical parameter estimators.

### 1. Central Limit Theorem & Asymptotic Convergence
* **Gaussian Convergence Validation:** Simulated large-scale discrete processes to evaluate the practical boundaries of the Central Limit Theorem (CLT) using mathematical frameworks such as Moment Generating Functions (MGF).
* **Continuous PDF Alignment:** Implemented integral scaling corrections via Riemann sum models to systematically align continuous theoretical normal curves with discrete simulated probability distributions as sample sizes scaled up.

### 2. Linear Regression & Mean Squared Error Optimization
* **Geometric Loss Analysis:** Investigated the multi-dimensional geometric properties of the Mean Squared Error (MSE) loss surface to analyze structural behaviors of statistical regression models.
* **Global Minimizer Identification:** Derived and plotted mathematical optimization paths to prove that the joint coordinate of the empirical means acts as the absolute center minimizer for dataset squared errors.

### 3. Parameter Estimation & Confidence Interval Bounds
* **Estimator Efficiency Analysis:** Constructed statistical frameworks to evaluate parameter estimation efficiency, explicitly analyzing estimator unbiasedness and mathematical variance thresholds.
* **Continuous Confidence Regions:** Generated reproducible simulated sampling distributions, mapping bounded numerical confidence intervals to track empirical coverage probability trends.
