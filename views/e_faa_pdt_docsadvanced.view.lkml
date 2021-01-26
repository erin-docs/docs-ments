view: e_flights_pdt_docsadvanced {

  derived_table: {
    indexes: ["id"]
#     publish_as_db_view: yes
    datagroup_trigger: e_flights_default_datagroup
    explore_source: flights {
      column: id {}
      column: carrier {}
      column: arr_date {
      }
    }
  }
  dimension: id {}
  dimension: carrier {}
  dimension: arr {
    type: date
  }
}
