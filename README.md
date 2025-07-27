# Cursor IDE Manager for Ubuntu

Simple, automated installer/updater/remover for [Cursor IDE](https://cursor.sh) on Ubuntu Linux.

---

## ✨ Features

- ✅ Install Cursor IDE system-wide
- ♻️ Update to a new version easily
- ❌ Uninstall completely
- 📁 Installs `.desktop` launcher and icon
- 🔧 Installs `libfuse2` if missing
- 🧠 No manual file picking – fully automated

---

## 🚀 One-Line Installation

To run the script directly:

```bash
bash <(curl -sSL https://raw.githubusercontent.com/paulorcvieira/cursor-ide-installer/main/cursor-ide-manager.sh)
````

---

## 📦 Manual Use

1. Clone the repository:

```bash
git clone https://github.com/paulorcvieira/cursor-ide-installer.git
cd cursor-ide-installer
chmod +x cursor-ide-manager.sh
./cursor-ide-manager.sh
```

2. Follow the prompt to **install**, **update**, or **remove** Cursor IDE.

---

## 📁 What This Script Does

| Item                                     | Purpose        |
| ---------------------------------------- | -------------- |
| `/opt/cursor.AppImage`                   | Main binary    |
| `/opt/cursor.png`                        | App icon       |
| `/usr/share/applications/cursor.desktop` | App launcher   |
| `/usr/local/bin/cursor`                  | CLI shortcut   |
| Adds to `~/.bashrc` or `~/.zshrc`        | `cursor` alias |

---

## 📝 License

Licensed under the [MIT License](LICENSE).
