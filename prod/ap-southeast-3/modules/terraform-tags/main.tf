resource "time_static" "timestamp" {}


locals {
  tags = {
    "Created_Date" : replace(time_static.timestamp.rfc3339, ":", "-"),
    "Automation" : var.automation,
    "Application" : var.application,
    "Service" : var.service,
    "Repo_URL" : var.repo_url,
    "Repo_Path" : var.repo_path,
    "Business_Unit" : var.business_unit,
    "Environment"  : var.environment,
    "map-migrated" : var.map-migrated,
  }

}
