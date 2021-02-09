view: e_flights_incremental_pdt {

  derived_table: {
    indexes: ["id"]
    increment_key: "departure_date"
    increment_offset: 3
    datagroup_trigger: e_flights_default_datagroup
    distribution_style: all
    explore_source: flights {
      column: id {}
      column: carrier {}
      column: departure_raw {}
    }
  }

  dimension: id {
    type: number
  }
  dimension: carrier {
    type: string
  }
  # dimension_group: dep {
  #   type: time
  #   timeframes: [raw, hour, date, month]
  #   sql: ${TABLE}.departure_raw;;
  # }
}




# the flights view has a departure dimension group, but you need to base the PDT column on a dimension, not a dimention group. so pick one of the timesframes, becaise each of the timesframes is itself a dimension. If we use raw, then we can create our own dimension group in the PDT (see below)

# dimension_group: departure {
#   type: time
#   timeframes: [
#     raw,
#     time,
#     date,
#     week,
#     month,
#     quarter,
#     year
#   ]
#   sql: ${TABLE}.dep_time ;;
# }


 # Now that. we have raw departure data in the explore source, we can do a new dimension group in the PDT using the raw data. You need to specify type: time
