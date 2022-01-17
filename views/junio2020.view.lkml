view: junio2020 {
  sql_table_name: `DATOS.JUNIO2020`
    ;;

  dimension: bruto {
    type: string
    sql: ${TABLE}.BRUTO ;;
  }

  dimension: cantidad {
    type: string
    sql: ${TABLE}.CANTIDAD ;;
  }

  dimension: check1 {
    type: string
    sql: ${TABLE}.CHECK1 ;;
  }

  dimension: clientes {
    type: string
    sql: ${TABLE}.CLIENTES ;;
  }

  dimension: closetime {
    type: string
    sql: ${TABLE}.CLOSETIME ;;
  }

  dimension: co {
    type: string
    sql: ${TABLE}.CO ;;
  }

  dimension: dia {
    type: string
    sql: ${TABLE}.DIA ;;
  }

  dimension: factura {
    type: string
    sql: ${TABLE}.FACTURA ;;
  }

  dimension: fecha {
    type: string
    sql: ${TABLE}.FECHA ;;
  }

  dimension: hora1 {
    type: string
    sql: ${TABLE}.HORA1 ;;
  }

  dimension: idmesera {
    type: string
    sql: ${TABLE}.IDMESERA ;;
  }

  dimension: impuesto {
    type: string
    sql: ${TABLE}.IMPUESTO ;;
  }

  dimension: item {
    type: string
    sql: ${TABLE}.ITEM ;;
  }

  dimension: linea {
    type: string
    sql: ${TABLE}.LINEA ;;
  }

  dimension: longname {
    type: string
    sql: ${TABLE}.LONGNAME ;;
  }

  dimension: menuid {
    type: string
    sql: ${TABLE}.MENUID ;;
  }

  dimension: menuno {
    type: string
    sql: ${TABLE}.MENUNO ;;
  }

  dimension: mesa {
    type: string
    sql: ${TABLE}.MESA ;;
  }

  dimension: minut1 {
    type: string
    sql: ${TABLE}.MINUT1 ;;
  }

  dimension: momento_del_dia {
    type: string
    sql: ${TABLE}.MOMENTO_DEL_DIA ;;
  }

  dimension: neto {
    type: string
    sql: ${TABLE}.NETO ;;
  }

  dimension: nomesera {
    type: string
    sql: ${TABLE}.NOMESERA ;;
  }

  dimension: opentime {
    type: string
    sql: ${TABLE}.OPENTIME ;;
  }

  dimension: pdv {
    type: string
    sql: ${TABLE}.PDV ;;
  }

  dimension: plataforma {
    type: string
    sql: ${TABLE}.PLATAFORMA ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.PRODUCTO ;;
  }

  dimension: psegundos {
    type: string
    sql: ${TABLE}.PSEGUNDOS ;;
  }

  dimension: segundos {
    type: string
    sql: ${TABLE}.SEGUNDOS ;;
  }

  dimension: semana {
    type: string
    sql: ${TABLE}.SEMANA ;;
  }

  dimension: sub_menu {
    type: string
    sql: ${TABLE}.SUB_MENU ;;
  }

  dimension: subid {
    type: string
    sql: ${TABLE}.SUBID ;;
  }

  dimension: subno {
    type: string
    sql: ${TABLE}.SUBNO ;;
  }

  dimension: transacc {
    type: string
    sql: ${TABLE}.TRANSACC ;;
  }

  dimension: zona {
    type: string
    sql: ${TABLE}.ZONA ;;
  }

  measure: count {
    type: count
    drill_fields: [longname]
  }
}
