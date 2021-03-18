include: "/views/accidents.view.lkml"


explore: accidents_w_agg_table {
  from: accidents
  aggregate_table: accidents_daily {
    query: {
      dimensions: [event_date, id, weather_condition]
      measures: [count]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: e_flights_default_datagroup
      increment_key: "event_week"
      increment_offset: 1
    }
  }
}
