connection: "shirts_shirts_pants"

# include all the views
include: "/views/**/*.view"
include: "/main_views/**/*.view"
datagroup: sssp_tko_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

explore: order_items {
  join: pro {
    view_label: "product"
    relationship: many_to_one
    type: left_outer
    sql_on: ${pro.id} = ${order_items.product_id} ;;
  }
  #Modified relationship from many_to_one
  join: pac_flat {
    view_label: "product"
    relationship: one_to_one
    type: left_outer
    sql_on: ${pac_flat.product_id} = ${order_items.product_id} ;;
  }
  #Modified relationship from many_to_one
  join: pan_flat {
    view_label: "product"
    relationship: one_to_one
    type: left_outer
    sql_on: ${pan_flat.product_id} = ${order_items.product_id} ;;
  }

  join: orders {
    relationship: one_to_many
    type:  left_outer
    sql_on: ${order_items.product_id} = ${orders.id} ;;
  }
}

# explore: orders {}

# explore: pan_flat {}
#
# explore: pac_flat {}
#
# persist_with: sssp_tko_default_datagroup
#
# explore: ath {}
#
# explore: attribute {}
#
# explore: billing {}
#
# explore: coll {}
#
# explore: distribution_center {}
#
# explore: google_analytics {}
#
# explore: holidays {}
#
# explore: marketo {}
#
# explore: mvp {}
#
# explore: p_a_c {
#   join: attribute {
#     type: left_outer
#     sql_on: ${p_a_c.attribute_id} = ${attribute.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: p_a_n {
#   join: attribute {
#     type: left_outer
#     sql_on: ${p_a_n.attribute_id} = ${attribute.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: partners {}
#
# explore: pro {}
#
# explore: salesforce {}
#
# explore: shipping {}
#
# explore: users_legacy {}
