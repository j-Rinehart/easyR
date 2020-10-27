#' Uses the `sql_insert` function from `mmkit`, but cuts up inserting into batch sizes
#' when table is too large for efficient insert.
#'
#' @param df_name name of data frame to insert
#' @param table_name Redshift table name (with schema if required)
#' @param batch_size Batch size for inserts (size of subset chunks)
#' @return Results of query
#' @export
######################################################################################

sql_insert_big <- function(df_name, table_name, batch_size){
  num_iter = ceiling(nrow(df_name)/batch_size)
  message(sprintf("Data has %s rows.  Will be split into %s chunks and uploaded", nrow(df_name), num_iter))
  for(i in 1:num_iter) {
    if (i == 1){
      cut1 = i
      cut2 = batch_size
      df<- df_name[cut1:cut2,]
      message(sprintf("@@@@@---Splitting data and uploading chunk #%s", i))
      sql_insert(data=df, table_name=table_name,
                 conn = rs,
                 redefine = FALSE,
                 blanks_as_null = TRUE,
                 perms='',
                 bucket = "clc-s3a")
    }else if (i != 1 & i != num_iter){
        cut1 = ((i-1)*batch_size)+1
        cut2 = (i*batch_size)
        df<- df_name[cut1:cut2,]
        message(sprintf("@@@@@---Splitting data and uploading chunk #%s", i))
        sql_insert(data=df, table_name=table_name,
                   conn = rs,
                   redefine = FALSE,
                   blanks_as_null = TRUE,
                   perms='',
                   bucket = "clc-s3a")
      }else if (i== num_iter){
        cut1 = ((i-1)*batch_size)+1
        cut2 = nrow(df_name)
        df<- df_name[cut1:cut2,]
        message(sprintf("@@@@@---Splitting data and uploading chunk #%s", i))
        sql_insert(data=df, table_name=table_name,
                   conn = rs,
                   redefine = FALSE,
                   blanks_as_null = TRUE,
                   perms='',
                   bucket = "clc-s3a")
      }
    }
  }






