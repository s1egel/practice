view: order_items {
  sql_table_name: brands.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

#   dimension: created_at_base {
#     type: number
#     sql: ${TABLE}."created_at" ;;
#  }

  dimension_group: created_at {
    type: time
    datatype: epoch
    timeframes: [date, day_of_year, week_of_year, month, year]
    sql: ${TABLE}."created_at" ;;
  }

# Adjust to match created_at
  dimension: shipped_at {
    type: number
    sql: ${TABLE}."shipped_at" ;;
  }

#   dimension: is_year_do_date {
#     type: yesno
#     sql: ${created_at_day_of_year} <=  ;;
#   }

#   dimension: created_sql {
#     type: date
#     sql: EXTRACT(YEAR FROM ((to_timestamp(order_items."created_at" ) AT TIME ZONE 'UTC'))::
#  timestamptz AT TIME ZONE 'America/Los_Angeles')::integer ;;
#   }

  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."sale_price" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }

  dimension: gross_margin {
    type: number
    sql: ${sale_price} - ${pan_flat.cost} ;;
  }

  measure: total_gross_margin {
    type: sum
    sql: ${gross_margin} ;;
  }

  measure: total_cost {
    type: sum
    sql: ${pan_flat.cost} ;;
  }

  measure: gross_margin_percentage {
    #Gross profit margin, (revenue - cost of good sold)/revenue
    value_format_name: percent_2
    type: number
    sql: (${total_sale_price} - ${total_cost})/${total_sale_price} ;;
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
    drill_fields: [status, product_id, pro.name]
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

}
