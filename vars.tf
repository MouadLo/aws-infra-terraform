variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0fc61db8544a617ed"
    us-west-2 = "ami-09a7fe78668f1e2c0"
    eu-west-1 = "ami-04d5cc9b88f9d1d39"
  }
}

