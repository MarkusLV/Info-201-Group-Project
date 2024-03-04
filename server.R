library(ggplot2)
library(plotly)
library(dplyr)

mh_sm_df <- read.csv("C:/Users/14258/OneDrive - UW/Info 201/Cleaned CSV Dataset")

server <- function(input, output){
  
  
  output$mental_health_plot <- renderPlotly({

    selected_countries_df <- mh_sm_df %>% 
      group_by(Entity) %>%
      summarize(mental_health_perc = all_mental_health_total) %>%
      filter(Entity %in% input$user_choice)
    
    if(input$color_country_mh) {
      mental_health_plot <- ggplot(selected_countries_df) +
        geom_col(aes(x = Entity,
                     y = mental_health_perc,
                     fill = Entity)) +
        labs(x = "Countries", y = "Average Mental Health Percentile")
    } else {
    mental_health_plot <- ggplot(selected_countries_df) +
      geom_col(aes(x = Entity,
                   y = mental_health_perc
      )) +
      labs(x = "Countries", y = "Average Mental Health Percentile")
    }
    return(ggplotly(mental_health_plot))
  })
  
  output$social_media_plot <- renderPlotly({
    
    selected_countries_df <- mh_sm_df %>% 
      group_by(Entity) %>%
      summarize(screen_time_avg = Time.Spent.using.Social.Media) %>%
      filter(Entity %in% input$user_selection)
    
    if(input$color_country_sm) {
      social_media_plot <- ggplot(selected_countries_df) +
        geom_col(aes(x = Entity,
                     y = screen_time_avg,
                     fill = Entity)) +
        labs(x = "Countries", y = "Average Social Media Usage")
    } else {
      social_media_plot <- ggplot(selected_countries_df) +
        geom_col(aes(x = Entity,
                     y = screen_time_avg
        )) +
        labs(x = "Countries", y = "Average Social Media Usage")
    }
    return(ggplotly(social_media_plot))
  })
  
  output$combined_plot <- renderPlotly({
    
    selected_countries_df <- mh_sm_df %>% 
      filter(Entity %in% input$user_pick)
    
    combined_plot <- ggplot(selected_countries_df) +
        geom_point(aes(x = all_mental_health_total,
                     y = Time.Spent.using.Social.Media,
                     color = Entity)) +
        labs(x = "Percentage of people with Mental Disorders", y = "Average Social Media Usage")
    return(ggplotly(combined_plot))
  })
}
