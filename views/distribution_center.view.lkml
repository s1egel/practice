view: distribution_center {
  sql_table_name: brands.distribution_center ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}."address" ;;
  }

  dimension: center_description {
    type: string
    sql: ${TABLE}."center_description" ;;
  }

  dimension: original {
    type: string
    sql: ${TABLE}."original" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
