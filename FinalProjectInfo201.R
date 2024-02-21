# Group Members:
# Markus Kalsons, Jacob Martin, Hannah Merritt  

library("dplyr")
library("stringr")
mental_health_df <- read.csv("Mental Health Depression Disorder Data.csv")
avg_screentime_df <- read.csv("Average Sceen Time By Country .csv")

mental_health_df <- mental_health_df %>%
  filter(Year > 1999)

mental_health_and_screentime_df <- left_join(
  mental_health_df, avg_screentime_df, by = c("Entity" = "Country")
)

mental_health_and_screentime_df <- mental_health_and_screentime_df %>%
  filter(!is.na(Flag))

mental_health_and_screentime_df <- mental_health_and_screentime_df %>%
  filter(!is.na(Depression....))

# Removing useless columns
mental_health_and_screentime_df <- mental_health_and_screentime_df[-12]

mental_health_and_screentime_df <- mental_health_and_screentime_df[-15]
mental_health_and_screentime_df <- mental_health_and_screentime_df[-15]

# Changing the given columns in data set from characters to numerical values
mental_health_and_screentime_df$Schizophrenia.... <- 
  as.numeric(mental_health_and_screentime_df$Schizophrenia....)

mental_health_and_screentime_df$Bipolar.disorder.... <- 
  as.numeric(mental_health_and_screentime_df$Bipolar.disorder....)

mental_health_and_screentime_df$Eating.disorders.... <- 
  as.numeric(mental_health_and_screentime_df$Eating.disorders....)


# Adding a mean column for every mental health disorder for every year and country

mental_health_and_screentime_df$Total.Time.Spent.on.Devices <- 
  str_replace(mental_health_and_screentime_df$Total.Time.Spent.on.Devices, ":", ".")


mental_health_and_screentime_df$Total.Time.Spent.on.Devices <-
  as.numeric(mental_health_and_screentime_df$Total.Time.Spent.on.Devices)
  
summary_table_df <- mental_health_and_screentime_df %>%
  group_by(Entity) %>%
  summarise(
    mean_screen_time = mean(Total.Time.Spent.on.Devices),
    mean_schizophrenia = mean(Schizophrenia....),
    mean_bipolar = mean(Bipolar.disorder....),
    mean_eating = mean(Eating.disorders....),
    mean_anxiety = mean(Anxiety.disorders....),
    mean_drug_use = mean(Drug.use.disorders....),
    mean_depression = mean(Depression....),
    mean_alcohol_use = mean(Alcohol.use.disorders....),
    
  )

# Adding all the Averages
mental_health_and_screentime_df <- mental_health_and_screentime_df %>%
  group_by(Entity) %>%
  filter(Year == 2017) %>%
  mutate(all_mental_health_total = sum(Alcohol.use.disorders.... +
                                         Depression.... +
                                         Drug.use.disorders.... +
                                         Anxiety.disorders.... + 
                                         Bipolar.disorder.... + 
                                         Schizophrenia.... +
                                         Eating.disorders....))


# Categorical value thing
mental_health_and_screentime_df$More_or_less_than_avg <- ifelse(mental_health_and_screentime_df$Total.Time.Spent.on.Devices < 6.748529, "Less", "More")


# Removing unused columns
mental_health_and_screentime_df <- mental_health_and_screentime_df %>%
  select(-index,
         -Year,
         -Code,
         )
  



