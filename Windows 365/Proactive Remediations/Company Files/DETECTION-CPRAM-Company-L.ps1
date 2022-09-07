$NetworkPath = "L:\"

try {

    If (Test-Path -Path $NetworkPath -ErrorAction Stop) {

        Write-Host "Network path is exists." -ForegroundColor Green
        exit 0

    } else {

        Write-Host "Network path is not mapped." -ForegroundColor Yellow
        exit 1
    }

} catch {

    $ErrMsg = $_.Exception.Message
    Write-Host $ErrMsg
    exit 1
    
}
