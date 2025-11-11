# 🌩️ AWSインフラ構築ポートフォリオ

このリポジトリでは、CloudFormation・Terraform・Ansible・GitHub Actionsを用いて  
AWS上にインフラ環境を自動構築する一連の学習内容をまとめています。

---

## 🖼️ ① インフラ構成図
![インフラ構成図](./infrastructure-diagram.png)

### 📘 内容
AWS上の基本構成（VPC / EC2 / RDS / ALB / WAF / CloudWatch）を設計。  
インターネット経由でアクセス可能なWebアプリケーション環境を構築しました。

### 💡 工夫したこと
- 最新のAWSアイコンを用いた構成図（draw.io）を使用  
- 各リソースの関連性を明確に整理（東京リージョン、1a/1c構成）  
- CloudWatchへのメトリクス連携を図示して監視まで可視化  

### 📂 関連ファイル
- `/infrastructure-diagram.drawio`
- `/infrastructure-diagram.png`

---

## 🏗️ ② CloudFormationによるインフラ環境のコード化

### 📘 内容
YAML形式でAWSリソースをコード化し、手動構築を自動化。  
EC2・VPC・SecurityGroupなどをテンプレートで再現可能にしました。

### 💡 工夫したこと
- パラメータ化による再利用性の向上  
- Outputで主要情報（EC2 IP等）を取得可能に  
- IAMポリシーの最小権限化を意識  

### 📂 関連ファイル
- `/CloudFormation.yml`

---

## 🌍 ③ Terraformによるインフラ環境のコード化

### 📘 内容
TerraformでAWSリソースをIaC化し、S3バックエンドで状態管理を実装。  

### 💡 工夫したこと
- **S3＋DynamoDB**でステート管理を実装  
- **モジュール構成**による可読性と再利用性の確保  

### 📂 関連ファイル
- `/terraform/`

---

## ⚙️ ④ GitHub Actionsを用いたCI/CD構築

### 📘 内容
GitHub Actionsを使用し、TerraformとAnsibleのCI/CDを自動化。  
mainブランチへのプッシュをトリガーに、環境構築〜デプロイが自動実行されます。

### 💡 工夫したこと
- `workflow_run`トリガーでTerraform CI → Terraform CD → Ansible CI → Ansible CDを連携  
- 動的IP対応（Terraform output → Ansible inventory自動生成）  
- SSH known_hosts登録による安全な接続  
- 構築した環境の削除用に手動専用のdestroyファイルを作成

### 📂 関連ファイル
- `.github/workflows/terraform-ci.yaml`
- `.github/workflows/terraform-cd.yaml`
- `.github/workflows/ansible-ci.yaml`
- `.github/workflows/ansible-cd.yaml`
- `.github/workflows/terraform-destroy.yaml`

---

## 🧰 ⑤ Ansibleによる構成管理と自動デプロイ

### 📘 内容
EC2へJava 21とSpring Bootアプリを自動デプロイ。  
Terraformで生成されたEC2情報をもとにAnsibleが動作します。

### 💡 工夫したこと
- `wait_for`と`sleep`を使ってEC2起動待機を実装  
- `inventory.ini`を動的生成し、最新のIPで接続  
- `nohup java -jar`でバックグラウンド実行＆ログ出力管理  

### 📂 関連ファイル
- `/ansible/playbook.yml`
- `/app/demo.jar`
