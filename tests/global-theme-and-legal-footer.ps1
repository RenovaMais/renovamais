$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$pages = @(
    'index.html',
    'remodelacao-casas-de-banho.html',
    'privacy.html',
    'obrigado.html',
    '404.html'
)

function Assert-Contains {
    param([string]$Source, [string]$Needle, [string]$Message)
    if (-not $Source.Contains($Needle)) { throw $Message }
}

foreach ($page in $pages) {
    $source = Get-Content -Raw (Join-Path $projectRoot $page)

    Assert-Contains $source '<html lang="pt-PT" data-theme="light">' "$page must start in light theme."
    Assert-Contains $source '<script src="/js/site-theme.js" defer></script>' "$page must load the shared theme script."
    Assert-Contains $source 'data-theme-toggle' "$page must expose a theme toggle."
    if ($source.Contains('rm_landing_theme')) { throw "$page still uses the legacy landing theme key." }

    Assert-Contains $source '<link rel="stylesheet" href="/css/legal-footer.css">' "$page must load the shared legal footer stylesheet."
    Assert-Contains $source 'class="legal-footer' "$page must include the legal footer."
    Assert-Contains $source '122856-PAR' "$page must show the IMPIC alvará number."
    Assert-Contains $source '519467892' "$page must show the NIF/NIPC."
    Assert-Contains $source 'Rua Cesário Verde, n.º 2, cave direita, 2745-741 Massamá' "$page must show the registered address."
    Assert-Contains $source 'href="tel:+351912911081"' "$page must include the telephone link."
    Assert-Contains $source 'href="mailto:geral@renovamais.pt"' "$page must include the email link."
    Assert-Contains $source 'https://www.impic.pt/' "$page must link to the official IMPIC domain."
    Assert-Contains $source 'https://www.livroreclamacoes.pt/' "$page must link to the official complaints platform."
    Assert-Contains $source 'href="/privacy"' "$page must link to the privacy policy."
}

$themeScriptPath = Join-Path $projectRoot 'js/site-theme.js'
if (-not (Test-Path $themeScriptPath)) { throw 'The shared theme script is missing.' }
$themeScript = Get-Content -Raw $themeScriptPath
Assert-Contains $themeScript "localStorage.getItem('rm_theme')" 'The shared script must restore rm_theme.'
Assert-Contains $themeScript "localStorage.setItem('rm_theme'" 'The shared script must persist rm_theme.'

$footerStylePath = Join-Path $projectRoot 'css/legal-footer.css'
if (-not (Test-Path $footerStylePath)) { throw 'The shared legal footer stylesheet is missing.' }

Write-Output "Global theme and legal footer assertions passed for $($pages.Count) pages."
