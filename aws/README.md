# Generating Postgres DB instance on Amazon RDS

The idea is to create a basic (or with advanced configurations) Postgres DB, from the console.

## Usage

To run this example you need to execute:

```bash
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v3.47.0...
- Installed hashicorp/aws v3.47.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```bash
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_db_instance.default will be created
  + resource "aws_db_instance" "default" {
      + address                               = (known after apply)
      + allocated_storage                     = 20
      + apply_immediately                     = true
      + engine                                = "postgres"
      + engine_version                        = "12.5"
##...
Plan: 1 to add, 0 to change, 0 to destroy.
##...
```

```bash
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_db_instance.default will be created
  + resource "aws_db_instance" "default" {
      + address                               = (known after apply)
      + allocated_storage                     = 20
      + apply_immediately                     = true
      + engine                                = "postgres"
      + engine_version                        = "12.5"
      + instance_class                        = "db.t3.small"
##...
Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + db_instance_endpoint = [
      + (known after apply),
    ]

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_db_instance.default: Creating...
aws_db_instance.default: Still creating... [10s elapsed]
##...
aws_db_instance.default: Still creating... [3m10s elapsed]
aws_db_instance.default: Creation complete after 3m16s [id=terraform-20210702092413657000000001]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

db_instance_endpoint = [
  "terraform-20210702092413657000000001.ctz4rcafdxbs.us-east-1.rds.amazonaws.com:5432",
]
```

Note that this example may create resources which cost money.

## Updating created resources

We may want to change certain parameters of our DB instance, for example the allocated_storage or instance_type. This is done by updating the appropriate parameter in the main.tf file & executing terraform apply.
For example, if we change the instance_class from db.t3.micro to db.t3.small & wish to see what changes would take place, running terraform plan would give us the output something similar to this :
```bash
$ terraform plan
aws_db_instance.default: Refreshing state... [id=terraform-20210702092413657000000001]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # aws_db_instance.default has been changed
  ~ resource "aws_db_instance" "default" {
      + enabled_cloudwatch_logs_exports       = []
        id                                    = "terraform-20210702092413657000000001"
        name                                  = "demodb"
      + security_group_names                  = []
      + tags                                  = {}
        # (43 unchanged attributes hidden)
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_db_instance.default will be updated in-place
  ~ resource "aws_db_instance" "default" {
        id                                    = "terraform-20210702092413657000000001"
      ~ instance_class                        = "db.t3.micro" -> "db.t3.small"
        name                                  = "demodb"
        tags                                  = {}
        # (44 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
##...
```

and then, on executing terraform apply :
```bash
$ terraform apply
aws_db_instance.default: Refreshing state... [id=terraform-20210702092413657000000001]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # aws_db_instance.default has been changed
  ~ resource "aws_db_instance" "default" {
      + enabled_cloudwatch_logs_exports       = []
        id                                    = "terraform-20210702092413657000000001"
        name                                  = "demodb"
      + security_group_names                  = []
      + tags                                  = {}
        # (43 unchanged attributes hidden)
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_db_instance.default will be updated in-place
  ~ resource "aws_db_instance" "default" {
        id                                    = "terraform-20210702092413657000000001"
      ~ instance_class                        = "db.t3.micro" -> "db.t3.small"
        name                                  = "demodb"
        tags                                  = {}
        # (44 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_db_instance.default: Modifying... [id=terraform-20210702092413657000000001]
aws_db_instance.default: Still modifying... [id=terraform-20210702092413657000000001, 10s elapsed]
##...
aws_db_instance.default: Still modifying... [id=terraform-20210702092413657000000001, 6m20s elapsed]
aws_db_instance.default: Modifications complete after 6m27s [id=terraform-20210702092413657000000001]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.

Outputs:

db_instance_endpoint = [
  "terraform-20210702092413657000000001.ctz4rcafdxbs.us-east-1.rds.amazonaws.com:5432",
]
```

Changes to a DB instance are reflected in the next maintenance window. However, they can be applied immediately using *apply_immediately* setting in main.tf, its default value is false.

## Adding more configurations

This file can be updated according to our needed requirements & more configurations can be added, which will create a DB accordingly. Here is a complete [list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) of available settings.
