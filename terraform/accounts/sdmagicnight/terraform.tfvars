terragrunt = {
  # Configure Terragrunt to use DynamoDB for locking
  lock {
    backend = "dynamodb"
    config {
      state_file_id = "${path_relative_to_include()}"
      aws_region = "us-west-2"
      aws_profile = "sdmagicnight"
    }
  }

  # Configure Terragrunt to automatically store tfstate files in an S3 bucket
  remote_state {
    backend = "s3"
    config {
      encrypt = "true"
      bucket = "sdmagicnight-tf-state"
      key = "${path_relative_to_include()}/terraform.tfstate"
      region = "us-west-2"
      profile = "sdmagicnight"
    }
  }
}
