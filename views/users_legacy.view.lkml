view: users_legacy {
  sql_table_name: brands.users_legacy ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: original {
    type: string
    sql: ${TABLE}."original" ;;
  }

  dimension: rd321 {
    type: string
    sql: ${TABLE}."rd321" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
