#' Renames variables using snake(_) and lower syntax
#'
#' @param data Data frame to be renamed
#' @return Date frame returned with renamed variables
#' @export

snake_lower <- function(df){
  names(df) <- tolower(gsub("\\.", "_", names(df)))
  names(df) <- tolower(gsub(" ", "_", names(df)))
  return(df)
}


