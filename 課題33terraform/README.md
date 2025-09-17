> ⚠️ 注意: 初回実行時、`terraform.tfvars` を作成し、`allowed_ssh_cidr` を自分の固定IPに設定してください。  
> 現在、学習用ダミー値 `"127.0.0.1/32"` が default に設定されています。必ず本番用に書き換えてください。  
> また、S3 バケットと DynamoDB テーブルは事前に作成してください。  
> 本テンプレートは学習用です。本番環境では RDS パスワードを直接渡さず、Secrets Manager または SSM Parameter Store を使用してください。

必須: terraform.tfvars を作成し allowed_ssh_cidr を自分の固定IP (例: x.x.x.x/32) に設定してから terraform を実行してください。設定しないと EC2 の作成で validation エラーになります。

事前にS3バケット「tf-aws-study-terraform-tfstate」とDynamoDBテーブル「terraform-lock」を作成してください。
例：aws s3 mb s3://tf-aws-study-terraform-tfstate --region ap-northeast-1
例：aws dynamodb create-table --table-name terraform-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST --region ap-northeast-1

このテンプレートは学習用でありRDSパスワードを変数「rds_password」で管理しています。
本番運用ではRDSパスワードは「AWS Secrets Manager」または「SSM Parameter Store」に保管してください。
学習用に直接変数を渡す場合は、決してリポジトリや「tfvars」をコミットしないでください。
「tfvars」を使う場合は「.gitignore」に「*.tfvars」を追加してください。
参考: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html
