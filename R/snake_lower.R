#' Renames variables using snake(_) and lower syntax
#'
#' @param data Data frame to be renamed
#' @return Date frame returned with renamed variables
#' @export

snake_lower <- function(df){
  names(df) <- tolower(gsub("\\.", "_", names(df)))
  names(df) <- tolower(gsub(" ", "_", names(df)))
  names(df) <- tolower(gsub("_-_", "_", names(df)))
  names(df) <- tolower(gsub("\\(", "", names(df)))
  names(df) <- tolower(gsub(")", "", names(df)))
  names(df) <- tolower(gsub("\"", "", names(df)))
  return(df)
}


