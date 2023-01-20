view: sql_runner_query {
  derived_table: {
    sql: select decimals from `pruebas_BQ_Looker.amended_tokens`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: decimals {
    type: string
    sql: ${TABLE}.decimals ;;
  }

  set: detail {
    fields: [decimals]
  }
}
