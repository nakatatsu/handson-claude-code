# ハンズオン用ファイルの取得

事前に空の状態でリポジトリをGithub上に作成しておいてください。

```console
# ハンズオン用ファイルを取得して展開
wget https://github.com/nakatatsu/handson-claude-code/archive/refs/tags/first-for-handson.zip
unzip first-for-handson.zip
cd handson-claude-code-first-for-handson/

# Gitリポジトリを初期化
git init

# ファイルをステージに追加
git add .

# 最初のコミットを作成
git commit -m "Initial commit"

# リモートリポジトリを追加（URLは自身のGitHubリポジトリに置き換えてください）
git remote add origin https://github.com/your-username/your-repo.git

# プッシュ（初回はmainブランチがないので明示的に指定）
git branch -M main
git push -u origin main
```