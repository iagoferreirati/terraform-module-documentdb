variable "cluster_identifier" {
  type        = string
  default     = ""
  description = " Cria um identificador de cluster exclusivo começando com o prefixo especificado"
}

variable "engine" {
  type        = string
  default     = "docdb"
  description = "The name of the database engine to be used for this DB cluster. Defaults to docdb. Valid Values: docdb"
}

variable "engine_version" {
  type        = string
  default     = "4.0.0"
  description = "The database engine version. Updating this argument results in an outage."
}

variable "backup_retention_period" {
  type        = number
  default     = 5
  description = "The days to retain backups for."
}

variable "preferred_backup_window" {
  type        = string
  default     = "02:00-05:00"
  description = "The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter"
}

variable "preferred_maintenance_window" {
  type        = string
  default     = "Mon:00:00-Mon:02:00"
  description = "The weekly time range during which system maintenance can occur, in (UTC) e.g., wed:04:00-wed:04:30"
}

variable "skip_final_snapshot" {
  type        = bool
  default     = false
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted."
}


variable "deletion_protection" {
  type        = bool
  default     = false
  description = " A value that indicates whether the DB cluster has deletion protection enabled."
}

variable "apply_immediately" {
  type        = bool
  default     = true
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
}

variable "storage_encrypted" {
  type        = bool
  default     = true
  description = "Specifies whether the DB cluster is encrypted."
}

variable "kms_key_id" {
  type        = string
  default     = ""
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, storage_encrypted needs to be set to true"
}

variable "port" {
  type        = number
  default     = 27017
  description = "The days to retain backups for."
}

variable "snapshot_identifier" {
  type        = string
  default     = ""
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
}

variable "master_username" {
  type        = string
  default     = "administrator"
  description = "Username for the master DB user"
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler"
  default     = []
}

variable "instance_count" {
  type        = number
  default     = 3
  description = "Number of DB instances to create in the cluster"
}

variable "instance_class" {
  type        = string
  default     = "db.t3.medium"
  description = " The instance class to use. For details on CPU and memory, see Scaling for DocDB Instances."
}

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = true
  description = "This parameter does not apply to Amazon DocumentDB. Amazon DocumentDB does not perform minor version upgrades regardless of the value set (see docs)"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "region" {
  type = string
}