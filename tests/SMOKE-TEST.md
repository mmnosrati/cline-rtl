# Manual smoke test checklist

- [ ] Launcher displays GitHub and Telegram links.
- [ ] Detection lists CSS files before patching.
- [ ] Declining confirmation makes no changes.
- [ ] First install creates a `.cline-rtl-pro.bak` backup.
- [ ] Re-running does not accumulate duplicate managed CSS blocks.
- [ ] Restore copies the backup over the patched CSS.
- [ ] Code blocks remain LTR.
