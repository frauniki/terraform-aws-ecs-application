variable "name" {
  description = "The name of the service"
  type        = string
}

variable "environment" {
  description = "The environment of the service"
  type        = string
}

variable "listen_port" {
  description = "The port the service listens on"
  type        = number
}

variable "health_check_path" {
  description = "The path for the health check"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "The interval for the health check"
  type        = string
  default     = "traffic-port"
}

variable "health_check_interval" {
  description = "The interval for the health check"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "The timeout for the health check"
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "The healthy threshold for the health check"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "The unhealthy threshold for the health check"
  type        = number
  default     = 2
}

variable "iam_policy_arns" {
  description = "The ARNs of the IAM policies to attach to the role"
  type        = list(string)
  default     = []
}

variable "zone_id" {
  description = "The ID of the Route53 zone"
  type        = string
}

variable "domain_name" {
  description = "The domain name"
  type        = string
}

variable "domain_alias_name" {
  description = "The domain alias name"
  type        = string
}

variable "domain_alias_zone_id" {
  description = "The domain alias zone ID"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "ingress_source_security_group_id" {
  description = "The ingress rules"
  type        = string
}

variable "load_balancer_listener_arn" {
  description = "The ARN of the load balancer listener"
  type        = string
}

variable "load_balancer_certificate_arn" {
  description = "The ARN of the load balancer certificate"
  type        = string
  default     = null
}

variable "load_balancer_listener_rule_priority" {
  description = "The priority of the load balancer listener rule"
  type        = number
}

variable "env_vars" {
  description = "The environment variables to set in the task definition"
  type        = map(string)
  default     = null
}

variable "secret_env_vars" {
  description = "The secret string to store in the secrets manager"
  type        = map(string)
  default     = null
}

variable "cloudwatch_logs_retention_in_days" {
  description = "The number of days to retain the logs"
  type        = number
  default     = 7
}

variable "cloudwatch_log_subscription_filter_role_arn" {
  description = "The ARN of the role for the cloudwatch log subscription filter"
  type        = string
}

variable "cloudwatch_log_subscription_filter_destination_arn" {
  description = "The ARN of the destination for the cloudwatch log subscription filter"
  type        = string
}
