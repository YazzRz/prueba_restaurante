connection: "restaurante"

# include all the views
include: "/views/**/*.view"

datagroup: prueba_restaurante_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: prueba_restaurante_default_datagroup

explore: junio2020 {}

# explore: jun1 {}

# explore: uniondatos {} estas bases de datos no se permiten visualizar
explore: ventasjunio {
  fields: [ALL_FIELDS*,-ventasjunio.average_revenue_per_mesera]
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
  access_filter: {
    field: tipo_venta
    user_attribute: envio_2
  }
  access_filter: {
    field: producto
    user_attribute: manantial
  }
  join: junio2020 {
    view_label: "junio2020_peroConViewLabel"
    type: left_outer
    relationship: one_to_many
    sql_on: ${junio2020.factura}=${ventasjunio.factura} ;;
  }
}
explore: sqldt {
  group_label: "facturación"}

explore: ventas_restaurante {
  group_label: "facturación"
  from: ventasjunio
  join: jun1 {
    type: left_outer
    sql_on: ${ventas_restaurante.factura}=${jun1.factura} ;;
    relationship: many_to_many
  }
}
