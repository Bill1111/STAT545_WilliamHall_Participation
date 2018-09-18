---
title: "STAT545_hw01_gapminder.Rmd"
author: "William Hall"
date: '2018-09-14'
output: 
  html_document:
        theme: yeti
        toc: false
        keep_md: true
---

## Overview

`Dataset Description`: The R Gapminder Dataset is an excerpt of the data available at https://www.gapminder.org/. For each of 142 countries, the package provides values for life expectancy, GDP per capita, and population, every five years, from 1952 to 2007.

This analysis will include the following:

  1. An explation of the data structure
  2. Visualization of variables of interest

*Note - you must have the following packages installed in order to run the following code:
  
  - devtools
  - ggplot2
  - plyr
  - rstudio/DT

---------------------------------------

## Exploration

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(plyr)
library(ggplot2)
#Note that in order to run this code you must have the following packages and libraries installed:
#install.packages('devtools')
#install.packages("ggplot2")
#install.packages('plyr')
#devtools::install_github('rstudio/DT')
```

The first step is to load the gapminder library using the following R code.

```{r}
library(gapminder)
```

Once we have the Gapminder Dataset loaded, we can begin our exploration by using the following functions:

1. ncol()    - returns the number of columns
2. nrow()    - returns the number of rows

```{r}
nrow(gapminder)
ncol(gapminder) 
```

With the above code we can see that the Gapminder dataset has `r nrow(gapminder)` rows, and `r ncol(gapminder)` columns. But what are the column/variable names? How could we visualize this better, and allow someone who is looking at the html output to play around with the dataset a little bit more? The [DT](https://rstudio.github.io/DT/) library gives us a nice little interactive way of doing that. Check it out below.

```{r echo=FALSE}
library(DT)
datatable(gapminder, options = list(
  searching = FALSE,
  pageLength = 5,
  lengthMenu = c(10, 50, 100)
))
```


With the summary() function we can get a great summary of the dataset. The output of this function gives us information like the frequency of nominal variables, the mean of continuous variables, and counts for dichotomous variables. To learn more about the summary() function, visit this website - https://www.rdocumentation.org/packages/base/versions/3.5.1/topics/summary.

```{r }
summary(gapminder)
```


---------------------------------------

## Visualization

In order to visualize, some of the relationships between variables we can use various plots. For example, 

  >What is the Life Expectancy in different countries?

```{r }

ggplot(gapminder, aes(gapminder$continent)) +
  stat_summary(aes(y = gapminder$lifeExp), fun.y = "mean", geom = "bar") +
  scale_x_discrete("Continent") +
  scale_y_continuous("Life Expectancy", limits = c(0,80), breaks = seq(0,100, by = 5)) +
  labs(title = "Average Life Expectancy of each Continent")

```


This concludes my preliminary analysis of the gapminder dataset


---------------------------------------
