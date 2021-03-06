% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sql_group_count.R
\name{sql_group_count}
\alias{sql_group_count}
\title{Creates counts by a grouping variable from a Redshift Table}
\usage{
sql_group_count(group_var, table_name)
}
\arguments{
\item{group_var}{What you want to group by}

\item{table_name}{Redshift table name (with schema if required)}
}
\value{
Results of query
}
\description{
Creates counts by a grouping variable from a Redshift Table
}
