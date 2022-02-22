# You might want to comment out and use local backend for sake of speed.
# But if you clear out the .terraspace-cache the local terraform.tfstate is lost.
# Using s3 backend so wont lose the terraform.tfstate.
terraform {
  backend "s3" {
    bucket         = "<%= expansion('terraform-state-:ACCOUNT-:REGION-:ENV') %>"
    key            = "<%= expansion(':REGION/:ENV/:BUILD_DIR/terraform.tfstate') %>"
    region         = "<%= expansion(':REGION') %>"
    encrypt        = true
    dynamodb_table = "terraform_locks"
  }
}
