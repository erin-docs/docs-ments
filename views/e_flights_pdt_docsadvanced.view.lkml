view: e_flights_pdt_docsadvanced {

  derived_table: {
    indexes: ["id"]
    publish_as_db_view: yes
    increment_key: "departure_time"
    increment_offset: 1
    datagroup_trigger: e_flights_default_datagroup
    distribution_style: all
    explore_source: flights {
      timezone: "America/Los_Angeles"
      column: id {}
      column: carrier {}
      column: departure_time {}
      column: departure_date {}
      sorts: [flights.id: desc]
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
