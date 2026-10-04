#Requires -Version 5.1
<#
.SYNOPSIS
  Installs ftb-ai-crew (Cursor skills + knowledge) into the current or target repo.

.EXAMPLE
  # From your other repo (one command, after this repo is on GitHub main):
  irm https://raw.githubusercontent.com/YamiKnigth/ftb-ai-crew/main/install.ps1 | iex

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File install.ps1 -Target .
#>

param(
  [string]$Target = "",
  [string]$RepoUrl = "https://github.com/YamiKnigth/ftb-ai-crew.git",
  [string]$Ref = "main"
)

$ErrorActionPreference = "Stop"

if (-not $Target) {
  $Target = (Get-Location).Path
}
$Target = (Resolve-Path -LiteralPath $Target).Path

function Copy-Tree {
  param([string]$From, [string]$To)
  if (-not (Test-Path -LiteralPath $From)) { return }
  New-Item -ItemType Directory -Force -Path $To | Out-Null
  Copy-Item -Path (Join-Path $From "*") -Destination $To -Recurse -Force
}

$temp = Join-Path ([System.IO.Path]::GetTempPath()) ("ftb-ai-crew-" + [guid]::NewGuid().ToString("n"))
New-Item -ItemType Directory -Force -Path $temp | Out-Null

try {
  Write-Host "Cloning $RepoUrl ($Ref) ..."
  git clone --depth 1 --branch $Ref $RepoUrl $temp 2>&1 | Out-Host

  Write-Host "Installing into: $Target"

  # Skills
  Copy-Tree -From (Join-Path $temp ".cursor\skills") -To (Join-Path $Target ".cursor\skills")

  # Rules (merge)
  Copy-Tree -From (Join-Path $temp ".cursor\rules") -To (Join-Path $Target ".cursor\rules")

  # Knowledge + docs used by skills
  Copy-Tree -From (Join-Path $temp "resources\knowledge") -To (Join-Path $Target "resources\knowledge")
  Copy-Tree -From (Join-Path $temp "resources\docs") -To (Join-Path $Target "resources\docs")

  # Crew entrypoints
  Copy-Item -Force (Join-Path $temp "AGENTS.md") (Join-Path $Target "AGENTS.ftb-ai-crew.md")
  New-Item -ItemType Directory -Force -Path (Join-Path $Target "plans") | Out-Null
  if (-not (Test-Path (Join-Path $Target "plans\.gitkeep"))) {
    Set-Content -Path (Join-Path $Target "plans\.gitkeep") -Value ""
  }

  # Pointer README for the host repo
  $pointer = @"
# FTB AI Crew (installed)

Skills installed from: $RepoUrl ($Ref)

- Skills: `.cursor/skills/ftb-quest-crew`, `ftb-quest-format`, `ftb-server-suite`
- Knowledge: `resources/knowledge/questcraft/`, `resources/docs/`
- Plans output: `plans/`
- Crew notes: `AGENTS.ftb-ai-crew.md`

In Cursor, ask e.g. "Usa ftb-quest-crew: analiza este modpack y recomienda mods para misiones".
"@
  Set-Content -Path (Join-Path $Target "FTB-AI-CREW.md") -Value $pointer -Encoding UTF8

  Write-Host ""
  Write-Host "Done."
  Write-Host "Installed Cursor skills + FTB knowledge into:"
  Write-Host "  $Target"
  Write-Host "Open that repo in Cursor and start a chat with ftb-quest-crew."
}
finally {
  if (Test-Path -LiteralPath $temp) {
    Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue
  }
}