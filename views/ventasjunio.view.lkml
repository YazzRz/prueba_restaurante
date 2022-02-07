view: ventasjunio {
  sql_table_name: `DATOS.VENTASJUNIO`
    ;;

  dimension: _semana {
    type: string
    sql: ${TABLE}._Semana ;;
  }

  dimension: bruto {
    type: number
    sql: ${TABLE}.BRUTO ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.CANTIDAD ;;
  }

  dimension: check1 {
    type: string
    sql: ${TABLE}.CHECK1 ;;
  }

  dimension: clientes {
    type: number
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

  dimension_group: fecha {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FECHA ;;
  }

  dimension_group: fechahora {
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
    sql: ${TABLE}.FECHAHORA ;;
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
    type: number
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

  dimension: mesanon {
    type: yesno
    sql: ${mesa}='0' ;;
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
    type: number
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

  dimension: propina {
    type: number
    sql: ${TABLE}.PROPINA ;;
  }

  set: pagos {
    fields: [idmesera,costo_neto,propina]
  }
  dimension: psegundos {
    type: number
    sql: ${TABLE}.PSEGUNDOS ;;
  }

  dimension: segundos {
    type: string
    sql: ${TABLE}.SEGUNDOS ;;
  }


  dimension: sub_menu {
    type: string
    sql: ${TABLE}.SUB_MENU ;;
  }

  dimension: subid {
    type: number
    sql: ${TABLE}.SUBID ;;
  }

  dimension: subno {
    type: string
    sql: ${TABLE}.SUBNO ;;
  }

  dimension: tipo_venta {
    type: string
    sql: ${TABLE}.TIPO_VENTA ;;
  }

  dimension: transacc {
    type: number
    sql: ${TABLE}.TRANSACC ;;
  }

  dimension: zona {
    type: string
    sql: ${TABLE}.ZONA ;;
  }


  measure: count {
    type: count
    drill_fields: [longname,pagos*]
  }

  measure: total_cantidad {
    type: sum
    sql: ${cantidad} ;;
    drill_fields: [pagos*]
  }

  measure: costo_neto {
    type: sum
    value_format_name: usd_0
    sql: ${neto} ;;
  }

  measure: promedio_venta {
    type: average
    value_format_name: usd_0
    sql: ${neto} ;;
    filters: [ventasjunio.plataforma: "RAPPI"]
  }

  dimension: llave_primaria {
    primary_key: yes
    sql: concat(${factura},${menuid},${subid}) ;;
  }

  dimension: campo_check_por_zona {
    sql: ${subid}::string ;;
  }

  dimension: zona_ciudad {
    type: string
    sql: concat("@{ciudad}",${zona}) ;;
  }

}
