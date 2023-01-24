# terraform-documentdb
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_docdb_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/resources/docdb_cluster) | resource |
| [aws_docdb_cluster_instance.this](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/resources/docdb_cluster_instance) | resource |
| [aws_docdb_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/resources/docdb_subnet_group) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/resources/security_group_rule) | resource |
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/resources/ssm_parameter) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_subnets.this](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/data-sources/subnets) | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/4.51.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | This parameter does not apply to Amazon DocumentDB. Amazon DocumentDB does not perform minor version upgrades regardless of the value set (see docs) | `bool` | `true` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for. | `number` | `5` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | Cria um identificador de cluster exclusivo começando com o prefixo especificado | `string` | `""` | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | A value that indicates whether the DB cluster has deletion protection enabled. | `bool` | `false` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The name of the database engine to be used for this DB cluster. Defaults to docdb. Valid Values: docdb | `string` | `"docdb"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The database engine version. Updating this argument results in an outage. | `string` | `"4.0.0"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance class to use. For details on CPU and memory, see Scaling for DocDB Instances. | `string` | `"db.t3.medium"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of DB instances to create in the cluster | `number` | `3` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. When specifying kms\_key\_id, storage\_encrypted needs to be set to true | `string` | `""` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Username for the master DB user | `string` | `"administrator"` | no |
| <a name="input_port"></a> [port](#input\_port) | The days to retain backups for. | `number` | `27017` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter | `string` | `"02:00-05:00"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | The weekly time range during which system maintenance can occur, in (UTC) e.g., wed:04:00-wed:04:30 | `string` | `"Mon:00:00-Mon:02:00"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. | `bool` | `false` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot | `string` | `""` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | `""` | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->