[CmdletBinding()]
param()

$projectRoot = Split-Path -Parent $PSScriptRoot
$sourceDirectory = Join-Path $projectRoot 'src'
$outputPath = Join-Path $projectRoot 'gh_scripts\SourceFiles.csx'

if (-not (Test-Path -LiteralPath $sourceDirectory -PathType Container)) {
    throw "找不到來源目錄：$sourceDirectory"
}

$header = @(
    '// 此檔案由 tools/Update-GhLoads.ps1 自動產生，請勿手動修改。'
    '// 相對路徑以 gh_scripts/ 為基準。'
)

$loadDirectives = Get-ChildItem -LiteralPath $sourceDirectory -Filter '*.cs' -File -Recurse |
    Sort-Object FullName |
    ForEach-Object {
        $relativePath = [System.IO.Path]::GetRelativePath(
            (Split-Path -Parent $outputPath),
            $_.FullName
        ).Replace('\', '/')

        "#load `"$relativePath`""
    }

$content = @($header) + @($loadDirectives)
Set-Content -LiteralPath $outputPath -Value $content -Encoding utf8

Write-Output "已更新 $outputPath，共載入 $($loadDirectives.Count) 個 C# 檔案。"
