variable "ami" {
  type          = string
  description   = "AMI of the instance"
  default       = "ami-07e0ddfbe868cbc9b" # Amazon Linux
  # default       = "ami-015f3596bb2ef1aaa" # Ubuntu
  # default       = "ami-01878f8de6ca70e7f" # Red Hat
  # default       = "ami-0a667c9e0dcad4277" # Debian
}
