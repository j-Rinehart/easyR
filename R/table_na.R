#' Simple function to shorten table(is.na(df$var))
#'
#' @param df_var What you want to know the # of NA & non-NA for: df$var
#' @return Results of query
#' @export

table_na <- function(df_var){
  table(is.na(df_var))
}
