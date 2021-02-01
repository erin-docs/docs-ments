view: e_flights_inc_sdt {

  derived_table: {
    datagroup_trigger: e_flights_default_datagroup
    increment_key: "departure_date"
    increment_offset: 3
    distribution_style: all
    sql: SELECT
      flights.id2  AS "id",
      flights.origin  AS "origin",
      DATE(flights.dep_time )  AS "departure"
      FROM public.flights  AS flights
      WHERE {% incrementcondition %} dep_time {%  endincrementcondition %}
          ;;
  }

  dimension: id {}
  dimension: origin {}
  dimension_group: departure {
    type: time
    timeframes: [raw, hour, date, week, month, year]
    datatype: timestamp
    sql:  ${TABLE}.dep_time
    ;;
  }
}
