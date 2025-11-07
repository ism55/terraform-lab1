## outputs.tf

# 🌐 Puerto del servicio
output "service_port" {
  description = "El puerto externo (host) que está usando el servidor web."
  # Esto ya estaba correcto
  value       = docker_container.web.ports[0].external 
}

# 🖥️ Dirección IP del contenedor
output "container_ip_address" {
  description = "La dirección IP interna del contenedor Docker (dentro de la red Docker)."
  # 💡 CORRECCIÓN: Acceder a través de network_data[0].ip_address
  value       = docker_container.web.network_data[0].ip_address
}

# 🔗 URL de acceso (convenience output)
output "access_url" {
  description = "URL sugerida para acceder al contenedor desde el host."
  value       = "http://${docker_container.web.network_data[0].ip_address}:${docker_container.web.ports[0].external}" 
  # También ajustamos el valor aquí para usar la IP interna si quieres acceder desde otra máquina en la misma red Docker.
  # Si solo necesitas acceso desde el host, la versión "http://localhost:${...}" también es válida.
}