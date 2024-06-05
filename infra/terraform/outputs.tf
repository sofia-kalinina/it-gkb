output "pgvector_user" {
  value = module.vectorestore.db_user
}

output "pgvector_password" {
  value = module.vectorestore.db_password
  sensitive = true
}

output "pgvector_enpoint" {
  value = module.vectorestore.db_endpoint
}

output "pgvector_database" {
  value = module.vectorestore.db_database
}
