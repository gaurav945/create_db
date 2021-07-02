provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "default" {
  engine            = "postgres"
  engine_version    = "12.5"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  name     = "demodb"
  username = "postgres_user"
  password = "master_password"

  storage_type = "gp2"
  multi_az = "false"

  apply_immediately = "true"
}

