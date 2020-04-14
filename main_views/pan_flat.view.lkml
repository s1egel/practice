view: pan_flat {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
      order_items.id as oi_id,
      products.id as product_id,
      MAX(CASE
              WHEN (p_a_n."attribute_id") = 4 THEN (p_a_n."value")
              ELSE NULL
            END)
               AS cost,
      MAX(CASE
              WHEN (p_a_n."attribute_id") = 5 THEN (p_a_n."value")
              ELSE NULL
            END)
               AS retail_price,
      MAX(CASE
              WHEN (p_a_n."attribute_id") = 6 THEN (p_a_n."value")
              ELSE NULL
            END)
               AS distribution_center_id
      FROM brands.order_items  AS order_items
      LEFT JOIN brands.p_a_n  AS p_a_n ON (p_a_n."product_id") = (order_items."product_id")
      LEFT JOIN brands.pro AS products on products."id" = order_items."product_id"
      GROUP BY 1, 2
      ORDER BY 1 ;;
  }

  dimension: order_items_id {
    hidden: yes
    type: number
    primary_key: yes
    sql: ${TABLE}.oi_id ;;
  }

  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: distribution_center_id {
    type: number
    sql:  ${TABLE}.distribution_center_id ;;
  }

}
