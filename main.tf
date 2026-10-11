resource "google_dataproc_metastore_database_iam_binding" "dataproc_metastore_database_iam_bindings" {
  for_each = var.dataproc_metastore_database_iam_bindings

  database   = each.value.database
  members    = each.value.members
  role       = each.value.role
  service_id = each.value.service_id
  location   = each.value.location
  project    = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

