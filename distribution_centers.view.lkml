view: distribution_centers {
  suggestions: no
  label: "Docs-ments go!"
  sql_table_name: public.distribution_centers ;;

  dimension: id {
    description: "test"
    primary_key: yes
    hidden: no
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name, products.count]
  }
}
