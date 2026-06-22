resource_groups = {
  rg1 = {
    name     = "cmaz-tkdmv90y-mod5-rg-01"
    location = "East US"
  },
  rg2 = {
    name     = "cmaz-tkdmv90y-mod5-rg-02"
    location = "West US"
  },
  rg3 = {
    name     = "cmaz-tkdmv90y-mod5-rg-03"
    location = "Central US"
  }
}

tag = { Creator = "sardorxoja_tashxodjaev@epam.com" }

app_service_plans = {
  asp1 = {
    name = "cmaz-tkdmv90y-mod5-asp-01"

    sku_name = {
      tier     = "Standard"
      size     = "S1"
      capacity = 2

    }
  },
  asp2 = {
    name = "cmaz-tkdmv90y-mod5-asp-02"
    sku_name = {
      tier     = "Standard"
      size     = "S1"
      capacity = 1
    }
  },
}
