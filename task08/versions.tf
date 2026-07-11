terraform {
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.110.0, < 4.0.0"
    }

    archive = {
      source  = "hashicorp/archive"
      version = ">= 2.4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }

    time = {
      source  = "hashicorp/time"
      version = ">= 0.11.0"
    }

    kubectl = {
      source  = "alekc/kubectl"
      version = "= 2.0.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
  }
}
