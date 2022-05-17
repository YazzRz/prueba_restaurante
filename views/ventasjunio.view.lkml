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
    label: "Tipo Hora"
    description: "Este campo me sirve para ....... calculo de hora"
    type: string
    sql: ${TABLE}.HORA1 ;;
  }

  dimension: idmesera {
    type: number
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

  # set: pagos {
  #   fields: [idmesera,costo_neto,propina]
  # }
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
    value_format: "#,##0.00"   }

  measure: costo_neto {
    type: sum
    value_format_name: usd_0
    sql: ${neto} ;;
  }

  measure: promedio_venta {
    group_label: "Calculos"
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

  # measure: suma_conteo {
  #   hidden: no
  #   label: "Total de Registros"
  #   description: "Acá vas a encontrar la suma de todos los registros"
  #   type: sum_distinct
  #   sql: ${zona} ;;
  #   drill_fields: [conjunto_de_datos_1*]
  # }

  set: pagos{
    fields: [mesa,nomesera,producto,propina]
  }

  measure: total_revenue {
    group_label: "Calculos"
    type: sum
    sql: ${TABLE}.PROPINA ;;
    drill_fields: [calculos*]
    link: {
      label: "Explore as Table"
      url: "
      {% assign vis_config = '{
      \"type\": \"marketplace_viz_multiple_value::multiple_value-marketplace\",
      \"dividers\": \"true\",
      \"style_ventasjunio.costo_neto\": \"#3A4245\",
      \"style_ventasjunio.total_cantidad\": \"#FCA33D\"}'%}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
    }
  }

  measure: user_count {
    group_label: "Calculos"
    type: count_distinct
    sql: ${idmesera} ;;
  }

  measure: average_revenue_per_mesera {
    group_label: "Calculos"
    type: number
    sql: ${total_revenue}/${user_count} ;;
  }

  set: calculos {
    fields: [total_cantidad,costo_neto]
  }


}
