###cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1gd0ene28ce38jum5ol"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gh84ji5m46hok29kbf"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

# SSH variables
variable "vms_ssh_root_key" {
  type        = string
  description = "ssh-keygen -t ed25519 or rsa"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvcG8Vf7p3y2uZoqeWojRC6QEsW25sJ7qTk+078OUKWzxOKHok5jmD7t/fZ8A82D6H5dlSHwN0e8SEnWqSuCxBn5vNfljaGNl2gg8rN4n5f9pZYOmi6naEvH3tkX19fSjJY3Yh9WFvjZ5lR+lkCryDxqDxLkH0tawxqumhQpyEnhVd1ljU17+ArZfTrx0Mg3j7J9EhGVaoan3MMuN1mGdA2aBUeDKC85Sh7oE35JuoRuRiFUalCwG4xEB0KjvMJFs3L2yAm2bPBRfkooxiHGEIKOxNvbeFdhixtcHTKg4L1k9lnE5MMix25Trod2xnOLnRIve0tQ62jHeUtzdsBKut viktor-rsa-key-20250120"
}

# Service account key file
variable "service_account_key_file" {
  type        = string
  default     = "~/.authorized_key.json"
  description = "Path to service account key file"
}
