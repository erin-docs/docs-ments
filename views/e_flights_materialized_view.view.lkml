view: e_flights_materialized_view {

  derived_table: {
    indexes: ["id"]
    materialized_view: yes
    explore_source: flights {
      timezone: "America/Los_Angeles"
      column: id {}
      column: carrier {}
      column: departure_time {}
      column: departure_date {}
    }
  }
  dimension: id {}
  dimension: carrier {}
  dimension: departure_date {
    type: date
  }
  dimension: departure_time {
    type: date_time
  }
}
