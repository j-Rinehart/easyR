#' Simple function to shorten length(unique(df$var))
#'
#' @param df_var What you want to know the length of unique values for: df$var
#' @return Results of query
#' @export

length_unique <- function(df_var){
  length(unique(df_var))
}
