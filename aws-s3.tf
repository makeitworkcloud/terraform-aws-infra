resource "aws_s3_bucket" "private" {
  for_each = local.s3_private_buckets
  bucket   = each.value

  tags = {
    ManagedBy = "Terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket" "public" {
  for_each = local.s3_public_buckets
  bucket   = each.value

  tags = {
    ManagedBy = "Terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}

moved {
  from = aws_s3_bucket.private["makeitwork.cloud"]
  to   = aws_s3_bucket.web["makeitwork.cloud"]
}
moved {
  from = aws_s3_bucket.private["onion.makeitwork.cloud"]
  to   = aws_s3_bucket.web["onion.makeitwork.cloud"]
}

resource "aws_s3_bucket" "web" {
  for_each = local.s3_web_buckets
  bucket   = each.value

  tags = {
    ManagedBy = "Terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}