module "documentdb" {
    source = "../"
    vpc_id = "vpc-0f2c8cea76017c2d9"
    cluster_identifier = "mongo-terraform"
    skip_final_snapshot = true
    region = "us-east-1"
}