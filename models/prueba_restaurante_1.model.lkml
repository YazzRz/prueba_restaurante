connection: "restaurante"

# include all the views
include: "/views/**/*.view"

datagroup: prueba_restaurante_1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: prueba_restaurante_1_default_datagroup

explore: junio2020 {}

explore: uniondatos {}

explore: ventasjunio {}

explore: jun1 {}
