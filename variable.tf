# variables.tf
variable "vm_ip" {
  description = "Private IP address for the VM"
  type        = string
  default     = "192.168.56.10"
}
