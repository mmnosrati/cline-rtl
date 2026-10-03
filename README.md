# Cline RTL Pro

Community-maintained RTL layout patch for Cline's VS Code WebView.

> This project changes layout direction only. It does not install or change fonts.

## Features
- Interactive Windows launcher (`launcher.bat` / `launcher.ps1`)
- Linux launcher (`launcher.sh`)
- Automatic discovery of common VS Code extension directories
- Timestamped backups and safe restore/uninstall
- Idempotent CSS patch markers
- Code blocks remain left-to-right
- GitHub and Telegram links in launchers

## Quick start

### Windows
Run `windows/launcher.bat` or launch `windows/launcher.ps1` from PowerShell.

### Linux
Run:
```bash
chmod +x linux/launcher.sh
./linux/launcher.sh
```

The installer patches matching Cline CSS bundles under common VS Code extension roots. Review the detected path before confirming.

## Recovery
Use **Restore latest backup** from the launcher menu. For complete removal, choose **Uninstall patch**. Backups are retained after restore unless explicitly removed.

## Supported locations
- VS Code: `~/.vscode/extensions`
- VS Code Insiders: `~/.vscode-insiders/extensions`
- VSCodium: `~/.vscode-oss/extensions`, `~/.vscode/extensions`
- Remote Linux: `~/.vscode-server/extensions`, `~/.vscode-server-insiders/extensions`

Extension layouts change between releases, so detection is best-effort. Close VS Code before patching and restart it afterward.

## Developer
- GitHub: https://github.com/mmnosrati
- Telegram: https://t.me/mmn_dev

## License
MIT
