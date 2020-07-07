connection: "red_flight"

# include all the views
include: "/**/*.view"

datagroup: e_flights_default_datagroup {
  #label: "ETL ID added"
  #description: "Triggered when a new ETL ID is added"
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: e_flights_default_datagroup

explore: accidents {
  description: "Accident report information"
}

explore: aircraft {}

explore: aircraft_models {}

explore: airports {}

explore: cal454 {}

explore: carriers {}

explore: flights {
  query: predefined_query {
    label: "GDIL"
    dimensions: [dep_date, diverted]
    measures: [count]
  }
}

# explore: flights_by_day {}

explore: ontime {}

# change
