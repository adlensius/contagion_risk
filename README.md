# Empirical Study on Contagion Risk Measure Under Extreme Risk
a thesis submitted to School of Mathematics & Physics of Xi’an Jiaotong-Liverpool University for the degree BSc Actuarial Science

# Goal
this thesis aims to identify contagion risk in historical financial
events and explore its relationship with tail heaviness, measured by the shape parameter α, and
tail dependence, measured by the tail order κ.


# Overview
Contagion risk has been widely identified as a critical factor in the recent 2008 financial crisis.
Systemic instability due to propagation of negative shocks under extreme events highlights the
importance of identifying and quantifying contagion risk in the financial field. With the help of
Extreme Value Theory (EVT), this report aims to identify contagion risk in historical financial
events and explore its relationship with tail heaviness, measured by the shape parameter α, and
tail dependence, measured by the tail order κ. Using major stock indices data from the US
(S&P 500), UK (FTSE 100), and Japan (NIKKEI 225), empirical findings confirm the inverse
relationship between contagion risk and the combined effect of α and κ represented by the index
(κ 􀀀 1 􀀀 1/α). Additionally, pairs with stronger dependence tend to have an overall stronger
contagion risk. These results provide empirical evidence of the presence of contagion risk in
extreme systemic crises and justify the importance of its management under modern financial
regulatory framework.

# Content
'1927459_Adlensius Fransiskus Djunaedi_2023.pdf' is the full report

The main data are CLEANED 'S&P500 vs FTSE100.xlsx' and 'CLEANED S&P500 vs NI225.xlsx'

'heatmap.m' consist of the code to generate the heatmap of empirical estimation of historical contagion risk measure which employ the 'crvar2.m' function

unit_frechet.m is the code for unit frechet transformation which has been exported to 'frechet sp500 ftse100.xlsx' and 'frechet sp500 ni225.xlsx'

'summary_statistics.R' consists of codes to calculate summary statistics of the stock indices

'analysis1.R' consists of the code for estimating the shape parameter α and the tail order κ

# Author
Thesis is authored by Adlensius Fransiskus Djunaedi

Supervised by Dr. Jiajun Liu
