# koboloadeR: Survey Data Crunching <img src="man/figures/koboloadeR.png" width="200" align="right" /> 

<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

[![packageversion](https://img.shields.io/badge/package%20version-0.0.1-orange.svg)](https://github.com/unhcr/koboloadeR/blob/master/DESCRIPTION)

[![CRAN status](https://www.r-pkg.org/badges/version/koboloadeR)](https://cran.r-project.org/package=koboloadeR)
[![CRAN](https://img.shields.io/cran/v/koboloadeR.svg)](https://cran.r-project.org/package=koboloadeR)
[![CRAN](https://img.shields.io/cran/l/koboloadeR.svg)](https://CRAN.R-project.org/package=koboloadeR)

[![CRAN](http://cranlogs.r-pkg.org/badges/koboloadeR)](https://CRAN.R-project.org/package=koboloadeR)
[![CRAN](http://cranlogs.r-pkg.org/badges/grand-total/koboloadeR)](https://CRAN.R-project.org/package=koboloadeR)

[![Travis build status](https://travis-ci.org/unhcr/koboloadeR.svg?branch=gh-pages)](https://travis-ci.org/unhcr/koboloadeR)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/unhcr/koboloadeR?branch=gh-pages&svg=true)](https://ci.appveyor.com/project/unhcr/koboloadeR)
[![codecov](https://codecov.io/gh/unhcr/koboloadeR/branch/gh-pages/graph/badge.svg)](https://codecov.io/gh/unhcr/koboloadeR)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/2adb516e959b4c1599ca4367b8480196)](https://www.codacy.com/app/Edouard-Legoupil/koboloadeR?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=unhcr/koboloadeR&amp;utm_campaign=Badge_Grade)
[![Last-changedate](https://img.shields.io/github/last-commit/unhcr/koboloader.svg)](https://github.com/unhcr/koboloadeR/commits/master)

<!-- badges: end -->

koboloadeR is a metapackage, that brings together a series of specialised packages in an organised data analysis workflow, to conduct data discovery and analysis for data collected through  [KoboToolbox](https://www.kobotoolbox.org/), [ODK](https://opendatakit.org/), [ONA](https://ona.io/home/) or any __[xlsform](http://xlsform.org)__ compliant data collection platform.

This package first builds on the capacity of [UNHCR Kobo server](http://kobo.unhcr.org) but it can also be used from any structured dataset. It comes as a companion tool to the [Integrated Framework for Household Survey](https://unhcr.github.io/Integrated-framework-household-survey).

koboloadeR aims at helping [humanitarian data analysts](https://humanitarian-user-group.github.io/) to focus in data interpretation by saving the time needed to quickly generate the graphs and charts required to discover insights from a dataset. It also ensure analysis __reproducibility__ through a separation of the analysis configuration and the analysis process. The package allows to account for sample weights and hierachical dataset structure (both capacities that are not available through the default [reporting engine](http://support.kobotoolbox.org/articles/2847676-viewing-and-creating-custom-reports) or the [excel-analyzer](http://support.kobotoolbox.org/articles/592387-using-the-excel-analyzer)). 

## Approach
 
The main concept behind the package is to implement a survey data analysis plan and configuration directly within the same [xlsform](http://xlsform.org) excel file that has been used to develop the questionnaire. A few additional column are created in this excel document, the package read those column to generate a series of predefined report.

![alt text](https://raw.githubusercontent.com/unhcr/koboloadeR/gh-pages/inst/script/workflow.png)




The approach offered through the package has the following advantages: 

  *  End users __do not need to code__ in R and to master the language in order to use the package as the configuration is done in excel;  
 
  *  The data __analysis plan__ is de facto fully documented and described;  
 
  *  The resulting data crunching reports are fully __reproducible__;  
 
  *  Analysis __iterations__ are facilitated;
 
  *  Good __practices__ are enforced through the package.

A more detailed introduction to the concepts used in the package is presented in the [Data Crunching article](articles/Crunching.html). 


The data crunching allows to generated quickly initial reports through a series of semi-automated processes: 

1. Have all the configuration used to generate the reports (details of tabulation and crosstabulation plans, weighting approach) documented within the xlsform allow to track easily all changes to the data and to facilitate ( [koboloadeR::kobo_dico]("reference/kobo_dico.html"))

2. Have a clear and consistent folder structure and naming conventions for all the files coming in and out of the crunching workflow ( [koboloadeR::kobo_projectinit]("reference/kobo_projectinit.html"))

3. Ensures that files containing questions and respondents have been all considered: form & data to be checked to each other ( [koboloadeR::kobo_check_analysis_plan]("reference/kobo_analysis_plan.html"))

4. Make question and choices labels readable within charts by adjusting them where needed (for instance question labels to be less than 80 char and choices labels less than 40), resolve typos if any... ( [koboloadeR::kobo_label]("reference/kobo_label.html") and [koboloadeR::kobo_encode]("reference/kobo_encode.html") 

5. Merge household data with individual-level data – when using repeat components. There’s a file of data at the household-level and another file containing data on the individuals that constitute those households. There should be unique identifying codes that match households and individuals ( [koboloadeR::kobo_load_data]("reference/kobo_load_data.html")

6. Review and potentially re-categorize open-ended answers when “or other” option was offered ( [koboloadeR::kobo_clean]("reference/kobo_clean.html") )

7. Measure statistical disclosure risk in order to remove sensitive data and indirect identifiers [koboloadeR::kobo_anonymise]("reference/kobo_anonymise.html") and [koboloadeR::kobo_anonymisation_report]("reference/kobo_anonymisation_report.html") )

8. Create new variables out of existing variables (also called feature engineering). For instance Group distinct answers into categories or ranges, Split up or extract components from an answer, aggregate variable collected at individual level to the household level ( [koboloadeR::kobo_indicator]("reference/kobo_indicator.html") )

9. Generate easy to read visualization  for all tabulations, cross-tabulations and correlation ( [koboloadeR::kobo_cluster_report]("reference/kobo_luster_report.html") ) 

10. Identify population segments, i.e. statistical clusters,  based on similar characteristics ( [koboloadeR::kobo_crunching_report]("reference/kobo_crunching_report.html")) 



You can have a look at [some examples of output reports here](https://github.com/unhcr/koboloadeR/tree/gh-pages/out).

## Environment setup 

### Software installation  

  1. [Install R](https://cran.r-project.org/): follow instruction from the installer.

  2. __Only for windows user__ [Install RTools](https://cran.r-project.org/bin/windows/Rtools): This executable is needed to install the package from github. Follow instruction from the installer.

  3. [Install R Studio](https://www.rstudio.com/products/rstudio/download/#download) : follow instruction from the installer

You can now Launch __R Studio__ . You may check the list of common issues in the [Common Troubleshooting](articles/Troubleshooting.html) article.

## Package installation from Github

Note that the package is still in beta-version. We hope to have soon a release available on CRAN.

  *  Open R studio interface and within the R console, install `devtools` package: 

```{r}
install.packages("remotes")
```

  *  Install koboloadeR: 

```{r}
remotes::install_github("unhcr/koboloadeR", Ncpus=4) 

## Use UNHCR graphical template- https://unhcr-web.github.io/unhcRstyle/docs/
remotes::install_github('unhcr-web/unhcRstyle')
```  

  *  You are all set! You can know use koboloadeR. If you have a problem consult the common troubleshooting part at the end of this page.

### Quick Project Walk Through 

You can consult the vignettes for a detailed guidance

##### Create project

  *  In R Studio, select File, click New project. A box opens
  
  *  Choose New Directory
  
  *  Choose Empty project
  
  *  Type the name of the folder where you want to put your data
  
  *  Select where you want to put this folder
  
  *  Click Create project

Then setup a few things: run those two lines:

```{r}
library (koboloadeR) # This loads koboloadeR package

kobo_projectinit() # Creates folders necessary and transfer files needed
```

It might take a while as a few other packages have to be installed or loaded. Once the see the " >" again at the beginning of the line, you are ready to start


#### Console mode

The __console mode__ is recommended - You can run the file `run-analysis.R` that is automatically copied in the `code` folder after you run the `kobo_projectinit()` function . 

This will be likely the quickest options, once your are used to the package.

Note however that this implies that you configure correctly on your own the full configuration within the xlform file. 

#### NOT MAINTAINED - Support would be wellcome - Graphical user interface (GUI) 

A shinyApp to guide user through all those steps has been prototyped - unfortunately - it's not maintained with the last dev and might be buggy...

All instructions and options for the project configuration and analysis plan settings shall be do-able through a dedicated GUI.
```{r}
kobo_shiny("app_main_koboloadeR.R")
```  

For better performances, select "Open in Browser" on the top of the window.


## Contributing

Contributions to the packages are welcome. Please read first the [contribution guidelines](CONTRIBUTING.html), follow the [code of conduct](CODE_OF_CONDUCT.html) and use the [issue template](ISSUE_TEMPLATE.html).

To go in more details, the suggested work-flow is presented below (note that all of it is not yet fully implemented - see [issue tracking for more details](https://github.com/unhcr/koboloadeR/issues)). You can read the [function documentations](reference/index.html) directly.

![alt text](https://raw.githubusercontent.com/unhcr/koboloadeR/gh-pages/inst/script/workflow2.png)

> This package is part of `unhcrverse`, a set of packages to ease the production of statistical evidence and data stories. You can install them all with the following:

```r
## Use UNHCR Open data  - https://unhcr.github.io/unhcrdatapackage/docs/
remotes::install_github('unhcr/unhcrdatapackage’)

## API to connect to internal data source - https://unhcr-web.github.io/hcrdata/docs/
remotes::install_github('unhcr-web/hcrdata’)

## Perform High Frequency Check https://unhcr.github.io/HighFrequencyChecks/docs/
remotes::install_github('unhcr/HighFrequencyChecks’)

## Process data crunching for survey dataset - https://unhcr.github.io/koboloadeR/docs/
remotes::install_github('unhcr/koboloadeR’)

## Use UNHCR graphical template- https://unhcr-web.github.io/unhcRstyle/docs/
remotes::install_github('unhcr-web/unhcRstyle')
```

#### Building package documentation 

`devtools::document()`

`devtools::check(document = FALSE)`

`pkgdown::build_site()`

------------
