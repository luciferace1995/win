#!/bin/bash

# Định nghĩa đường dẫn và URL của script cần tải
SCRIPT_DIR="/media/script"
SCRIPT_URL="https://raw.githubusercontent.com/luciferace1995/win/main/settup.sh"
SCRIPT_PATH="${SCRIPT_DIR}/settup.sh"

# Chuyển sang người dùng root
if [ "$EUID" -ne 0 ]; then 
  echo "Script cần được chạy với quyền root. Sử dụng 'sudo ./install_script.sh'"
  exit 1
fi

# Tạo thư mục và mount tmpfs
mkdir -p "$SCRIPT_DIR"
mount -t tmpfs -o size=1m tmpfs "$SCRIPT_DIR"

# Tải xuống và cấp quyền thực thi cho script
wget -P "$SCRIPT_DIR" "$SCRIPT_URL"
chmod +x "$SCRIPT_PATH"

# Chạy script
echo "Đang chạy script..."
bash "$SCRIPT_PATH"
