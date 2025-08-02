#!/bin/bash

set -e

APPIMAGE_URL="https://downloads.cursor.com/production/54c27320fab08c9f5dd5873f07fca101f7a3e076/linux/x64/Cursor-1.3.9-x86_64.AppImage"
ICON_URL="https://raw.githubusercontent.com/paulorcvieira/cursor-ide-installer/main/cursor.png"

APPIMAGE_PATH="/opt/cursor.AppImage"
ICON_PATH="/opt/cursor.png"
DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"
BIN_PATH="/usr/local/bin/cursor"

check_fuse() {
  if ! dpkg -s libfuse2 &>/dev/null; then
    echo "Installing libfuse2..."
    sudo apt-get update
    sudo apt-get install -y libfuse2
  fi
}

install_cursor() {
  echo "🔧 Installing Cursor IDE..."

  check_fuse

  echo "📥 Downloading AppImage..."
  sudo curl -L "$APPIMAGE_URL" -o "$APPIMAGE_PATH"
  sudo chmod +x "$APPIMAGE_PATH"

  echo "🎨 Downloading icon..."
  sudo curl -L "$ICON_URL" -o "$ICON_PATH"

  echo "🖥️ Creating desktop entry..."
  sudo bash -c "cat > $DESKTOP_ENTRY_PATH" <<EOF
[Desktop Entry]
Name=Cursor IDE
Exec=$APPIMAGE_PATH --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;IDE;
Terminal=false
StartupNotify=true
EOF

  echo "🔗 Creating /usr/local/bin/cursor..."
  sudo bash -c "cat > $BIN_PATH" <<EOF
#!/bin/bash
$APPIMAGE_PATH --no-sandbox "\$@" > /dev/null 2>&1 &
EOF
  sudo chmod +x "$BIN_PATH"

  echo "✅ Cursor IDE installed successfully."
}

update_cursor() {
  echo "♻️ Updating Cursor IDE..."

  if [ -f "$APPIMAGE_PATH" ]; then
    sudo rm "$APPIMAGE_PATH"
  fi

  install_cursor
  echo "✅ Update complete."
}

remove_cursor() {
  echo "❌ Removing Cursor IDE..."

  sudo rm -f "$APPIMAGE_PATH" "$ICON_PATH" "$DESKTOP_ENTRY_PATH" "$BIN_PATH"
  echo "✅ Cursor IDE removed."
}

main() {
  echo "=== Cursor IDE Manager ==="
  echo "1) Install"
  echo "2) Update"
  echo "3) Remove"
  echo "4) Exit"
  echo "--------------------------"
  read -rp "Choose an option [1-4]: " choice

  case "$choice" in
    1) install_cursor ;;
    2) update_cursor ;;
    3) remove_cursor ;;
    4) echo "Bye!"; exit 0 ;;
    *) echo "Invalid option."; exit 1 ;;
  esac
}

main
