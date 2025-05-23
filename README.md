# Empirical Study on Contagion Risk Measure Under Extreme Risk
A thesis submitted to School of Mathematics & Physics of Xi’an Jiaotong-Liverpool University for the degree BSc Actuarial Science

# Goal
The aim of this research is to provide an overview of a contagion risk measure known as the
Contagion Risk under Value-at-Risk based allocation (CRVaR) and its relevant concepts including
Extreme Value Theory and tail dependency. We will then use these concepts to empirically
detect contagion risk between components within a global financial system by regarding each
country’s stock market as an individual component of the entire market. By definition, CRVaR
allows us to indicate extreme risk exposures for a single entity of interest conditional on the
state of another institution. Consequently, it is also of interest to understand the effect of tail
heaviness and dependency between countries on contagion risk level.

# Overview
Contagion risk has been widely identified as a critical factor in the recent 2008 financial crisis.
Systemic instability due to propagation of negative shocks under extreme events highlights the
importance of identifying and quantifying contagion risk in the financial field. With the help of
Extreme Value Theory (EVT), this report aims to identify contagion risk in historical financial
events and explore its relationship with tail heaviness, measured by the shape parameter α, and
tail dependence, measured by the tail order κ. Using major stock indices data from the US
(S&P 500), UK (FTSE 100), and Japan (NIKKEI 225), empirical findings confirm the inverse
relationship between contagion risk and the combined effect of α and κ represented by the index
(κ - 1 - 1/α). Additionally, pairs with stronger dependence tend to have an overall stronger
contagion risk. These results provide empirical evidence of the presence of contagion risk in
extreme systemic crises and justify the importance of its management under modern financial
regulatory framework.

# Content
* '1927459_Adlensius Fransiskus Djunaedi_2023.pdf' is the full report
* The main data are CLEANED 'S&P500 vs FTSE100.xlsx' and 'CLEANED S&P500 vs NI225.xlsx' which are stock indices data which have been gathered fromm Yahoo Finance and cleaned with the code in 'clean_data.m'.
The raw data is not provided within this repository
* 'heatmap.m' consist of the code to generate the heatmap of empirical estimation of historical contagion risk measure which employ the 'crvar2.m' function
* 'unit_frechet.m' is the code for unit frechet transformation which has been exported to 'frechet sp500 ftse100.xlsx' and 'frechet sp500 ni225.xlsx'
* 'summary_statistics.R' consists of codes to calculate summary statistics of the stock indices
* 'analysis1.R' consists of the code for estimating the shape parameter α and the tail order κ

# Important Note
All file paths used within the code will need to be rewritten accordingly depending on where you store the downloaded file in your system.

# Author
All codes and thesis are authored by Adlensius Fransiskus Djunaedi

Supervised by Dr. Jiajun Liu
