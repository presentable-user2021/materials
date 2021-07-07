# Materials for Professional, Polished, Presentable

## A tutorial at [useR!2021](https://user2021.r-project.org/) by [Garrick Aden-Buie](https://garrickadenbuie.com) and [Silvia Canelón](https://silvia.rbind.io)

&#x1F3E0; <https://presentable-user2021.netlify.app>

&#x1F9D1;&#x200D;&#x1F4BB; Are you joining the tutorial?
Follow the [tutorial Prework](https://presentable-user2021.netlify.app/materials/prework) to get ready!

## How to get the workshop materials

### Make this repo your own

You can click the green [Use This Template](https://github.com/presentable-user2021/materials/generate) button above to create a repo in your own GitHub account generated from these materials. 

If you choose this route, you can open this project in RStudio by clicking on **New Project** > **Version Control** > **Git** and then paste the URL of the new repo in the dialogue box.

You could skip the dialog boxes and open the project directly with the [usethis] package:

```r
usethis::create_from_github(
  "<your_github_acct>/materials",
  destdir = "~/Desktop/presentable-user2021"
)
```

_Hint: replace `<your_github_acct>` with your GitHub user name and pick a comfortable `destdir`._

### Just download the materials right now

If you'd rather just get the materials without using GitHub or Git in any way, you can also use the [usethis] package:

```r
usethis::use_course("presentable-user2021/materials")
```

usethis will work with you to put the files somewhere reasonable, but you can also be explicit:

```r
usethis::use_course(
  "presentable-user2021/materials",
  destdir = "~/Desktop/presentable-user2021"
)
```

[usethis]: https://usethis.r-lib.org


## Duke Lemur Center Data

In this course, we occasionally use data provided by the [Duke Lemur Center](https://lemur.duke.edu/). For more information, you may find the source data on the [DLC](https://lemur.duke.edu) webpage or in the following citation.

> Zehr, SM, Roach RG, Haring D, Taylor J, Cameron FH, Yoder AD. Life history
> profiles for 27 strepsirrhine primate taxa generated using captive data from
> the Duke Lemur Center. Sci. Data 1:140019 doi: 10.1038/sdata.2014.19 (2014).

The data files we used were prepared by [Jesse Mostipak](https://www.kaggle.com/jessemostipak) and shared on Kaggle at <https://www.kaggle.com/jessemostipak/duke-lemur-center-data>. The scripts used to simplify the dataset for this workshop is available in [this Kaggle R notebook](https://www.kaggle.com/grrrck/lemurs-simplified).

## Lemur illustrations

All lemur illustrations featured on the [tutorial website](https://presentable-user2021.netlify.app/materials/) and in the materials included within this repository were created by [Rachel Hudson](https://lemur.duke.edu/100-lemurs/).
