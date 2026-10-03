$ErrorActionPreference = 'Stop'
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$PatchFile = Join-Path $ProjectRoot 'core\rtl-patch.css'
$MarkerStart = '/* Cline RTL:START */'
$MarkerEnd = '/* Cline RTL:END */'

function Write-Title {
    Clear-Host
    Write-Host ''
    Write-Host '  Cline RTL' -ForegroundColor Cyan
    Write-Host '  RTL layout patch manager' -ForegroundColor DarkCyan
    Write-Host ''
    Write-Host '  GitHub  https://github.com/mmnosrati' -ForegroundColor Blue
    Write-Host '  Telegram https://t.me/mmn_dev' -ForegroundColor Magenta
    Write-Host ''
    Write-Host '  -----------------------------------------------' -ForegroundColor DarkGray
}
function Get-ClineCss {
    $roots = @(
        "$HOME\.vscode\extensions",
        "$HOME\.vscode-insiders\extensions",
        "$HOME\.vscode-oss\extensions",
        "$env:LOCALAPPDATA\Programs\Microsoft VS Code\resources\app\extensions",
        "$env:USERPROFILE\.vscode\extensions"
    ) | Select-Object -Unique
    $results = @()
    foreach ($root in $roots) {
        if (Test-Path $root) {
            $results += Get-ChildItem -LiteralPath $root -Recurse -File -Filter '*.css' -ErrorAction SilentlyContinue |
                Where-Object {
                    $_.FullName -match '[\\/](webview-ui|webview)[\\/].*[\\/]assets[\\/]' -and
                    $_.FullName -match '(?i)cline|claude-dev|saoudrizwan'
                }
        }
    }
    $results | Sort-Object FullName -Unique
}
function Get-BackupPath([string]$Path) { return "$Path.Cline RTL.bak" }
function Install-Patch {
    $cssFiles = @(Get-ClineCss)
    if ($cssFiles.Count -eq 0) {
        Write-Host 'No matching Cline CSS bundles were found.' -ForegroundColor Red
        Write-Host 'Install/update Cline, then try again. You can also inspect extension folders manually.' -ForegroundColor Yellow
        return
    }
    Write-Host 'Detected CSS bundle(s):' -ForegroundColor Yellow
    for ($i=0; $i -lt $cssFiles.Count; $i++) { Write-Host " [$($i+1)] $($cssFiles[$i].FullName)" }
    $confirm = Read-Host 'Patch all listed files? [y/N]'
    if ($confirm -notmatch '^(y|yes)$') { return }
    $patch = Get-Content -LiteralPath $PatchFile -Raw
    foreach ($file in $cssFiles) {
        $content = Get-Content -LiteralPath $file.FullName -Raw
        if ($content.Contains($MarkerStart)) {
            $content = [regex]::Replace($content, '(?s)/\* Cline RTL:START \*/.*?/\* Cline RTL:END \*/', '')
        } else {
            $backup = Get-BackupPath $file.FullName
            if (-not (Test-Path $backup)) { Copy-Item -LiteralPath $file.FullName -Destination $backup }
        }
        Add-Content -LiteralPath $file.FullName -Value "`n$patch" -Encoding UTF8
        Write-Host "Patched: $($file.Name)" -ForegroundColor Green
    }
    Write-Host 'Done. Restart VS Code to apply changes.' -ForegroundColor Green
}
function Restore-Backups {
    $roots = @("$HOME\.vscode\extensions", "$HOME\.vscode-insiders\extensions", "$HOME\.vscode-oss\extensions")
    $backups = @()
    foreach ($root in $roots) {
        if (Test-Path $root) { $backups += Get-ChildItem -LiteralPath $root -Recurse -File -Filter '*.css.Cline RTL.bak' -ErrorAction SilentlyContinue }
    }
    if ($backups.Count -eq 0) { Write-Host 'No backups found.' -ForegroundColor Yellow; return }
    foreach ($backup in $backups) {
        $target = $backup.FullName -replace '\.Cline RTL\.bak$',''
        Copy-Item -LiteralPath $backup.FullName -Destination $target -Force
        Write-Host "Restored: $target" -ForegroundColor Green
    }
}
while ($true) {
    Write-Title
    Write-Host '  [1] Install / repair RTL patch' -ForegroundColor Green
    Write-Host '  [2] Restore original CSS from backups' -ForegroundColor Yellow
    Write-Host '  [3] Open GitHub profile' -ForegroundColor Blue
    Write-Host '  [4] Open Telegram' -ForegroundColor Magenta
    Write-Host '  [Q] Quit' -ForegroundColor Gray
    Write-Host ''
    $choice = Read-Host '  Select an option'
    switch ($choice.ToLowerInvariant()) {
        '1' { Install-Patch; Read-Host 'Press Enter to return to menu' | Out-Null }
        '2' { Restore-Backups; Read-Host 'Press Enter to return to menu' | Out-Null }
        '3' { Start-Process 'https://github.com/mmnosrati' }
        '4' { Start-Process 'https://t.me/mmn_dev' }
        'q' { break }
        default { Write-Host 'Invalid option.' -ForegroundColor Red; Start-Sleep -Milliseconds 700 }
    }
}
