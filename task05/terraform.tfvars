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
    name     = "cmaz-tkdmv90y-mod5-asp-01"
    os       = "Windows"
    sku_name = "S1"

  },

  asp2 = {
    name     = "cmaz-tkdmv90y-mod5-asp-02"
    os       = "Windows"
    sku_name = "S1"
  }
}


app1_name = "cmaz-tkdmv90y-mod5-app-01"
app2_name = "cmaz-tkdmv90y-mod5-app-02"

ip_restriction = [
  {
    name       = "allow-ip"
    priority   = 100
    action     = "Allow"
    ip_address = "18.153.146.156/32"
  },
  {
    name        = "allow-tm"
    priority    = 200
    action      = "Allow"
    service_tag = "AzureTrafficManager"
  }
]

tm          = "cmaz-tkdmv90y-mod5-traf"
tm_method   = "Performance"
tm_dns_name = "tm-dns-config-name"

tm_endpoints = {
  wsp1 = {
    name = "wsp1-endpoint"
    #target_resource_id = module.wsp1.id
    weight = 100
  }

  wsp2 = {
    name = "wsp2-endpoint"
    #target_resource_id = module.wsp2.id
    weight = 100
  }
}

