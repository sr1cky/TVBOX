#!/bin/bash

# 设置 GitHub 用户名和仓库信息
USERNAME="sr1cky"
REPO_NAME="TVBOX"

# 设置本地文件路径和目标分支
LOCAL_FILE="IPTV-tvbox.txt"
BRANCH_NAME="main"

# 添加文件到本地仓库
git add $LOCAL_FILE

# 提交更改
git commit -m "Add file: $LOCAL_FILE"

# 推送到 GitHub
git push origin $BRANCH_NAME

echo "文件推送完成。"

