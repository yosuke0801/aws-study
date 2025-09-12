# tfstateをS3で管理するためのバックエンド
terraform {
  backend "s3" {
    bucket = "tf-aws-study-s3bucket-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
