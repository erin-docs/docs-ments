view: e_flights_inc_sdt {

  derived_table: {
    datagroup_trigger: e_flights_default_datagroup
    increment_key: "departure_date"
    increment_offset: 3
    distribution_style: all
    sql: SELECT
      flights.id2  AS "id",
      flights.origin  AS "origin",
      DATE(flights.dep_time )  AS "departure_date"
      FROM public.flights  AS flights
      WHERE {% incrementcondition %} departure_date {%  endincrementcondition %}
          ;;
  }


  dimension: id {}
  dimension: origin {}
  dimension: departure_date {
    type: date
  }
}
