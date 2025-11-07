## variables.tf

# 🐳 Nombre del contenedor
variable "container_name" {
  description = "El nombre deseado para el contenedor Docker."
  type        = string
  default     = "web_server" # Valor por defecto
}

# 🌐 Puerto externo (host)
variable "external_port" {
  description = "El puerto en el host que se asignará al puerto interno 80 del contenedor."
  type        = number
  default     = 8080 # Valor por defecto
}