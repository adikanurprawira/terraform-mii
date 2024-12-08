variable "automation" {
  description = "Automation tool used to provision the resources."
  type        = string
  default     = "terraform"
  validation {
    condition     = contains(["terraform", "tfcdk", "terragrunt"], var.automation)
    error_message = "Tag variable 'automation` must be either: terraform, tfcdk, terragrunt."
    // Pulumi used here in case if we need to import resources
  }
}

variable "business_unit" {
  description = "Business Unit name gives a good picture of understanding for which business unit that resource belongs to."
  type        = string
  default     = ""
}

variable "application" {
  description = "Setting application name gives an opportunity for group filtering"
  type        = string
  default     = ""
}

variable "service" {
  description = "Setting service name gives a good picture of understanding for which application that resource belongs to."
  type        = string
  default     = ""
}

variable "repo_url" {
  description = "The URL to the repo where the IaaC configuration is stored"
  type        = string
  default     = ""
}

variable "repo_path" {
  description = "Setting repo_path gives a better understanding of the storing structure IaaC configuration. Can be empty string, by default, but useful if the IaaC stored in monorepoo"
  default     = ""
  type        = string
}

variable "environment" {
  description = "Environment Production or Development"
  default     = ""
  type        = string
}

variable "map-migrated" {
  description = "Please input if any"
  default     = ""
  type        = string
}
