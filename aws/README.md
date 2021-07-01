# Generating Postgres DB instance on Amazon RDS

The idea is to create a basic (or with advanced configurations) Postgres DB, from the console.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money.

## Adding more configurations

More configurations can be added to this file, which will create a DB accordingly. Here is a complete [list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) of available settings.
