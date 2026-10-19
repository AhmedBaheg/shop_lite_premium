
$projectPath = $PSScriptRoot
$arbPath = Join-Path $projectPath "lib/l10n"

$lastState = ""

Write-Host "Watching ARB files..."
Write-Host "Press Ctrl+C to stop."

while ($true) {
    $files = Get-ChildItem $arbPath -Filter "*.arb"

    $currentState = (
        $files |
        Sort-Object Name |
        ForEach-Object {
            "$($_.Name):$($_.LastWriteTimeUtc.Ticks):$($_.Length)"
        }
    ) -join "|"

    if ($lastState -ne "" -and $currentState -ne $lastState) {
        Write-Host "ARB change detected. Generating..."

        Push-Location $projectPath
        flutter gen-l10n
        Pop-Location

        Write-Host "Localization generation finished."
    }

    $lastState = $currentState
    Start-Sleep -Seconds 1
}
