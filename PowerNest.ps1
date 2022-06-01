<#PowerNest.ps1
Author: Franck FERMAN - fferman@protonmail.ch
Description: Control your Google Nest Mini with PowerShell.
Version: 2.0
#>

function Get_Random
{
    Param
    (
        [int]$FirstValue,
        [int]$LastValue
    )

Get-Random -Minimum $FirstValue -Maximum $LastValue
}

function Ask_YesOrNo
{
    Param
    (
        [string]$title,
        [string]$message
    )

    $choiceYes=New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Yes"
    $choiceNo=New-Object System.Management.Automation.Host.ChoiceDescription "&No","No"
    $options=[System.Management.Automation.Host.ChoiceDescription[]]($choiceYes,$choiceNo)
    [int]$script:Ask_YesOrNo_Result=$host.ui.PromptForChoice($title,$message,$options,1)
}

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
Write-Host "1 - Specific request."
Write-Host "2 - Hey Google."
Write-Host "3 - Schedule an alarm."
Write-Host ""
Write-Host "10 - Change the voice of your Google Assistant."
Write-Host ""
Write-Host "42 - Randomized fun feature."
Write-Host ""
Write-Host "0 - Quit the program." -ForegroundColor darkred
Write-Host ""

[int]$userChoice=Read-Host "Your choice"
    switch($userChoice)
    {
        1{Specific_Request}
        2{Hey_Google}
        3{Schedule_Alarm}

        10{Change_Voice}

        42{Funny}

        0{Write-Host "`nOngoing action: " -NoNewLine;Write-Host "Exit of the program in progress.`n" -ForegroundColor darkred;pause;$host.ui.RawUI.WindowTitle=$DefaultWindowTitle;exit}
        default{Write-Host "`nInfo: " -NoNewLine;Write-Host "An unexpected error was caused. In most cases, it is an error made by the user, so take the time to answer the questions correctly." -ForegroundColor red;Write-Host "`nOngoing action: " -NoNewLine;Write-Host "Go back to the main menu.`n" -ForegroundColor red;pause;main}
    }

}

function Specific_Request
{
Write-Host ""
$User_Input=Read-Host "What request would you like to make to Google"

Add-Type -AssemblyName System.speech
$speak=New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak('Hey Google')
Start-Sleep -Seconds 1
$speak.Speak("$User_Input")
Write-Host ""
pause
main
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
Write-Host ""
$time=Read-Host "At what time would you like to schedule an alarm (for example, 10AM, or 10PM, or in 60 minutes)?"
$date=Read-Host "When do you want to schedule an alarm (for example, tomorrow, or every day, or Tuesday July 16 2022)?"

Add-Type -AssemblyName System.speech
$speak=New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("Hey Google")
Start-Sleep -Seconds 1
$speak.Speak("Schedule an alarm $date at $time")
Write-Host ""
pause
main
}

function Change_Voice
{
Add-Type -AssemblyName System.speech
$speak=New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("Hey Google")
Start-Sleep -Seconds 1
$speak.Speak("Change your voice.")

Ask_YesOrNo "PowerNest - MessageBox function - Franck FERMAN." "What do you want to do?"

    switch($Ask_YesOrNo_Result)
    {
    1{$speak.Speak("No.")}
    0{$speak.Speak("Yes.")}

    default{Write-Host "`nInfo: " -NoNewLine;Write-Host "An unexpected error was caused. In most cases, it is an error made by the user, so take the time to answer the questions correctly." -ForegroundColor red;Write-Host "`nOngoing action: " -NoNewLine;Write-Host "Go back to the main menu.`n" -ForegroundColor red;pause;main}
    }

    if($Ask_YesOrNo_Result -eq 1){
    Ask_YesOrNo "PowerNest - MessageBox function - Franck FERMAN." "What do you want to do?"
    switch($Ask_YesOrNo_Result)
    {
    1{$speak.Speak("No.")}
    0{$speak.Speak("Yes.")}

    default{Write-Host "`nInfo: " -NoNewLine;Write-Host "An unexpected error was caused. In most cases, it is an error made by the user, so take the time to answer the questions correctly." -ForegroundColor red;Write-Host "`nOngoing action: " -NoNewLine;Write-Host "Go back to the main menu.`n" -ForegroundColor red;pause;main}
    }
    }else{$null}

Write-Host ""
pause
main
}

function Funny
{
[array]$CommandsList=@()
[array]$CommandsList="Wubba lubba dub dub.","What sound does a unicorn make?","Self destruct.","Sing a Christmas song","Show me the money.","up, up, down, down, left, right, B, A.","Get Schwifty."

$RandomChoice=Get_Random "0" "6"
$Command=$CommandsList[$RandomChoice]

Add-Type -AssemblyName System.speech
$speak=New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("Hey Google")
Start-Sleep -Seconds 1
$speak.Speak("$Command")

Write-Host ""
pause
main
}

main
