# Engineering Probability and Statistics - Computer Assignment 1

This repository contains the implementations, statistical simulations, and analytical models for the first computer assignment (CA1) of the **Engineering Probability and Statistics** course at the **University of Tehran**. 

To leverage advanced statistical frameworks and vectorized distribution modeling, all computational tasks and data visualization workflows were implemented in the **R programming language** within a Jupyter Notebook environment.

---

## Project Objectives & Implementation Strategy

The primary focus of this assignment is to explore paradoxes in expected value theory, simulate standard discrete distributions, and evaluate mathematical techniques for transforming random variables.

### 1. Expected Value Analysis & Game Theory Simulation
* **St. Petersburg Paradox:** Modeled a classic lottery game characterized by an infinite theoretical expected value. Implemented large-scale stochastic simulations to analyze empirical payoff averages, demonstrating how actual winnings diverge from theoretical infinity due to finite sample sizing and exponential step behaviors.

### 2. Hypergeometric and Binomial Distribution Modeling
* **Discrete Sampling Simulations:** Simulated conditional card-drawing scenarios without replacement to evaluate the probability mass function (PMF) of hypergeometric variables.
* **Asymptotic Approximation:** Compared the simulated outcomes against binomial models to analyze how sampling with replacement approximates sampling without replacement when population sizes scale up.

### 3. Central Limit Theorem & Asymptotic Convergence
* **Sample Mean Distributions:** Generated multiple independent sets of discrete distributions to observe the behavior of aggregated sample averages.
* **Gaussian Convergence Analysis:** Plotted the evolving distribution shapes against ideal normal curves, empirically validating the Central Limit Theorem (CLT) as sample sizes increased.

### 4. Continuous Variable Transformations & Distribution Generation
* **Logarithmic Inverse Transform Sampling:** Generated uniform continuous random variables and applied inverse logarithmic transformations to successfully synthesize true exponential distributions.
* **Box-Muller Transformation:** Implemented trigonometric joint-transformation algorithms to map pairs of independent uniform distributions into independent standard normal (Gaussian) distributions, validating the empirical frequency outputs against theoretical probability density functions (PDF).
