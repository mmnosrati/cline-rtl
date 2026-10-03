# Cline RTL

**افزودن چیدمان راست‌به‌چپ (RTL) به Cline در VS Code، برای ویندوز و لینوکس**

[فارسی](#راهنمای-فارسی) · [English](#english) · [GitHub](https://github.com/mmnosrati) · [Telegram](https://t.me/mmn_dev)

---

# راهنمای فارسی

## Cline RTL چیست؟

**Cline RTL** یک وصلهٔ CSS سبک برای بهبود چیدمان راست‌به‌چپ (RTL) در رابط وب‌ویوی افزونهٔ Cline داخل VS Code است. این پروژه تلاش می‌کند متن‌های معمولی و ورودی‌ها را راست‌چین کند و در عین حال بلوک‌های کد را چپ‌به‌راست (LTR) نگه دارد.

> این ابزار فقط جهت چیدمان و تراز متن را تغییر می‌دهد؛ فونت نصب نمی‌کند و فونت‌های فعلی شما را تغییر نمی‌دهد.

## امکانات

- راه‌انداز تعاملی برای Windows و Linux
- شناسایی خودکار فایل‌های CSS در مسیرهای رایج افزونه‌های VS Code
- تهیهٔ نسخهٔ پشتیبان پیش از اعمال تغییرات
- امکان بازگردانی CSS اصلی از نسخهٔ پشتیبان
- امکان اجرای دوباره برای تعمیر یا به‌روزرسانی وصله
- نگه‌داشتن بلوک‌های کد در جهت چپ‌به‌راست
- نمایش مسیر فایل‌های شناسایی‌شده و گرفتن تأیید پیش از تغییر آن‌ها
- بدون نیاز به نصب فونت یا وابستگی پایتونی

## پیش از شروع

1. پروژه را از GitHub دانلود کنید یا فایل ZIP آن را از حالت فشرده خارج کنید.
2. در صورت امکان، VS Code را ببندید.
3. پیش از تأیید نصب، مسیر فایل‌های CSS شناسایی‌شده را بررسی کنید.
4. پس از نصب یا بازگردانی، VS Code را دوباره اجرا کنید.

شناسایی مسیرها به ساختار نسخهٔ نصب‌شدهٔ Cline وابسته است؛ بنابراین ممکن است در برخی نسخه‌ها فایل مناسبی پیدا نشود.

## راهنمای نصب در Windows

1. پوشهٔ پروژه را از حالت فشرده خارج کنید.
2. وارد پوشهٔ `windows` شوید.
3. فایل `launcher.bat` را اجرا کنید. در صورت نیاز می‌توانید `launcher.ps1` را از PowerShell اجرا کنید.
4. در منوی برنامه، گزینهٔ **Install / repair RTL patch** را انتخاب کنید.
5. مسیرهای CSS نمایش‌داده‌شده را بررسی کنید و فقط در صورت درست بودن آن‌ها، با واردکردن `y` ادامه دهید.
6. پس از پایان کار، VS Code را مجدداً اجرا کنید.

اگر اجرای فایل PowerShell به‌دلیل سیاست اجرای اسکریپت‌ها محدود شده است، ابتدا روش اجرای `launcher.bat` را امتحان کنید. سیاست امنیتی PowerShell را بدون نیاز تغییر ندهید.

## راهنمای نصب در Linux

از ریشهٔ پوشهٔ پروژه، ترمینال را باز کنید و این دستورات را اجرا کنید:

```bash
chmod +x linux/launcher.sh
./linux/launcher.sh
```

سپس:

1. گزینهٔ **Install / repair RTL patch** را انتخاب کنید.
2. مسیرهای نمایش‌داده‌شده را بررسی کنید.
3. برای تأیید تغییر فایل‌ها، `y` وارد کنید.
4. پس از اتمام، VS Code را مجدداً اجرا کنید.

## بازگردانی تغییرات

برای بازگرداندن CSS اصلی:

1. راه‌انداز مناسب سیستم‌عامل خود را اجرا کنید.
2. گزینهٔ **Restore original CSS from backups** را انتخاب کنید.
3. پس از پایان، VS Code را مجدداً اجرا کنید.

نسخه‌های پشتیبان با پسوند `.css.Cline RTL.bak` در کنار فایل‌های اصلی ذخیره می‌شوند و بازگردانی، آن‌ها را حذف نمی‌کند. در نسخهٔ فعلی منو، گزینهٔ جداگانه‌ای با نام «Uninstall patch» وجود ندارد؛ برای برگرداندن تغییرات از گزینهٔ Restore استفاده کنید.

## مسیرهای قابل بررسی

راه‌اندازها برخی مسیرهای رایج را بررسی می‌کنند، از جمله:

- VS Code: `~/.vscode/extensions`
- VS Code Insiders: `~/.vscode-insiders/extensions`
- VSCodium: `~/.vscode-oss/extensions`
- VS Code Server در لینوکس: `~/.vscode-server/extensions`
- VS Code Server Insiders در لینوکس: `~/.vscode-server-insiders/extensions`

این فهرست کامل و تضمین‌شده نیست؛ مسیرها با توجه به سیستم‌عامل و نسخهٔ نصب‌شده ممکن است متفاوت باشند.

## عیب‌یابی

- **هیچ فایل CSS پیدا نشد:** مطمئن شوید Cline نصب شده است. ساختار پوشه‌های افزونه ممکن است با نسخهٔ شما تفاوت داشته باشد.
- **تغییرات دیده نمی‌شوند:** VS Code را کاملاً ببندید و دوباره باز کنید.
- **چیدمان یک بخش درست نیست:** این پروژه یک وصلهٔ CSS عمومی است و ممکن است با همهٔ صفحه‌ها یا نسخه‌های Cline سازگار نباشد. فایل‌های شناسایی‌شده را پیش از تأیید بررسی کنید.
- **بازگشت به حالت قبل:** گزینهٔ Restore را اجرا کنید تا نسخهٔ پشتیبان به مسیر اصلی برگردد.

## ساختار پروژه

```text
Cline RTL/
├── core/rtl-patch.css
├── windows/launcher.bat
├── windows/launcher.ps1
├── linux/launcher.sh
├── docs/RECOVERY.md
├── tests/SMOKE-TEST.md
├── CHANGELOG.md
├── LICENSE
└── README.md
```

## مشارکت و ارتباط

- GitHub: https://github.com/mmnosrati
- Telegram: https://t.me/mmn_dev

گزارش اشکال‌ها، پیشنهادها و Pull Requestها خوش‌آمدند. لطفاً در گزارش اشکال، سیستم‌عامل، نسخهٔ VS Code و نسخهٔ Cline را ذکر کنید.

## مجوز

این پروژه تحت مجوز MIT منتشر می‌شود. برای جزئیات، فایل [LICENSE](LICENSE) را ببینید.

---

# English

## What is Cline RTL?

**Cline RTL** is a lightweight CSS patch intended to improve right-to-left (RTL) layout in Cline's VS Code WebView. It right-aligns common text and input areas while keeping code blocks left-to-right (LTR).

> This tool changes layout direction and text alignment only. It does not install, bundle, or modify fonts.

## Features

- Interactive launchers for Windows and Linux
- Best-effort discovery of CSS files in common VS Code extension locations
- Automatic backups before patching
- Restore the original CSS from backups
- Re-runnable install/repair workflow
- Code blocks remain left-to-right
- Detected paths are shown for review before changes are applied
- No Python dependency or font installation required

## Before you start

1. Download the repository or extract the ZIP archive.
2. Close VS Code if practical.
3. Review the detected CSS paths before confirming the patch.
4. Restart VS Code after installing or restoring the patch.

Extension layouts vary by Cline and VS Code version, so automatic detection is best-effort and may not find a matching file in every installation.

## Windows installation

1. Extract the project folder.
2. Open the `windows` directory.
3. Run `launcher.bat`. Alternatively, run `launcher.ps1` from PowerShell.
4. Select **Install / repair RTL patch**.
5. Review the listed CSS paths. Enter `y` only if the paths look correct.
6. Restart VS Code.

If PowerShell script execution is restricted, try `launcher.bat` first. Do not change your system's execution policy unless you understand the implications.

## Linux installation

Open a terminal in the project root and run:

```bash
chmod +x linux/launcher.sh
./linux/launcher.sh
```

Then select **Install / repair RTL patch**, review the detected paths, and enter `y` to confirm. Restart VS Code when the operation completes.

## Restore the original CSS

1. Run the launcher for your operating system.
2. Select **Restore original CSS from backups**.
3. Restart VS Code.

Backups are stored beside the original CSS files with the suffix `.css.Cline RTL.bak`. Restoring does not delete the backup files. The current launcher menu does not provide a separate **Uninstall patch** option; use Restore to revert the changes.

## Locations checked

The launchers check common locations, including:

- VS Code: `~/.vscode/extensions`
- VS Code Insiders: `~/.vscode-insiders/extensions`
- VSCodium: `~/.vscode-oss/extensions`
- Linux VS Code Server: `~/.vscode-server/extensions`
- Linux VS Code Server Insiders: `~/.vscode-server-insiders/extensions`

These locations are not exhaustive. Paths vary by operating system, installation method, and application version.

## Troubleshooting

- **No CSS files found:** Confirm that Cline is installed. Its extension folder layout may differ from the patterns currently detected.
- **Changes are not visible:** Fully restart VS Code.
- **A page still looks incorrect:** This is a general-purpose CSS patch and may not fit every Cline view or release. Review the detected files before applying changes.
- **Revert the patch:** Choose Restore to copy the saved CSS backups back to their original paths.

## Project structure

```text
Cline RTL/
├── core/rtl-patch.css
├── windows/launcher.bat
├── windows/launcher.ps1
├── linux/launcher.sh
├── docs/RECOVERY.md
├── tests/SMOKE-TEST.md
├── CHANGELOG.md
├── LICENSE
└── README.md
```

## Contributing and contact

- GitHub: https://github.com/mmnosrati
- Telegram: https://t.me/mmn_dev

Bug reports, suggestions, and pull requests are welcome. When reporting an issue, include your operating system, VS Code version, and Cline version.

## License

Released under the MIT License. See [LICENSE](LICENSE) for details.
