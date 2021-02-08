view: e_flights_incremental_pdt {

  derived_table: {
    indexes: ["id"]
    publish_as_db_view: yes
    increment_key: "departure_date"
    increment_offset: 3
    datagroup_trigger: e_flights_default_datagroup
    distribution_style: all
    explore_source: flights {
      column: id {}
      column: carrier {}
      column: departure_raw {}
      sorts: [flights.id: desc]
    }
  }
  dimension: id {}
  dimension: carrier {}
  dimension_group: departure {
    type: time
    timeframes: [raw, date, month]
    sql: ${TABLE}.departure_raw;;
  }
}


# line 14: need to reference the departure date from the flgiths view
# since dimension groups from the view aren't a dimention, you have to pick one of the timefreames from the dimention group, because the timeframes each are dimension

# Now that. we have raw departure data in the explore source, we can do a new dimension group in the PDT using the raw data. need type: time
