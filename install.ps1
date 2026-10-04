#Requires -Version 5.1
<#
.SYNOPSIS
  Installs ftb-ai-crew (Cursor skills + knowledge) into the current repo.
  Uses GitHub ZIP (no git clone) so PowerShell does not choke on git stderr.

.EXAMPLE
  irm https://raw.githubusercontent.com/YamiKnigth/ftb-ai-crew/main/install-oasis.ps1 | iex
#>

param(
  [string]$Target = "",
  [string]$RepoSlug = "YamiKnigth/ftb-ai-crew",
  [string]$Ref = "main"
)

$ErrorActionPreference = "Continue"

if (-not $Target) { $Target = (Get-Location).Path }
if (-not (Test-Path -LiteralPath $Target)) { throw "Target path does not exist: $Target" }
$Target = (Resolve-Path -LiteralPath $Target).Path

function Copy-Tree([string]$From, [string]$To) {
  if (-not (Test-Path -LiteralPath $From)) { return }
  New-Item -ItemType Directory -Force -Path $To | Out-Null
  Copy-Item -Path (Join-Path $From '*') -Destination $To -Recurse -Force
}

$work = Join-Path ([IO.Path]::GetTempPath()) ("ftb-ai-crew-" + [guid]::NewGuid().ToString('n'))
$zip = Join-Path $work "repo.zip"
$extract = Join-Path $work "extract"
New-Item -ItemType Directory -Force -Path $work, $extract | Out-Null

try {
  $zipUrl = "https://codeload.github.com/$RepoSlug/zip/refs/heads/$Ref"
  Write-Host "Downloading $zipUrl ..."
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  Invoke-WebRequest -Uri $zipUrl -OutFile $zip -UseBasicParsing

  Write-Host "Extracting ..."
  Expand-Archive -LiteralPath $zip -DestinationPath $extract -Force

  $src = Get-ChildItem -LiteralPath $extract -Directory | Select-Object -First 1
  if (-not $src) { throw "Zip extracted but no root folder found." }
  $root = $src.FullName

  if (-not (Test-Path -LiteralPath (Join-Path $root '.cursor\skills'))) {
    throw "Downloaded archive is missing .cursor/skills"
  }

  Write-Host "Installing into: $Target"
  Copy-Tree (Join-Path $root '.cursor\skills') (Join-Path $Target '.cursor\skills')
  Copy-Tree (Join-Path $root '.cursor\rules') (Join-Path $Target '.cursor\rules')
  Copy-Tree (Join-Path $root 'resources\knowledge') (Join-Path $Target 'resources\knowledge')
  Copy-Tree (Join-Path $root 'resources\docs') (Join-Path $Target 'resources\docs')

  Copy-Item -Force (Join-Path $root 'AGENTS.md') (Join-Path $Target 'AGENTS.ftb-ai-crew.md')
  New-Item -ItemType Directory -Force -Path (Join-Path $Target 'plans') | Out-Null
  if (-not (Test-Path (Join-Path $Target 'plans\.gitkeep'))) {
    Set-Content -Path (Join-Path $Target 'plans\.gitkeep') -Value ''
  }

  @"
# FTB AI Crew (installed)

Installed from: https://github.com/$RepoSlug ($Ref)

- Skills: `.cursor/skills/ftb-quest-crew`, `ftb-quest-format`, `ftb-server-suite`
- Knowledge: `resources/knowledge/questcraft/`, `resources/docs/`
- Plans: `plans/`
- Notes: `AGENTS.ftb-ai-crew.md`

In Cursor: "Usa ftb-quest-crew: analiza este modpack y recomienda mods para misiones"
"@ | Set-Content -Path (Join-Path $Target 'FTB-AI-CREW.md') -Encoding UTF8

  Write-Host ""
  $crewRefs = Join-Path $Target '.cursor\skills\ftb-quest-crew\references'
if (-not (Test-Path -LiteralPath $crewRefs)) {
  throw "Install incomplete: missing $crewRefs"
}
$refCount = (Get-ChildItem -LiteralPath $crewRefs -File).Count
Write-Host ""
Write-Host "Done. Installed into $Target"
Write-Host "ftb-quest-crew references bundled: $refCount files"
}
finally {
  if (Test-Path -LiteralPath $work) {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
  }
}