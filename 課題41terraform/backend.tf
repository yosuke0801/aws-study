# tfstateをS3で管理するためのバックエンド（下の#を削除すればS3で管理ができる）
terraform {
  backend "s3" {
    bucket         = "tf-aws-study-terraform-tfstate"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
  }
}
