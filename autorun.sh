#!/bin/bash

# 获取脚本所在的目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 1. 进入 auto-iptv 目录并执行 run.sh
echo "执行 auto-iptv/run.sh..."
(cd "$SCRIPT_DIR/../auto-iptv" && ./run.sh)

# 检查上一步是否成功，成功后执行下一步
if [ $? -eq 0 ]; then
    # 2. 执行当前目录下的 push.sh
    echo "执行当前目录下的 push.sh..."
(cd "../TVBOX" && ./push.sh)
    echo "脚本执行完成。"
else
    echo "执行 auto-iptv/run.sh 失败，无法执行 push.sh。"
fi

