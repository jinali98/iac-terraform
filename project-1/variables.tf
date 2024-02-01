variable "vpc_cidr" {
  description = "cidr value for main vpc"
  type        = string
  default     = "10.0.0.0/16"
}
variable "subnet_A_cidr" {
  description = "cidr value for subnet A"
  type        = string
  default     = "10.0.0.0/24"
}
variable "subnet_A_az" {
  description = "availability zone for subnet A"
  type        = string
  default     = "us-east-1a"
}
variable "subnet_B_cidr" {
  description = "cidr value for subnet B"
  type        = string
  default     = "10.0.1.0/24"
}
variable "subnet_B_az" {
  description = "availability zone for subnet B"
  type        = string
  default     = "us-east-1b"
}