provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_iam_user" "backups" {
  name = "backups_user"
}

resource "aws_iam_access_key" "backups" {
  user = "${aws_iam_user.backups.name}"
}

data "aws_iam_policy_document" "backups" {
  statement {
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_prefix}*"
    ]
  }
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_prefix}*/*"
    ]
  }
}

resource "aws_iam_group" "backups" {
  name = "backups"
}

resource "aws_iam_group_policy" "backups" {
  name = "backups_group_policy"
  group = "${aws_iam_group.backups.id}"
  policy = "${data.aws_iam_policy_document.backups.json}"
}

resource "aws_iam_group_membership" "backups" {
  name = "backups"
  group = "${aws_iam_group.backups.name}"
  users = [
    "${aws_iam_user.backups.name}"
  ]
}

resource "aws_s3_bucket" "backups" {
  bucket_prefix = "${var.bucket_prefix}"
  acl = "private"
}
