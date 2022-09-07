
$NetworkPath = "L:\"

try {

    $connectTestResult = Test-NetConnection -ComputerName balancefiles.file.core.windows.net -Port 445
    if ($connectTestResult.TcpTestSucceeded) {
        # Save the password so the drive will persist on reboot
        cmd.exe /C "cmdkey /add:`"cpramcompany.file.core.windows.net`" /user:`"localhost\cpramcompany`" /pass:`"kAVjElFygwmS4T7Bw+z/xaiDk5cei5n4ZoYGVQO3DietLpRZNOKa3YiDJHIloIfnE7p42/robKRO+AStuuNEPg==`""
        # Mount the drive
        New-PSDrive -Name L -PSProvider FileSystem -Root "cpramcompany.file.core.windows.net\company" -Persist
    }

} catch {

    $ErrMsg = $_.Exception.Message
    Write-Host $ErrMsg
    exit 1

}