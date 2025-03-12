<#
.SYNOPSIS
A PowerShell Interface for Google Nest — Enhancing Accessibility and Convenience.

.DESCRIPTION
Interact with your Google Nest directly from PowerShell. 
Perform various actions like making specific requests, saying "Hey Google", scheduling alarms, changing the voice of Google Assistant, and more — all without speaking.

.EXAMPLE
PS C:\> Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process; .\PowerNest.ps1
PS C:\> .\PowerNest.ps1

.NOTES
Author   : Franck FERMAN
Version  : 1.0.0
License  : GNU AGPLv3
GitHub   : https://github.com/franckferman/

.LINK
https://github.com/franckferman/PowerNest
#>


[CmdletBinding()]
param (
    [switch]$Help
)


$host.ui.RawUI.WindowTitle = "PowerNest - Control Your Google Nest"


function Show-Help {
    [CmdletBinding()]
    <#
    .SYNOPSIS
    Displays help information for PowerNest, an interactive PowerShell script for controlling Google Nest devices.

    .DESCRIPTION
    PowerNest is an interactive PowerShell script that allows you to control Google Nest devices with PowerShell commands — without voice. It provides a user-friendly menu to interact with various Google Assistant functionalities (alarms, commands, voice, etc.).

    .EXAMPLE
    PS > .\PowerNest.ps1

    .LINK
    https://github.com/franckferman/PowerNest
    #>
    param()

    $helpText = @"
==============================================
                PowerNest - Help
==============================================

📜 DESCRIPTION:
PowerNest lets you control your Google Nest directly from PowerShell.
No need to speak — simply type and interact via a graphical menu.

💻 USAGE:
Just run the script to start interacting with Google Assistant.

🧭 Example to Run the Script:
----------------------------------------------
PS > Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
PS > .\PowerNest.ps1
----------------------------------------------

⚠️ NOTE:
The first command temporarily sets the execution policy to Unrestricted for the current PowerShell session only.
Always review scripts before executing them to ensure security and integrity.

🔗 RESOURCES & UPDATES:
Visit the GitHub repository for updates, examples, and documentation:
https://github.com/franckferman/PowerNest

📧 CONTACT:
Author: Franck FERMAN
Email:  contact@franckferman.fr

==============================================
"@
    Write-Host $helpText
    Exit-Program
}


function Ask-YesOrNo {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [string]$Title,

        [Parameter(Mandatory = $true)]
        [string]$Message
    )

    $choiceYes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Yes"
    $choiceNo = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "No"
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($choiceYes, $choiceNo)
    $result = $host.ui.PromptForChoice($Title, $Message, $options, 0)

    return $result
}


function Exit-Program {
    $host.ui.RawUI.WindowTitle = "PowerShell"
    Write-Host ""
    exit
}


function Handle-InvalidOption {
    Write-Host "`nInvalid option selected. Please try again." -ForegroundColor Red
    Start-Sleep -Seconds 1
    main
}


function main {
    [CmdletBinding()]
    param ()

    $host.ui.RawUI.WindowTitle = "PowerNest - Control Your Google Nest"
    Clear-Host

    Write-Host ""
    Write-Host "                *********    " -ForegroundColor Red
    Write-Host "              ************   " -ForegroundColor Red
    Write-Host "             ****            " -ForegroundColor Yellow
    Write-Host "            ****             " -ForegroundColor Yellow
    Write-Host "            ***      ********" -ForegroundColor Blue
    Write-Host "            ***      ********" -ForegroundColor Blue
    Write-Host "            ****         ****" -ForegroundColor Yellow
    Write-Host "             ****       **** " -ForegroundColor Yellow
    Write-Host "              *************  " -ForegroundColor Green
    Write-Host "                *********    " -ForegroundColor Green
    Write-Host ""

    Write-Host ""
    Write-Host "Hello dearest " -NoNewline
    Write-Host "$env:UserName " -NoNewline -ForegroundColor Green
    Write-Host "and welcome to " -NoNewLine
    Write-Host "PowerNest" -NonewLine -ForegroundColor Green
    Write-Host ""

    Write-Host ""
    Write-Host "========== MAIN MENU ==========" -ForegroundColor Cyan
    Write-Host " 1 - Specific request"
    Write-Host " 2 - Hey Google"
    Write-Host ""
    Write-Host " 3 - Schedule an alarm"
    Write-Host ""
    Write-Host " 10 - Change the voice of your assistant"
    Write-Host " 42 - Random funny feature"
    Write-Host ""
    Write-Host " 0 - Exit program"
    Write-Host "===============================" -ForegroundColor Cyan
    Write-Host ""

    [int]$userChoice = Read-Host "Your choice"

    switch ($userChoice) {
        1  { Invoke-SpecificRequest }
        2  { Invoke-HeyGoogle }
        3  { Invoke-ScheduleAlarm }
        10 { Invoke-ChangeVoice }
        42 { Invoke-FunnyFeature }
        0  { Exit-Program }
        default { Handle-InvalidOption }
    }
}


function Invoke-SpecificRequest {
    [CmdletBinding()]
    param ()

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "       Send a Custom Request to Google     " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host ""

    $User_Input = Read-Host "What message would you like to send to Google Assistant"

    if ([string]::IsNullOrWhiteSpace($User_Input)) {
        Write-Host ""
        Write-Host "You must enter a valid request. Please try again." -ForegroundColor Yellow
        Write-Host ""
        Pause
        main
        return
    }

    if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
        Add-Type -AssemblyName System.Speech
    }

    try {
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

        $speak.SpeakAsync('Hey Google') | Out-Null
        Start-Sleep -Seconds 1
        $speak.SpeakAsync($User_Input) | Out-Null

        Write-Host ""
        Write-Host "Your request has been successfully sent to Google Assistant:" -ForegroundColor Green
        Write-Host ""
        Write-Host "$User_Input" -ForegroundColor Yellow
        Write-Host ""
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while sending your request." -ForegroundColor Red
        Write-Host "Error details: $($_.Exception.Message)" -ForegroundColor DarkGray
        Write-Host ""
    }

    Pause
    main
}


function Invoke-HeyGoogle {
    [CmdletBinding()]
    param ()

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "         Initiate Google Interaction      " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host ""

    if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
        Add-Type -AssemblyName System.Speech
    }

    try {
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

        $speak.SpeakAsync('Hey Google') | Out-Null

        Write-Host "Google Assistant has been invoked successfully." -ForegroundColor Green
        Write-Host ""
        Write-Host "You can now continue interacting vocally with your device." -ForegroundColor Yellow
        Write-Host ""
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while trying to initiate interaction with Google." -ForegroundColor Red
        Write-Host "Error details: $($_.Exception.Message)" -ForegroundColor DarkGray
        Write-Host ""
    }

    Pause
    main
}


function Invoke-ScheduleAlarm {
    [CmdletBinding()]
    param ()

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "            Schedule an Alarm             " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host ""

    $time = Read-Host "Please specify the time (e.g., 10AM, 10PM, or in 60 minutes)"

    $date = Read-Host "Please specify the date (e.g., tomorrow, every day, or specific date like 'July 16 2022')"

    if ([string]::IsNullOrWhiteSpace($time) -or [string]::IsNullOrWhiteSpace($date)) {
        Write-Host ""
        Write-Host "Both time and date are required to set an alarm. Please try again." -ForegroundColor Yellow
        Write-Host ""
        Pause
        main
        return
    }

    if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
        Add-Type -AssemblyName System.Speech
    }

    try {
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

        $speak.SpeakAsync('Hey Google') | Out-Null
        Start-Sleep -Seconds 1
        $speak.SpeakAsync("Schedule an alarm for $date at $time") | Out-Null

        Write-Host ""
        Write-Host "Your alarm for $date at $time has been successfully scheduled via Google Assistant." -ForegroundColor Green
        Write-Host ""
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while trying to schedule the alarm." -ForegroundColor Red
        Write-Host "Error details: $($_.Exception.Message)" -ForegroundColor DarkGray
        Write-Host ""
    }

    Pause
    main
}


function Invoke-ChangeVoice {
    [CmdletBinding()]
    param ()

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "         Change Google Assistant's Voice  " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan

    try {
        if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
            Add-Type -AssemblyName System.Speech
        }

        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

        $speak.SpeakAsync("Hey Google") | Out-Null
        Start-Sleep -Seconds 1
        $speak.SpeakAsync("Change your voice.") | Out-Null

        $result = Ask-YesOrNo -Title "Voice Change Confirmation" -Message "Do you confirm changing Google Assistant's voice?"

        switch ($result) {
            0 {
                $speak.SpeakAsync("Yes.") | Out-Null
                Write-Host ""
                Write-Host "Voice change command has been sent." -ForegroundColor Green
                Write-Host ""
            }
            1 {
                $speak.SpeakAsync("No.") | Out-Null
                Write-Host ""
                Write-Host "Voice change command has been canceled." -ForegroundColor Yellow
                Write-Host ""
            }
            default {
                Write-Host ""
                Write-Host "An unexpected error occurred. Please try again." -ForegroundColor Red
                Write-Host ""
            }
        }
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while trying to communicate with Google Assistant." -ForegroundColor Red
        Write-Host "Error details: $($_.Exception.Message)" -ForegroundColor DarkGray
        Write-Host ""
    }

    Pause
    main
}


function Get-CryptoRandomIndex {
    param (
        [Parameter(Mandatory = $true)]
        [int]$MaxValue
    )

    $bytes = New-Object 'System.Byte[]' 4
    [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
    $randomInt = [BitConverter]::ToUInt32($bytes, 0)
    return $randomInt % $MaxValue
}


function Invoke-FunnyFeature {
    [CmdletBinding()]
    param ()

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "           Google Assistant Easter Egg     " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan

    $CommandsList = @(
        "Wubba lubba dub dub.",
        "What sound does a unicorn make?",
        "Self destruct.",
        "Sing a Christmas song.",
        "Show me the money.",
        "Up, up, down, down, left, right, B, A.",
        "Get Schwifty."
    )

    $Index = Get-CryptoRandomIndex -MaxValue $CommandsList.Count
    $Command = $CommandsList[$Index]

    try {
        if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
            Add-Type -AssemblyName System.Speech
        }

        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.SpeakAsync("Hey Google") | Out-Null
        Start-Sleep -Seconds 1
        $speak.SpeakAsync($Command) | Out-Null

        Write-Host ""
        Write-Host "Funny command sent to Google Assistant." -ForegroundColor Green
        Write-Host ""
        Write-Host "Command: $Command" -ForegroundColor Yellow
        Write-Host ""
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while processing the funny feature." -ForegroundColor Red
        Write-Host "Error details: $($_.Exception.Message)" -ForegroundColor DarkGray
        Write-Host ""
    }

    Pause
    main
}


if ($Help) {
    Show-Help
    return
} else {
    main
}
