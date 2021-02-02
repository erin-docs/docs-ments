include: "/models/e_flights.model"


explore: +accidents {
  aggregate_table: accidents_monthly {
    query: {
      dimensions: [event_year, id, weather_condition]
      measures: [count]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: e_flights_default_datagroup
    }
  }
}
