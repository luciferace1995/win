#!/bin/bash

# URL để tải xuống Windows Server ISO
ISO_URL="http://example.com/path/to/windows_server.iso"
ISO_PATH="/path/to/your/windows_server.iso"
GRUB_PARTITION="(hdX,gptY)" # Thay đổi với vị trí phân vùng chứa file ISO

# Tải xuống Windows Server ISO
echo "Đang tải xuống Windows Server ISO..."
wget "$ISO_URL" -O "$ISO_PATH"

# Kiểm tra sự tồn tại của file ISO
if [ ! -f "$ISO_PATH" ]; then
    echo "File ISO không tồn tại tại đường dẫn: $ISO_PATH"
    exit 1
fi

# Thêm mục menu GRUB
echo "Thêm mục menu GRUB..."
cat << EOF | sudo tee -a /etc/grub.d/40_custom
menuentry "Windows Server Installer" {
    set isofile="$ISO_PATH"
    loopback loop $GRUB_PARTITION$isofile
    ntldr /bootmgr
}
EOF

# Cập nhật GRUB
echo "Cập nhật GRUB..."
sudo update-grub

# Thông báo hoàn tất
echo "Hoàn tất! Bạn có thể khởi động lại và chọn 'Windows Server Installer' từ menu GRUB."
