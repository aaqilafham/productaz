provider "aws" {
    alias = "irland"
    region = "eu-west-1"
}
provider "aws" {
  alias = "london"
  region = "eu-west-2"
}

resource "aws_security_group" "sg_irland" {
  provider = aws.irland
  name        = "allow_tls_ir"
}

resource "aws_security_group" "sg_london" {
  provider = aws.london
  name        = "allow_tls_lo"
}


