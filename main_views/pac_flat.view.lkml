view: pac_flat {
   # Or, you could make this view a derived table, like this:
   derived_table:  {
     sql:  SELECT
      order_items.id as oi_id,
      products.id as product_id,
      MAX(CASE
              WHEN (p_a_c."attribute_id") = 1 THEN (p_a_c."value")
              ELSE NULL
            END)
               AS category,
      MAX(CASE
              WHEN (p_a_c."attribute_id") = 2 THEN (p_a_c."value")
              ELSE NULL
            END)
               AS brand,
      MAX(CASE
              WHEN (p_a_c."attribute_id") = 3 THEN (p_a_c."value")
              ELSE NULL
            END)
               AS department
      FROM brands.order_items  AS order_items
      LEFT JOIN brands.p_a_c  AS p_a_c ON (p_a_c."product_id") = (order_items."product_id")
      LEFT JOIN brands.pro AS products on products."id" = order_items."product_id"
      GROUP BY 1, 2
      ORDER BY 1;;
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

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

 }
