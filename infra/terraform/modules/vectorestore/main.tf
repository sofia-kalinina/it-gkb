resource "aws_security_group" "vectorstore_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_db_subnet_group" "vectorstore_subnet_group" {
  name       = "vectorstore_subnet_group"
  subnet_ids = var.subnet_ids

  tags = var.tags
}

resource "aws_db_instance" "vectorstore" {
    identifier              = "vectorstore"
    allocated_storage       = 20
    engine                  = "postgres"
    instance_class          = "db.t3.micro"
    db_name                 = "vectorstore"
    username                = "retriever"
    password                = "secret12345%"
    publicly_accessible     = true
    db_subnet_group_name    = aws_db_subnet_group.vectorstore_subnet_group.name
    vpc_security_group_ids  = [aws_security_group.vectorstore_sg.id]

    skip_final_snapshot     = true

    tags = var.tags
}

# install pgvector extention
resource "null_resource" "create_extension" {
    provisioner "local-exec" {
        command = <<EOT
            psql "host=${aws_db_instance.vectorstore.address} port=5432 user=retriever password=secret12345% dbname=vectorstore" -f ./modules/vectorestore/create_extension.sql
        EOT
        environment = {
            PGPASSWORD = aws_db_instance.vectorstore.password
        }
    }

    depends_on = [aws_db_instance.vectorstore]
}
