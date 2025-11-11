# AWSインフラ構築の学習記録

このリポジトリでは、CloudFormation・Terraform・Ansible・GitHub Actionsを用いて  
AWS上にインフラ環境を自動構築する一連の学習内容をまとめています。

---

## ① インフラ構成図
![インフラ構成図](./インフラ構成図.png)

### 📘 内容
AWS上の基本構成（VPC / EC2 / RDS / ALB / WAF / CloudWatch）を設計。  
インターネット経由でアクセス可能なWebアプリケーション環境を構築しました。

### 💡 工夫したこと
- 最新のAWSアイコンを用いた構成図（draw.io）を使用  
- 各リソースの関連性を明確に整理
- CloudWatchへのメトリクス連携を図示して監視まで可視化  

### 📂 関連ファイル
- [インフラ構成図.drawio](./インフラ構成図.drawio)
- [インフラ構成図.png](./インフラ構成図.png)

---

## ② CloudFormationによるインフラ環境のコード化

### 📘 内容
YAML形式でAWSリソースをコード化し、構築を自動化。  
EC2・VPC・SecurityGroupなどをテンプレートで再現可能にしました。

### 💡 工夫したこと
- パラメータ化による再利用性の向上  
- IAMポリシーの最小権限化を意識  

### 📂 関連ファイル
- [CloudFormation.yaml](./CloudFormation.yaml)

---

## ③ Terraformによるインフラ環境のコード化（IaC）

### 📘 内容
TerraformでAWSリソースをIaC化し、S3バックエンドで状態管理を実装。 
CLIからコマンドを実行してインフラを構築できるようにしました。 

### 💡 工夫したこと
- モジュール構成による可読性と再利用性の確保  
- S3リモートバックエンドで状態を一元管理

### 📂 関連ファイル
- [terraform/](./terraform/)

---

## ④ GitHub ActionsによるTerraform CI/CD

### 📘 内容
Terraformを対象にCI（plan）→CD（apply）を自動化。  
プルリクエスト時に構文チェックやテストを行い、mainブランチへのマージでAWS環境構築が自動実行されます。

### 💡 工夫したこと
- pull_requestトリガーでCIを実行し、構成エラーを検出
- pushトリガーでCDを起動し、環境を自動構築
- terraform destroyにより環境構築の削除も可能  
- workflow_dispatchにより手動実行も可能

### ⚙️ ワークフロー構成

| Workflow | トリガー | 主な内容 |
|-----------|-----------|-----------|
| Terraform CI | pull_request to main | init / fmt / validate / test / plan |
| Terraform CD | push to main | apply による再構築 |


### 📂 関連ファイル
- [.github/workflows/terraform-ci.yaml](.github/workflows/terraform-ci.yaml)
- [.github/workflows/terraform-cd.yaml](.github/workflows/terraform-cd.yaml)
- [.github/workflows/terraform-destroy.yaml](.github/workflows/terraform-destroy.yaml)

---

## ⑤ Ansibleによる構成管理とアプリ自動デプロイ

### 📘 内容
Terraformで作成されたEC2へ、Ansibleを用いてJava 21とSpring Bootアプリを自動デプロイ。  
GitHub ActionsでTerraformとAnsibleを組み合わせたパイプライン構成により

### 💡 工夫したこと
- Terraformの出力値（EC2の動的IP）を利用した動的検知
- wait_forとsleepを使ってEC2起動待機を実装  
- SSH known_hosts登録による安全な接続  
- nohup java -jarでバックグラウンド実行＆ログ出力管理  

### ⚙️ ワークフロー構成

| Workflow | トリガー | 主な内容 |
|-----------|-----------|-----------|
| Ansible CI | workflow_run (Terraform CD完了時) | 構文チェック・ドライラン |
| Ansible CD | workflow_run (Ansible CI完了時) | 実デプロイ・起動確認 |


### 📂 関連ファイル
- [.github/workflows/ansible-ci.yaml](.github/workflows/ansible-ci.yaml)
- [.github/workflows/ansible-cd.yaml](.github/workflows/ansible-cd.yaml)
- [ansible/playbook.yaml](./ansible/playbook.yaml)
