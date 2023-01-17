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



# Fixing variable names ---------------------------------------------------

nhanes_small <- rename_with(
  nhanes_small, snakecase::to_snake_case
)

nhanes_small <- rename(
  nhanes_small,
  sex = gender
)


# Piping ------------------------------------------------------------------

colnames(nhanes_small)

nhanes_small %>%
  colnames()
nhanes_small %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)


# exercise 7.8 ------------------------------------------------------------

nhanes_small %>%
  select(bp_sys_ave, education)

nhanes_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )

# Re-write this piece of code using the “pipe” operator:
# select(nhanes_small, bmi, contains("age"))

nhanes_small %>%
  select(bmi, contains("age"))

# blood_pressure <- select(nhanes_small, starts_with("bp_"))
# rename(blood_pressure, bp_systolic = bp_sys_ave)

nhanes_small %>%
  select(starts_with("bp")) %>%
  rename(bp_systolic = bp_sys_ave)

# Filtering rows ----------------------------------------------------------

nhanes_small %>%
  filter(phys_active != "No")
nhanes_small %>%
  filter(bmi >= 25 & phys_active == "No")
nhanes_small %>%
  filter(bmi == 25 | phys_active == "No")


# Arranging rows ----------------------------------------------------------

nhanes_small %>%
  arrange(desc(age), bmi, education)


# Mutating columns --------------------------------------------------------



nhanes_update <- nhanes_small %>%
  mutate(
    age_month = age * 12,
    logged_bmi = log(bmi),
    age_weeks = age_month * 4,
    old = if_else(age >= 30, "old", "young")
  )

