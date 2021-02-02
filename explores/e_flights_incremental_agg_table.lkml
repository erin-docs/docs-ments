include: "/models/e_flights.model"


explore: +accidents {
  aggregate_table: accidents_monthly {
    query: {
      dimensions: [event_month, id, weather_condition]
      measures: [count]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: e_flights_default_datagroup
      increment_key: "event_month"
      increment_offset: 1
    }
  }
}
