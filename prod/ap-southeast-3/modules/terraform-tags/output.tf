output "tags" {
  description = "A map of prepared and validated non-empty tags to be used within AWS Resources"
  value       = { for k, v in local.tags : k => v if v != "" }
}
