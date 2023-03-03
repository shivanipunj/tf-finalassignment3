variable "ami" {
   type = string
}

variable "instance" {
   type = string
}

variable "tags" {
     type = map(any)
}

variable "bucket" {
     type = string
}

#______________________________vpc___________________________
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "cidr block for vpc"
  type        = string

}

variable "vpc_tag" {
  default = {
    Name = "shivani-vpc"
  }
  description = "tag for vpc"
  type        = map(string)

}

#------------------------------------------------------------------------------------------------

variable "subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "cidr block for vpc"
  type        = string
}


variable "subnet_az" {
  default     = "us-east-1a"
  description = "availability zone for vpc subnet"
  type        = string
}


variable "subnet_tag" {
  default = {
    Name = "shivani-subnet"
  }
  description = "tag for vpc subnet"
  type        = map(string)

}