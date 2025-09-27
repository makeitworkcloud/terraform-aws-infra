data "sops_file" "secret_vars" {
  source_file = "${path.module}/secrets/secrets.yaml"
}

locals {
  admin_users = toset(["svc-terraform-admin"])
  s3_buckets = toset([
    "makeitwork.cloud",
    "onion.makeitwork.cloud",
    "tf-repos",
    "mitw-tf-aws-infra"
  ])
}