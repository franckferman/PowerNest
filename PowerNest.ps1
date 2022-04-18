function main
{
$host.ui.RawUI.WindowTitle="PowerNest - Franck FERMAN"
Clear-Host
Write-Host ""
Write-Host "                             "
Write-Host "                *********    " -ForegroundColor red
Write-Host "              ************   " -ForegroundColor red
Write-Host "             ****            " -ForegroundColor yellow
Write-Host "            ****             " -ForegroundColor yellow
Write-Host "            ***      ********" -ForegroundColor blue
Write-Host "            ***      ********" -ForegroundColor blue
Write-Host "            ****         ****" -ForegroundColor yellow
Write-Host "             ****       **** " -ForegroundColor yellow
Write-Host "              *************  " -ForegroundColor green
Write-Host "                *********    " -ForegroundColor green
Write-Host "                             "
Write-Host ""
Write-Host ""
Write-Host "Hello dear " -NoNewline;Write-Host "$env:UserName " -NoNewline -ForegroundColor green;Write-Host "and welcome to "-NoNewLine;Write-Host "PowerNest"-NonewLine -ForegroundColor green;Write-Host "."
Write-Host ""
Write-Host "1 - Hey Google."
Write-Host "2 - Schedule an alarm."
Write-Host ""
Write-Host "9 - Quit the program." -ForegroundColor darkred
Write-Host ""

[int]$userChoice=Read-Host "Your choice"
    switch($userChoice)
    {
        1{Hey_Google}
        2{Schedule_Alarm}

        9{Write-Host "`nOngoing action: " -NoNewLine;Write-Host "Exit of the program in progress.`n" -ForegroundColor darkred;pause;$host.ui.RawUI.WindowTitle=$DefaultWindowTitle;exit}
        default{Write-Host "`nInfo: " -NoNewLine;Write-Host "An unexpected error was caused. In most cases, it is an error made by the user, so take the time to answer the questions correctly." -ForegroundColor red;Write-Host "`nOngoing action: " -NoNewLine;Write-Host "Go back to the main menu.`n" -ForegroundColor red;pause;main}
    }

}

function Hey_Google
{
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak('Hey Google')
Write-Host ""
pause
main
}

function Schedule_Alarm
{
$time=Read-Host "At what time would you like to schedule an alarm (for example, 10AM, or 10PM, or in 60 minutes)?"
$date=Read-Host "When do you want to schedule an alarm (for example, tomorrow, or every day, or Tuesday July 16 2022)?"

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("Hey Google")
Start-Sleep -Seconds 1
$speak.Speak("Schedule an alarm $date at $time")
Write-Host ""
pause
main
}

main
