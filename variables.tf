variable "dataproc_metastore_database_iam_bindings" {
  description = <<EOT
Map of dataproc_metastore_database_iam_bindings, attributes below
Required:
    - database
    - members
    - role
    - service_id
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    database   = string
    members    = set(string)
    role       = string
    service_id = string
    location   = optional(string)
    project    = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

