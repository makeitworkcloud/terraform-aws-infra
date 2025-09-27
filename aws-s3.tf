import {
  for_each = local.s3_buckets
  to       = aws_s3_bucket.managed[each.value]
  id       = each.value
}

resource "aws_s3_bucket" "managed" {
  for_each = local.s3_buckets
  bucket   = each.value

  tags = {
    ManagedBy = "Terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}