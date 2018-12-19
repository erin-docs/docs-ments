view: order_items {
  sql_table_name: public.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

# duration example using two existing time fields

#   dimension_group: days_to_deliver {
#     type: duration
#     intervals: [day]
#     sql_start: ${created_raw} ;;
#     sql_end: ${delivered_raw};;
#   }

# duration example using current timestamp

#   dimension_group: duration_since_delivered {
#     type: duration
#     intervals: []
#     sql_start: ${delivered_raw} ;;
#     sql_end: cast(current_timestamp as timestamp);;
#   }



  dimension_group: to_delivery {
    type: duration
    datatype: epoch
   convert_tz: yes
  intervals: [day, hour]
    sql_start: ${created_raw} ;;
    sql_end: ${delivered_raw};;
  }

  dimension: number_of_days_to_delivery {
    type: duration_day
    datatype: date
    convert_tz: yes
    sql_start: ${created_raw} ;;
    sql_end: ${delivered_raw};;
  }

  dimension: number_of_hours_to_delivery {
    type: duration_day
    datatype: timestamp
    sql_start: ${created_raw} ;;
    sql_end: ${delivered_raw};;
  }


dimension_group: test {
type: time
datatype: epoch
convert_tz: yes
}

dimension: test {
  type: duration_day
  convert_tz: yes
}
filter: test_2 {
  type: date
  convert_tz: yes
}


#
#   dimension: number_of_minutes_to_delivery {
#     type: duration_minute
#     sql_start: ${created_raw} ;;
#     sql_end: ${delivered_raw};;
#   }
#
#
#   dimension: number_of_months_to_delivery {
#     type: duration_month
#     sql_start: ${created_raw} ;;
#     sql_end: ${delivered_raw};;
#   }
#
#
#   dimension: number_of_quarters_to_delivery {
#     type: duration_quarter
#     sql_start: ${created_raw} ;;
#     sql_end: ${delivered_raw};;
#   }
#
#
#
#
#   dimension: number_of_secs_to_delivery {
#     type: duration_second
#     sql_start: ${created_raw} ;;
#     sql_end: ${delivered_raw};;
#   }
#
#
#
#   dimension: number_of_weeks_to_delivery {
#     type: duration_week
#     sql_start: ${created_raw} ;;
#     sql_end: ${delivered_raw};;
#   }
#
#
#
#   dimension: number_of_years_to_delivery {
#     type: duration_year
#     sql_start: ${created_raw} ;;
#     sql_end: ${delivered_raw};;
#   }
#
#
#
#   }


#   dimension: days_since_delivered {
#     type: duration_day
#     sql_start: ${delivered_raw} ;;
#     sql_end: cast(current_timestamp as timestamp);;
#   }

#   dimension_group: since_delivered_group {
#     type: duration
#     intervals: [day]
#     sql_start: ${delivered_raw} ;;
#     sql_end: cast(current_timestamp as timestamp);;
#   }

#   dimension_group: since_delivered {
#     type: duration
#     sql_start: ${delivered_raw} ;;
#     sql_end: cast(current_timestamp as timestamp);;
#   }


 dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}
