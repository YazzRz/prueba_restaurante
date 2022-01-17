connection: "restaurante"

# include all the views
include: "/views/**/*.view"

datagroup: prueba_restaurante_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: prueba_restaurante_default_datagroup

# explore: junio2020 {}

# explore: jun1 {}

# explore: uniondatos {} estas bases de datos no se permiten visualizar
explore: ventasjunio {}
