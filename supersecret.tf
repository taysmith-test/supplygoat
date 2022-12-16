data "aws_kms_secrets" "example" {
  secret {
    name    = "master_password"
    payload = "well-of-course-it-is-secret"

    context = {
      foo = "bar"
    }
  }

  secret {
    # ... potentially other configuration ...
    name    = "master_password2"
    payload = "tay-adf983fadfsadf"
  }
}

resource "aws_rds_cluster" "example" {
  # ... other configuration ...
  master_password = data.aws_kms_secrets.example.plaintext["master_password"]
  master_username = data.aws_kms_secrets.example.plaintext["master_password2"]
}
