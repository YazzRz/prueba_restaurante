view: sqldt {
  derived_table: {
    sql: SELECT zona, check1, sum(cantidad) as cantidad
    from DATOS.VENTASJUNIO
    group by 1,2;;
  }
 dimension: zona {
   primary_key:yes
  sql: ${TABLE}.zona ;;
 }

dimension: campo_zona {
  sql: concat(${zona},${TABLE}.check1) ;;
}
measure: suma_por_zona {
  type: sum
  sql: ${TABLE}.cantidad ;;
}
}
