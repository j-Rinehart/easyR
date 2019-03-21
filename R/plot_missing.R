#' Plot percent missing for all variables in DF
#'
#' This function will plot the percentage of missing observations for
#' every variable in a data frame.
#'
#' @param df Data frame to be used
#' @return Primary: A plot of missing percentage for every variable in DF
#' @return Secondary: You can extract the missing % data by assigning function
#' to an object and pulling out the data (e.g. the_object$data)
#' @export

plot_missing <- function(df){
missing_percent <- df %>%
    dplyr::summarise_all(funs(sum(is.na(.))/n())) %>%
    gather(key="feature", value="missing_pct") %>%
    filter(missing_pct>0)

missing_percent %>%
    ggplot2::ggplot(aes(x=reorder(feature,-missing_pct),y=missing_pct)) +
    geom_bar(stat="identity",fill="steelblue")+
    coord_flip() +
    labs(title="Percent of Observations That Are Missing",
         y="% Missing",
         x='') +
    theme(axis.title = element_text(face="bold"),
          title = element_text(face="bold"),
          panel.border = element_blank(),
          panel.background = element_blank(),
          panel.grid.minor = element_blank(),
          axis.ticks  = element_line(colour="grey80"),
          axis.line   = element_line(colour="grey80"),
          axis.line.x = element_line(colour="grey80")) +
    geom_hline(yintercept=seq(0.25, 0.75, 0.25), col="white", lwd=0.5)+
    scale_y_continuous(labels = scales::percent)
}
