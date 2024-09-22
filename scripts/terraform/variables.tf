# Sets global variables for this Terraform project.

variable app_name {
  default = "task92d_prikshit"
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
