locals {
  fw_name        = format("%s-fw", var.name_prefix)
  fw_rt_name     = format("%s-rt", var.name_prefix)
  fw_app_rc_name = format("%s-app-rc", var.name_prefix)
  fw_net_rc_name = format("%s-net-rc", var.name_prefix)
  fw_nat_rc_name = format("%s-nat-rc", var.name_prefix)

  app_rules = {
    allow_https = {
      source_addresses = ["10.0.0.0/16"]
      target_fqdns     = ["*.google.com"]
      port             = 443
      type             = "Https"
    }
  }
}