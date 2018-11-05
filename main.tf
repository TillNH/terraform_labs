variable "my_ami" {
  type = "map"
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/home/till/.aws/credentials"
  profile                 = "terraform"
}

resource "aws_instance" "web" {
  ami = "${lookup(var.my_ami, "us-east-1")}"
  instance_type = "t2.large"
  tags {
    Name = "terralab"
  }
}
