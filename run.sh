#!/bin/bash

# Định nghĩa URL của script từ GitHub
SCRIPT_URL="https://raw.githubusercontent.com/luciferace1995/win/main/settup.sh"

# Định nghĩa tên file cho script được tải xuống
SCRIPT_NAME="setup.sh"

# Tải xuống script
echo "Đang tải xuống script từ $SCRIPT_URL..."
wget "$SCRIPT_URL" -O "$SCRIPT_NAME" || curl -o "$SCRIPT_NAME" "$SCRIPT_URL"

# Kiểm tra xem việc tải xuống có thành công không
if [ ! -f "$SCRIPT_NAME" ]; then
    echo "Không thể tải xuống script."
    exit 1
fi

# Cấp quyền thực thi cho script
echo "Cấp quyền thực thi cho script..."
chmod +x "$SCRIPT_NAME"

# Chạy script
echo "Chạy script..."
./"$SCRIPT_NAME"
