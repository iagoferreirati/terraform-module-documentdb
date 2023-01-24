resource "random_password" "this" {
  length  = 16
  special = false
}

locals {
  final_snapshot_identifier = var.cluster_identifier
  security_group            = var.cluster_identifier
  default_tags = {
    Name          = var.cluster_identifier
    ProvisionedBy = "Terraform"
  }
  tags = merge(local.default_tags, var.tags)
}

resource "aws_docdb_cluster" "this" {
  cluster_identifier              = var.cluster_identifier
  engine                          = var.engine
  engine_version                  = var.engine_version
  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = var.preferred_backup_window
  preferred_maintenance_window    = var.preferred_maintenance_window
  final_snapshot_identifier       = local.final_snapshot_identifier
  skip_final_snapshot             = var.skip_final_snapshot
  deletion_protection             = var.deletion_protection
  apply_immediately               = var.apply_immediately
  storage_encrypted               = var.storage_encrypted
  kms_key_id                      = var.kms_key_id
  port                            = var.port
  snapshot_identifier             = var.snapshot_identifier
  vpc_security_group_ids          = [aws_security_group.this.id]
  db_subnet_group_name            = aws_docdb_subnet_group.this.name
  master_username                 = var.master_username
  master_password                 = random_password.this.result
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  tags                            = local.tags
}

resource "aws_docdb_cluster_instance" "this" {
  count                      = var.instance_count
  identifier                 = "${var.cluster_identifier}-${count.index + 1}"
  cluster_identifier         = aws_docdb_cluster.this.id
  apply_immediately          = var.apply_immediately
  instance_class             = var.instance_class
  engine                     = var.engine
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  tags                       = local.tags
}

resource "aws_ssm_parameter" "this" {
  name        = var.cluster_identifier
  description = "Password DocumentDB"
  type        = "SecureString"
  value       = random_password.this.result
  tags        = local.tags
}

resource "aws_docdb_subnet_group" "this" {
  name       = var.cluster_identifier
  subnet_ids = data.aws_subnets.this.ids
  tags       = local.tags
}

data "aws_subnets" "this" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_vpc" "this" {
  id = var.vpc_id
}