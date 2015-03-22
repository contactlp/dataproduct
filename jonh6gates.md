Data Product Presentation
========================================================
author: John 6 Gates
date: 20nd March, 2015

Introduction
========================================================

- The shiny app for this project to find MPG for selected parameters
- It also suggest car according to predictd MPG 
- data is collected from following websites
- https://archive.ics.uci.edu/ml/datasets/Auto+MPG
- use caret package.

Loading and cleaning data
========================================================


```r
str(data)
```

```
'data.frame':	6 obs. of  6 variables:
 $ mpg       : num  25 21 40.9 23.6 34.5 23
 $ cylinder  : int  4 6 4 4 4 4
 $ horsepower: int  NA NA NA NA NA NA
 $ weight    : int  2046 2875 1835 2905 2320 3035
 $ year      : int  71 74 80 80 81 82
 $ name      : Factor w/ 305 levels "amc,ambassador,brougham",..: 157 151 258 153 256 6
```

















```
Error in train.formula(mpg ~ horsepower + cylinder + weight + year, method = "glm",  : 
  Every row has at least one missing value were found
```
