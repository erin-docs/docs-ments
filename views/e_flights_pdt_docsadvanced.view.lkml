view: e_flights_pdt_docsadvanced {

  derived_table: {
    indexes: ["id"]
    publish_as_db_view: yes
    datagroup_trigger: e_flights_default_datagroup
    distribution_style: all
    explore_source: flights {
      timezone: "America/Los_Angeles"
      column: id {}
      column: carrier {}
      column: departure_date {}
      sorts: [flights.id: desc]
    }
  }
  dimension: id {}
  dimension: carrier {}
  dimension: departure_date {
    type: date
  }
}
