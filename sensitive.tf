provider "aws" {
  region = "eu-west-2"
  access_key = "AKIA4IM3HQN7JITJIPEB"
  secret_key = "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"
}

variable "ssensitive" {
  sensitive = true
  default = "Welcome@890"
}

resource "local_file" "file_name" {
  content = var.ssensitive
  filename = "password.txt"
}

output "output_value" {
  value = local_file.file_name.content
  sensitive = true
}


variable "db_sensitive" {
  sensitive = true
  default = "foo"
}


resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db_sensitive
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
