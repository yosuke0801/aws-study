事前にS3バケット「tf-aws-study-terraform-tfstate」とDynamoDBテーブル「terraform-lock」を作成してください。

実行前にterraform.tfvarsのallowed_ssh_cidrを自分の固定IPに変更してください。

このテンプレートは学習用でありRDSパスワードを変数「rds_password」で管理しています。
本番運用ではRDSパスワードは「AWS Secrets Manager」または「SSM Parameter Store」に保管してください。
学習用に直接変数を渡す場合は、決してリポジトリや「tfvars」をコミットしないでください。
「tfvars」を使う場合は「.gitignore」に「*.tfvars」を追加してください。
参考: https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html」

