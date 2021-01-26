connection: "faa"

include: "/views/e_faa_pdt_docsadvanced.view.lkml"
include: "/views/flights.view.lkml"

explore: e_flights_pdt_docsadvanced {

}


explore: flights {}

datagroup: e_flights_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
