resource "aws_route53_record" "this" {
  zone_id = var.zone_id

  name = var.domain_name
  type = "A"

  alias {
    name                   = var.domain_alias_name
    zone_id                = var.domain_alias_zone_id
    evaluate_target_health = true
  }
}
