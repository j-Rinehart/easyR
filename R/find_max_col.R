#' Takes a data frame and returns a DF with the same columns but with the max(length)
#' of each column as the only observation
#'
#' @param full_df name of data frame to assess
#' @return Data frame described above
#' @export
######################################################################################
find_max_col <- function(full_df){
  colnames <- names(full_df)

  for(i in 1:length(colnames)){
    cname <- colnames[i]

    len<-as.data.frame(lapply(full_df, function(x) max(nchar(x), na.rm=T)))
  }
  return(len)
}
