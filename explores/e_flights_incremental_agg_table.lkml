include: "/models/e_flights.model"


explore: +accidents {
  aggregate_table: rollup__event_month__id__weather_condition {
    query: {
      dimensions: [event_month, id, weather_condition]
    }

    materialization: {
      datagroup_trigger: e_flights_default_datagroup
    }
  }
}
