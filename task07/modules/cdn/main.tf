resource "azurerm_user_assigned_identity" "identity" {
  location            = var.location
  name                = var.name_identity
  resource_group_name = var.rg_name
}

resource "azurerm_cdn_frontdoor_profile" "fd_profile" {
  name                     = var.fd_name
  resource_group_name      = var.rg_name
  sku_name                 = var.sku
  response_timeout_seconds = 16


  tags = var.tag
}

resource "azurerm_cdn_frontdoor_endpoint" "endpoint" {
  name                     = var.endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd_profile.id
  #tags                     = var.tag
}

resource "azurerm_cdn_frontdoor_origin_group" "origin_gr" {
  #tags                     = var.tag
  name                     = var.or_gr_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd_profile.id
  /*   session_affinity_enabled = true

  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = 10

  health_probe {
    interval_in_seconds = 240
    path                = "/healthProbe"
    protocol            = "Https"
    request_type        = "HEAD"
  }
 */
  load_balancing {
    additional_latency_in_milliseconds = 0
    sample_size                        = 16
    successful_samples_required        = 3
  }
}

resource "azurerm_cdn_frontdoor_origin" "df_origin" {
  name                          = var.fd_origin_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_gr.id
  enabled                       = true
  #tags                           = var.tag
  certificate_name_check_enabled = false

  host_name          = var.primary_blob_host
  http_port          = 80
  https_port         = 443
  origin_host_header = var.primary_blob_host
  priority           = 1
  weight             = 1
}

resource "azurerm_cdn_frontdoor_route" "my_route" {
  name                          = var.fd_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_gr.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.df_origin.id]
  #cdn_frontdoor_rule_set_ids    = [azurerm_cdn_frontdoor_rule_set.example.id]
  enabled = true

  #forwarding_protocol    = "HttpsOnly"
  https_redirect_enabled = true
  patterns_to_match      = ["/*"]
  supported_protocols    = ["Http", "Https"]

  #cdn_frontdoor_custom_domain_ids = [azurerm_cdn_frontdoor_custom_domain.contoso.id, azurerm_cdn_frontdoor_custom_domain.fabrikam.id]
  #link_to_default_domain          = false

  /* cache {
    query_string_caching_behavior = "IgnoreSpecifiedQueryStrings"
    query_strings                 = ["account", "settings"]
    compression_enabled           = true
    content_types_to_compress     = ["text/html", "text/javascript", "text/xml"]
  } */
  #tags = var.tag
}


