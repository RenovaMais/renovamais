$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$source = Get-Content -Raw (Join-Path $projectRoot 'index.html')

function Assert-Match {
    param([string]$Pattern, [string]$Message)
    if ($source -notmatch $Pattern) { throw $Message }
}

function Assert-NotMatch {
    param([string]$Pattern, [string]$Message)
    if ($source -match $Pattern) { throw $Message }
}

Assert-Match '<html lang="pt-PT" data-theme="light">' 'The document must start in light theme.'
Assert-Match "const savedTheme = localStorage\.getItem\('rm_theme'\);" 'The saved theme must be read explicitly.'
Assert-Match "let isDark = savedTheme === 'dark';" 'A missing preference must fall back to light.'
Assert-Match '--nav-bg:rgba\(13,13,13,.76\)' 'Dark theme navigation background variable is missing.'
Assert-Match '--nav-bg:rgba\(245,244,240,.84\)' 'Light theme navigation background variable is missing.'
Assert-Match 'background:var\(--nav-bg\)' 'The navigation strip must use its theme variable.'
Assert-Match 'color:var\(--nav-text\)' 'Navigation text must use its theme variable.'
Assert-Match 'background:var\(--nav-control-bg\)' 'Navigation controls must use their theme variable.'
Assert-NotMatch '#navbar\{[^}]*background:rgba\(13,13,13,.76\)' 'The navigation strip is still hard-coded dark.'

Write-Output 'Theme and navbar assertions passed.'
