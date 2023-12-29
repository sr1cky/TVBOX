#!/bin/bash

# 获取当前时间
current_time=$(date "+%Y-%m-%d %H:%M:%S")

# 在日志中记录带有时间的信息
echo "$current_time - 开始执行脚本" >> /path/to/your/logfile.log

# 获取脚本所在的目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 进入到脚本所在的目录
cd "$SCRIPT_DIR"

# 1. 进入 auto-iptv 目录并执行 run.sh
echo "执行 auto-iptv/run.sh..."
(cd "$SCRIPT_DIR/../auto-iptv" && ./run.sh)

# 检查上一步是否成功，成功后执行下一步
if [ $? -eq 0 ]; then
    # 2. 执行当前目录下的 push.sh

    # 设置 GitHub 用户名和仓库信息
    USERNAME="sr1cky"
    REPO_NAME="TVBOX"

    # 设置本地文件路径和目标分支
    LOCAL_FILE="IPTV-tvbox.txt"
    BRANCH_NAME="main"

    # 添加文件到本地仓库
    git add .

    # 提交更改
    git commit -m "Add file: $LOCAL_FILE"

    # 推送到 GitHub
    git push origin $BRANCH_NAME

    echo "文件推送完成。"

else
    echo "执行 auto-iptv/run.sh 失败，无法执行 push.sh。"
fi

echo "$current_time - 脚本执行完成" >> /path/to/your/logfile.log

