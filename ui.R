library(plotly)
library(ggplot2)

mh_sm_df <- read.csv("C:/Users/14258/OneDrive - UW/Info 201/Cleaned CSV Dataset")
## OVERVIEW TAB INFO

overview_tab <- tabPanel("Overview Tab Title",
   h1("Some title"),
   p("some explanation")
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Select a Country:"),
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
  h2("Global Mental Health Disorder Percentages"),
  plotlyOutput(outputId = "mental_health_plot"),
)

viz_1_tab <- tabPanel("Mental Health",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO

viz_2_sidebar <- sidebarPanel(
  h2("Select a country:"),
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
  h2("Global Average Social Media Time"),
  plotlyOutput(outputId = "social_media_plot")
)

viz_2_tab <- tabPanel("Social Media",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Select a country:"),
  selectInput(
    inputId = "user_pick",
    label = "Countries",
    choices = mh_sm_df$Entity,
    selected = NULL,
    multiple = TRUE
  )
)

viz_3_main_panel <- mainPanel(
  h2("Social Media and Mental Health  Statistics"),
  plotlyOutput(outputId = "combined_plot")
)

viz_3_tab <- tabPanel("Social and Mental",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion Tab Title",
 h1("Some title"),
 p("some conclusions")
)



ui <- navbarPage("Example Project Title",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)