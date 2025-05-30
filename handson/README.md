# Handson モジュール 概要説明書

## 目的
- 公開用WEB APIを動作させるためのAWS Lambdaリソースを構築する

## 期待すること
- Lambda関数がHTTPS経由でアクセス可能であること（Lambda Function URLsを利用する）
- Lambda関数の実行ログがCloudWatch Logsに記録されること
- 適切なIAMロールとポリシーが設定されること
- ハンズオン用の簡単なLambda関数のコードを同梱する

## 禁止事項
- VPCを新規作成してはいけない
- API Gatewayは利用しない
- デプロイメントパイプラインを含めてはいけない
- 既存のセキュリティグループやサブネットを変更してはいけない


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.12.1 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | = 2.7.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 5.97.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.7.1 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.97.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_lambda_function.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/lambda_function) | resource |
| [aws_lambda_function_url.main](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/resources/lambda_function_url) | resource |
| [archive_file.lambda_zip](https://registry.terraform.io/providers/hashicorp/archive/2.7.1/docs/data-sources/file) | data source |
| [aws_iam_role.lambda_role](https://registry.terraform.io/providers/hashicorp/aws/5.97.0/docs/data-sources/iam_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | 環境名 | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | プロジェクト名 | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
