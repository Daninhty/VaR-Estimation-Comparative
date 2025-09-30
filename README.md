# Comparison of Value at Risk Methods using Generalized Pareto Distribution and Generalized Extreme Value Approaches in Evaluating Risk of the S&P500 Stock Index

## 📌 Overview
This project evaluates the **Value at Risk (VaR)** of the S&P500 stock index using **Extreme Value Theory (EVT)**.  
Two approaches are compared:
- **Block Maxima (BM)** method with the **Generalized Extreme Value (GEV)** distribution.  
- **Peaks Over Threshold (POT)** method with the **Generalized Pareto Distribution (GPD)**.  

The goal is to identify which method provides a more reliable measure of financial risk under extreme events.

---

## 📂 Project Structure
The project includes the following main components:

1. **Data Collection & Preprocessing**
   - Retrieves historical closing prices of the S&P500 index (2018–2024) from Yahoo Finance.  
   - Computes log returns for risk analysis.  

2. **Descriptive Statistics**
   - Calculates mean, variance, skewness, and kurtosis of returns.  
   - Explores heavy-tail behavior and non-normality of the data.  

3. **Extreme Value Theory Application**
   - **GEV (Block Maxima)**: Divides return data into blocks (monthly/quarterly/semester), extracts block maxima, and fits the GEV distribution.  
   - **GPD (Peaks Over Threshold)**: Selects a threshold (90th percentile) and fits the GPD distribution to excesses.  

4. **Value at Risk (VaR) Estimation**
   - Computes VaR at 95% confidence level using GEV and GPD parameter estimates.  
   - Compares results to assess which EVT method captures tail risk more effectively.  

5. **Reporting & Visualization**
   - Summarizes statistical results in tables.  
   - Provides QQ-plots, histogram, and mean excess plots for diagnostic checks.  
   - Compares VaR estimates across GEV and GPD methods.  

---

## 🚀 Technologies & Frameworks
- **R Programming**
  - `quantmod` (data collection from Yahoo Finance)  
  - `moments` (skewness & kurtosis)  
  - `evd`, `extRemes` (GEV & GPD estimation)  
  - `ggplot2` (visualization)  
  - `dplyr` (data manipulation)  

---

## 📊 Expected Outcomes
- Statistical confirmation that S&P500 returns are non-normal and heavy-tailed.  
- Estimated parameters of GEV and GPD distributions.  
- Comparative Value at Risk (VaR) results:
  - GEV-based VaR (Block Maxima).  
  - GPD-based VaR (Peaks Over Threshold).  
- Insight into which method provides a more conservative and realistic estimate of financial risk.  
