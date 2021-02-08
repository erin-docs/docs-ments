view: e_flights_incremental_pdt {

  derived_table: {
    indexes: ["id"]
    publish_as_db_view: yes
    increment_key: "departure_date"
    increment_offset: 3
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
  dimension_group: departure {
      type: time
      timeframes: [raw, hour, date, week, month, year]
      sql:  flights.dep_time
        ;;
  }
}
