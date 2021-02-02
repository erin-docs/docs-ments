include: "/models/e_flights.model"


explore: +accidents {
  aggregate_table: accidents_monthly {
    query: {
      dimensions: [event_month, id, weather_condition]
    }

    materialization: {
      datagroup_trigger: e_flights_default_datagroup
    }
  }
}
