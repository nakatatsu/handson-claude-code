# Claude Code利用準備

それぞれ手動で実行してください。

## AWS

```console
# 各自の環境に合わせて設定してください
aws configure sso

# 必要なければスキップ
vi .aws/config

aws sso login
```

## GitHub

```console
# 内容を変えて入力してください
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

gh auth login
```


## Claude

```console
claude /init
```

プルリクが作られたらマージしてください。
