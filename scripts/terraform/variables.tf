# Sets global variables for this Terraform project.

variable app_name {
  default = "sit722task92d"
}

variable resource_group_name {
  default = "flixtube.azurecr.io"
}

variable location {
  default = "eastus"
}

variable kubernetes_version {    
  default = "1.29.2"
}