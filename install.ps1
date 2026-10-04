#Requires -Version 5.1
<#
.SYNOPSIS
  Installs ftb-ai-crew (Cursor skills + knowledge) into the current or target repo.

.EXAMPLE
  irm https://raw.githubusercontent.com/YamiKnigth/ftb-ai-crew/main/install.ps1 | iex

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File install.ps1 -Target .
#>

param(
  [string]$Target = "",
  [string]$RepoUrl = "https://github.com/YamiKnigth/ftb-ai-crew.git",
  [string]$Ref = "main"
)

# Do NOT use Stop globally: git writes progress to stderr and PowerShell
# treats that as a terminating NativeCommandError.
$ErrorActionPreference = "Continue"

if (-not $Target) {
  $Target = (Get-Location).Path
}
if (-not (Test-Path -LiteralPath $Target)) {
  throw "Target path does not exist: $Target"
}
$Target = (Resolve-Path -LiteralPath $Target).Path

function Copy-Tree {
  param([string]$From, [string]$To)
  if (-not (Test-Path -LiteralPath $From)) { return }
  New-Item -ItemType Directory -Force -Path $To | Out-Null
  Copy-Item -Path (Join-Path $From "*") -Destination $To -Recurse -Force
}

function Invoke-Git {
  param([Parameter(ValueFromRemainingArguments = $true)][string[]]$GitArgs)
  $prev = $ErrorActionPreference
  $ErrorActionPreference = "Continue"
  try {
    & git @GitArgs 2>&1 | ForEach-Object {
      if ($_ -is [System.Management.Automation.ErrorRecord]) {
        Write-Host $_.Exception.Message
      } else {
        Write-Host $_
      }
    }
    if ($LASTEXITCODE -ne 0) {
      throw "git $($GitArgs -join ' ') failed with exit code $LASTEXITCODE"
    }
  } finally {
    $ErrorActionPreference = $prev
  }
}

$temp = Join-Path ([System.IO.Path]::GetTempPath()) ("ftb-ai-crew-" + [guid]::NewGuid().ToString("n"))
New-Item -ItemType Directory -Force -Path $temp | Out-Null

try {
  Write-Host "Cloning $RepoUrl ($Ref) ..."
  # Clone into an empty-ish folder: git wants the destination either empty or nonexistent.
  Remove-Item -LiteralPath $temp -Recurse -Force -ErrorAction SilentlyContinue
  Invoke-Git clone --depth 1 --branch $Ref $RepoUrl $temp

  if (-not (Test-Path -LiteralPath (Join-Path $temp ".cursor\skills"))) {
    throw "Clone succeeded but .cursor/skills was not found. Check branch/repo contents."
  }

  Write-Host "Installing into: $Target"

  Copy-Tree -From (Join-Path $temp ".cursor\skills") -To (Join-Path $Target ".cursor\skills")
  Copy-Tree -From (Join-Path $temp ".cursor\rules") -To (Join-Path $Target ".cursor\rules")
  Copy-Tree -From (Join-Path $temp "resources\knowledge") -To (Join-Path $Target "resources\knowledge")
  Copy-Tree -From (Join-Path $temp "resources\docs") -To (Join-Path $Target "resources\docs")

  Copy-Item -Force (Join-Path $temp "AGENTS.md") (Join-Path $Target "AGENTS.ftb-ai-crew.md")
  New-Item -ItemType Directory -Force -Path (Join-Path $Target "plans") | Out-Null
  if (-not (Test-Path (Join-Path $Target "plans\.gitkeep"))) {
    Set-Content -Path (Join-Path $Target "plans\.gitkeep") -Value ""
  }

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