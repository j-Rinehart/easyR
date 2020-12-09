#' Re-establishes the lengths of variables in a sample data frame to be the max(length) of
#' the full data frame
#' NOTE: Currently only sets sizes for character variables
#'
#' @param samp_df name of data frame to change lengths
#' @param full_df the original, non-sampled, data frame
#' @return samp_df with changed lengths
#' @export
######################################################################################
set_max_col <- function(full_df, samp_df){
  char_df<-full_df %>% select(where(is.character))
  colnames <- names(char_df)
  len<-as.data.frame(lapply(char_df, function(x) max(nchar(x), na.rm=T)))
  message("Max lengths of all character columns in the full dataframe have been calculated.")

  for(i in 1:length(colnames)){
    cname <- colnames[i]
    lngth <- len[,i]

    cval <- stri_pad_right(" ", lngth, " ")

    if(i==1){
      df.1 <- tibble(!!cname:=cval)
    }else{
      df.2 <- tibble(!!cname:=cval)
      df.1 <- bind_cols(df.1, df.2)
    }
  }
  samp_df <- bind_rows(samp_df, df.1)
  return(samp_df)
}
