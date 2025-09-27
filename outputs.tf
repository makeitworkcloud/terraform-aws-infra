output "admin_access_keys" {
  description = "Admin IAM user access keys"
  value = { for user, key in aws_iam_access_key.admin_key : user => {
    access_key_id     = key.id
    secret_access_key = key.secret
  } }
  sensitive = true
}