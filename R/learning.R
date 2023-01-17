# Here an example of a conflict
10

# R basics ----------------------------------------------------------------


weight_kilos <- 10

colnames(airquality)
str(airquality)
summary(airquality)



2 + 2

# Packages ----------------------------------------------------------------

library(tidyverse)
library(NHANES)


r3::check_git_config()


# This will be used for testing out Git

# Connecting to github

usethis::create_github_token()


gitcreds::gitcreds_set()

usethis::use_github()

# usethis::git_sitrep()



# Looking at data ---------------------------------------------------------

glimpse(NHANES)


select(NHANES, Age, Weight, BMI)

select(NHANES, -HeadCirc)
colnames(NHANES)

select(NHANES, starts_with("BP"))
select(NHANES, starts_with("Day"))
select(NHANES, contains("Age"))


nhanes_small <- select(
  NHANES,
  Age,
  Gender,
  BMI,
  Diabetes,
  PhysActive,
  BPSysAve,
  BPDiaAve,
  Education
)
nhanes_small
