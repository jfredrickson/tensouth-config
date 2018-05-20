output "backups_user_id" {
  value = "${aws_iam_access_key.backups.id}"
}

output "backups_user_secret" {
  value = "${aws_iam_access_key.backups.secret}"
}

output "backups_s3_bucket" {
  value = "${aws_s3_bucket.backups.id}"
}
