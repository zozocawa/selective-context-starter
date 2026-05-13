# Selective Context Starter — Interactive Setup
# Run this after cloning: .\setup.ps1

Write-Host "`n=== Selective Context Setup ===`n" -ForegroundColor Cyan

# Get project name
$projectName = Read-Host "What is your project name?"
if ([string]::IsNullOrWhiteSpace($projectName)) {
    $projectName = "My Project"
    Write-Host "  Using default: $projectName" -ForegroundColor Yellow
}

# Get domains
Write-Host "`nEnter your main domains (e.g., API UI Auth Deploy)."
Write-Host "These will appear as rows in your AGENTS.md map." -ForegroundColor Gray
$domainsInput = Read-Host "Domains (comma-separated)"
$domains = @()
if (![string]::IsNullOrWhiteSpace($domainsInput)) {
    $domains = $domainsInput -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
}

Write-Host "`nSetting up..." -ForegroundColor Cyan

# Files to update with project name
$projectFiles = @(
    "AGENTS.md",
    "docs/spec/PROJECT_SPEC.md",
    "docs/spec/PROJECT_STATE.md",
    "docs/templates/PROJECT_SPEC.md",
    "docs/templates/PROJECT_STATE.md",
    "docs/templates/AGENTS.md"
)

# Replace [Project Name] placeholders
foreach ($file in $projectFiles) {
    $path = Join-Path -Path $PSScriptRoot -ChildPath $file
    if (Test-Path $path) {
        $content = Get-Content -Path $path -Raw
        $content = $content -replace '\[Project Name\]', $projectName
        Set-Content -Path $path -Value $content -NoNewline
        Write-Host "  Updated $file" -ForegroundColor Green
    }
}

# Replace domain placeholders in AGENTS.md
if ($domains.Count -gt 0) {
    $agentsPath = Join-Path -Path $PSScriptRoot -ChildPath "AGENTS.md"
    if (Test-Path $agentsPath) {
        $content = Get-Content -Path $agentsPath -Raw
        $rows = @()
        foreach ($domain in $domains) {
            $filePath = "path/to/$($domain.ToLower().Replace(' ', '-')).md"
            $rows += "| $filePath | Working on $domain |"
        }
        $content = $content -replace '\| `path/to/domain-a\.md` \| Working on \[Domain A\] \|.*?\n(\| `path/to/domain-b)', "| `$1"
        $content = $content -replace '\| `path/to/domain-a\.md` \| Working on \[Domain A\] \|', $rows[0]
        $content = $content -replace '\[Domain A\]', $domains[0]
        if ($rows.Count -gt 1) {
            for ($i = 1; $i -lt $rows.Count; $i++) {
                $content = $content -replace "\| `path/to/domain-[a-z]\.md` \| Working on \[$([char](96 + $i))\] \|", 
                    $rows[$i] -replace "\[Domain [A-Z]\]", $domains[$i]
            }
        }
        Set-Content -Path $agentsPath -Value $content -NoNewline
        Write-Host "  Updated AGENTS.md with domains" -ForegroundColor Green
    }
}

# Summary
Write-Host "`n=== Setup Complete ===" -ForegroundColor Cyan
Write-Host "  Project: $projectName" -ForegroundColor White
if ($domains.Count -gt 0) {
    Write-Host "  Domains: $($domains -join ', ')" -ForegroundColor White
}
Write-Host "`nYour context system is ready." -ForegroundColor Green
Write-Host "Open this project in your AI tool and start working.`n" -ForegroundColor Green
