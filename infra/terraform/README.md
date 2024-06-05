# Infra

## Vectorstore

Terraform code provisions RDS with instance of postgresql 16.2 and 'pgvector' extention.

In order to install pgvector extention, terraform code executes sql script `modules/vectorstore/create_extention.sql`. Please make sure `psql` is installed on your machine.

```sh
$ brew install libpq
```

This DB is absolutely insecure and should be used only to store data chunks of IT Grundschutz temporary. It should be destroyed after experimenting with data.

