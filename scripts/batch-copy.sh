#!/usr/bin/env bash

# 严格按照原始脚本逻辑： 是目标文件夹，shift 之后剩下的都是文件
destination=$1
shift

mkdir -p "$destination"

# 使用 "$@" 获取剩余的所有文件，用双引号包裹变量防止空格截断
for file in "$@"
do
    cp "$file" "$destination/"
done
