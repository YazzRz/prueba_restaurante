connection: "restaurante"

# include all the views
include: "/views/**/*.view"

datagroup: prueba_restaurante_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: prueba_restaurante_default_datagroup

access_grant: access_impuestos {
  user_attribute: id
  allowed_values: ["16","23"]
}

explore: junio2020 {
  group_label: "Ventas Junio Detalle"
}

# explore: jun1 {}

# explore: uniondatos {} estas bases de datos no se permiten visualizar
explore: ventasjunio {
  fields: [ALL_FIELDS*]
  always_filter: {
    filters: [ventasjunio.tipo_venta: "Domicilios"]
  }
  sql_always_where: ${zona} ="Sur" or ${zona}="Norte";;
  conditionally_filter: {
    filters: [ventasjunio.producto: "AGUA MANANTIAL"]
    unless: [zona,dia,momento_del_dia]
  }
  join: sqldt {
    type: left_outer
    relationship: many_to_one
    sql_on: ${sqldt.zona}=${ventasjunio.zona} ;;
  }
  join: junio2020 {
    view_label: "junio2020_peroConViewLabel"
    type: left_outer
    relationship: one_to_many
    sql_on: ${junio2020.factura}=${ventasjunio.factura} ;;
  }
}
