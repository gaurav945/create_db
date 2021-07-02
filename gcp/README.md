# Generating Postgres DB instance on GCP

The idea is to create a basic (or with advanced configurations) Postgres DB, from the console.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

In order to see the outputs of above commands, please refer aws [readme](aws/README.md).

Note that this example may create resources which cost money.

## Adding more configurations

This file can be updated according to our needed requirements & more configurations can be added, which will create a DB accordingly. Here is a complete [list](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) of available settings.

