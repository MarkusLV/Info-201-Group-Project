library(plotly)
library(ggplot2)
library("jpeg")

mh_sm_df <- read.csv("C:/Users/jmsoc/OneDrive/UW Sophmore/Winter Semester/INFO 201/Final Project/M work/Cleaned CSV Dataset")
## OVERVIEW TAB INFO

overview_tab <- tabPanel("Overview",
                         
                         h1("Correlation between screen time and mental health"),
                         h6("By: Jacob Martin, Markus Kalsons, and Hannah Merrit"),
                         h6("Published March 4th, 2024"),
                         h6("."),
                         h4("The question that team BH-4 has been sent out to find:
                         Is there a correlation between screen time usage and mental health?"),
                         p("
By determining whether or not there is a correlation between screen time usage and mental health, we hope to clear up any stigma and determine once and for all if screen time can damage your mental health. On top of this we strive to inform and advise others of extraneous information provided by our website.
"),
p("The first data set we are using records the average amount of citizens per country that suffer from each type of mental illness. The second data set we are using records the average amount of screen time for a person in each country. Both data sets were retrieved on Kaggle and have been linked below.") ,
p("A few possible limitation to be considered in the data set are people lying about not having a mental disability because they are ashamed of it. Another possible limitation to consider is the purpose of the screen time for example work, games, social media, etc. Lastly the final limitation to be considered in our data collection would be the obscurity of mental health as there are varying types of mental disorders. For the purposes of this research, the mental illnesses we have recorded are schizophrenia, bipolar disorder, eating disorder, anxiety disorder, drug addiction disorder, alcohol addiction disorder, and depression.
"),
                         
                         
h1(
tags$img(src = 'x.png', height = 350, width = 450),tags$img(src = 'z.png', height = 350, width = 550)
  ),

h6("."),

p("Dataset 1: https://www.kaggle.com/datasets/thedevastator/uncover-global-trends-in-mental-health-disorder"),
p("Dataset 2: https://www.kaggle.com/datasets/prasertk/average-screen-time-and-usage-by-country
")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h3("What percentage of each country's population is effected by mental illness?"),
  h4("Select a Country:"),
  selectInput(
    inputId = "user_choice",
    label = "Countries",
    choices = mh_sm_df$Entity,
    selected = NULL,
    multiple = TRUE
  ),
  checkboxInput(
    inputId = "color_country_mh",
    label = "Would you like color?"
  )
)

viz_1_main_panel <- mainPanel(
  h2("Global Mental Health Percentages"),
  plotlyOutput(outputId = "mental_health_plot"),
)

viz_1_tab <- tabPanel("Mental Health Graph",
                      sidebarLayout(
                        viz_1_sidebar,
                        viz_1_main_panel
                      )
)

## VIZ 2 TAB INFO

viz_2_sidebar <- sidebarPanel(
  h3("What is the average screen time usage per country?"),
  h4("Select a country:"),
  selectInput(
    inputId = "user_selection",
    label = "Countries",
    choices = mh_sm_df$Entity,
    selected = NULL,
    multiple = TRUE
  ),
  checkboxInput(
    inputId = "color_country_sm",
    label = "Would you like color?"
  )
)

viz_2_main_panel <- mainPanel(
  h2("Global Average Screen Time Usage"),
  plotlyOutput(outputId = "social_media_plot")
)

viz_2_tab <- tabPanel("Screen Time Graph",
                      sidebarLayout(
                        viz_2_sidebar,
                        viz_2_main_panel
                      )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h3("Does screen time have an effect on mental illness?"),
  h4("Select a country:"),
  selectInput(
    inputId = "user_pick",
    label = "Countries",
    choices = mh_sm_df$Entity,
    selected = NULL,
    multiple = TRUE
  )
)

viz_3_main_panel <- mainPanel(
  h2("Screen Time Usage and Mental Health  Statistics"),
  plotlyOutput(outputId = "combined_plot")
)

viz_3_tab <- tabPanel("Screen Time and Mental Health Graph",
                      sidebarLayout(
                        viz_3_sidebar,
                        viz_3_main_panel
                      )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion",
                           h1("Key Takeaways"),
                           h3("Insights from analysis"),
                           h5("The largest key takeaway from this analysis is that it appears to be no correlation between the amount of screen time usage to the percent of people that suffer from some type of mental illness. If you look at the graph it becomes clearer with the more countries added, the less correlated the entries are. When following the mean line of screen time to mental illnesses there is no similarities shown of following the mean line. With these observations a conclusion can be made that when analyzing the screen time and mental illness graph that the data does not follow any trend. "),
                           h3("Consideration of multifaceted influences"),
                           h5("Secondly, based on the previous takeaway we can assume that there are too many outside factors to determine mental illness such as income, location, family history, etc. With the multitude of factors that assist in determining mental health, it is not possible to find a direct correlation of a specific factor such as screen time. Based on the varying data from the screen time and mental health graph, screen time cannot be determined as a sole factor to  demonstrate any type of correlation between screen time usage and mental illnesses."),
                           h3("Regional disaprities in data"),
                           h5("Lastly, another takeaway to be made is regarding the unpredictability of screen time and mental illness for each country. Looking at the mental health graph and screen time graph, it displays heavily varied information depending on each country. No two countries have similar information, and this can tell us how different each country is regarding screen time usage and mental illnesses. "),
                           h1(
                             tags$img(src = 'a.png', height = 350, width = 550),
                             h4("Description:"),
                             h5("The graph above demonstrates the mean line of total time spent on devices"),
                             h5("and mental health percentages that would demonstrate correlation. As you can"),
                             h5("see based on the graph there is no trend that the points follow.")
                           )                    
                           )



ui <- navbarPage("Screen Time and Mental Health",
                 overview_tab,
                 viz_1_tab,
                 viz_2_tab,
                 viz_3_tab,
                 conclusion_tab
)