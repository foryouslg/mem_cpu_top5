#!/bin/bash

# 输出文件
output_file="top5_memory_processes.log"

# 创建或清空输出文件
: > $output_file

while true; do
    # 获取当前时间
    current_time=$(date "+%Y-%m-%d %H:%M:%S")

    # 获取内存占用最高的前5个进程
    top_processes=$(ps aux --sort=-%mem | awk 'NR==1 || NR<=6 {print $0}')

    # 将结果追加写入输出文件
    {
        echo "Top 5 memory-consuming processes as of $current_time"
        echo "---------------------------------------------------"
        echo "$top_processes"
        echo
    } >> $output_file

    echo "Recorded top 5 memory-consuming processes at $current_time."

    # 等待1秒
    sleep 1
done
