#' Variation of the distinct() function to enumerate vars to exclude
#'
#' @param data Data frame to be used (can be piped)
#' @param excl_list character vector of names to be excluded from distinct calcs
#' @return Date frame returned with only distinct rows
#' (not counting vars that were excluded)
#' @export

distinct_excl <- function(.data, excl_list, ...){
  df_name <- names(.data)
  sel <- rlang::syms(setdiff(df_name, excl_list))
  dplyr::distinct(.data, !!!sel, .keep_all = T)
}
