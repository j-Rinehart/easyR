#' Creates counts by a grouping variable from a Redshift Table
#'
#' @param group_var What you want to group by
#' @param table_name Redshift table name (with schema if required)
#' @return Results of query
#' @export

sql_group_count <- function(group_var, table_name){

  query <- paste0("SELECT ",
                  group_var,
                  ", COUNT(*) FROM ",
                  table_name,
                  " GROUP BY ",
                  group_var)

  rs = mmkit::db_conn('redshift')

  rs$query(query) %>%
    dplyr::arrange(insert_date)
}
