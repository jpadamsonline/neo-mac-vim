#!/bin/bash
set -e

APP_NAME="NeoMacVim"
APP_DIR="$(pwd)/$APP_NAME.app"

echo "Creating $APP_NAME.app bundle..."

rm -rf "$APP_DIR"
mkdir -p "$APP_DIR/Contents/MacOS"
mkdir -p "$APP_DIR/Contents/Resources"

# Launcher script
cat > "$APP_DIR/Contents/MacOS/nvim-qt-launcher" << 'EOF'
#!/bin/bash

for path in /usr/local/bin/nvim-qt /opt/homebrew/bin/nvim-qt; do
  if [ -x "$path" ]; then
    exec "$path" "$@"
    exit 0
  fi
done

echo "Error: nvim-qt executable not found in /usr/local/bin or /opt/homebrew/bin."
echo "Please install nvim-qt or edit the launcher script to point to the correct location."
exit 1
EOF

chmod +x "$APP_DIR/Contents/MacOS/nvim-qt-launcher"

# Info.plist
cat > "$APP_DIR/Contents/Info.plist" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
 <dict>
   <key>CFBundleName</key>
   <string>$APP_NAME</string>
   <key>CFBundleDisplayName</key>
   <string>$APP_NAME</string>
   <key>CFBundleExecutable</key>
   <string>nvim-qt-launcher</string>
   <key>CFBundleIdentifier</key>
   <string>com.jpadamsonline.$APP_NAME</string>
   <key>CFBundleVersion</key>
   <string>1.0</string>
   <key>CFBundlePackageType</key>
   <string>APPL</string>
   <key>CFBundleIconFile</key>
   <string>icon.icns</string>
 </dict>
</plist>
EOF

# Copy icon file
cp ../resources/icon.icns "$APP_DIR/Contents/Resources/"

echo "$APP_NAME.app bundle created at $APP_DIR"
