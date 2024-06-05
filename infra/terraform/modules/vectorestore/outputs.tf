output "db_user" {
  value = aws_db_instance.vectorstore.username
}

output "db_password" {
  value = aws_db_instance.vectorstore.password
  sensitive = true
}

output "db_endpoint" {
  value = aws_db_instance.vectorstore.endpoint
}

output "db_database" {
  value = aws_db_instance.vectorstore.db_name
}
