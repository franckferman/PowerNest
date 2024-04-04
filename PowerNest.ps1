<#
.SYNOPSIS
PowerNest: A PowerShell Interface for Google Nest, Enhancing Accessibility and Convenience.

.DESCRIPTION
This script allows you to interact with your Google Nest using PowerShell. Perform various actions like making specific requests, saying "Hey Google", scheduling alarms, changing the voice of Google Assistant, and more.

.EXAMPLE
PS > Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process; .\PowerNest.ps1

.NOTES
Author: Franck FERMAN
Contact: fferman@protonmail.ch
Version: 1.0.0

.LINK
Repository URL: https://github.com/franckferman/PowerNest
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
    PowerNest is an interactive PowerShell script that allows you to control Google Nest devices with voice commands. To use PowerNest, simply run the script, and you will be prompted with an interactive menu to choose from various voice command options.

    .EXAMPLE
    PS > .\PowerNest.ps1

    .LINK
    https://github.com/franckferman/PowerNest
    #>
    param()

    $helpText = @"
PowerNest Help Menu
--------------------------------
To run the PowerNest, there are no command-line parameters required. Simply execute the script to start the interactive session.

Example:
PS > Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process; .\PowerNest.ps1

This command temporarily sets the execution policy to Unrestricted for the current PowerShell session and runs the PowerNest script.

For more information and updates, visit:
https://github.com/franckferman/PowerNest
"@
    Write-Host $helpText
    Write-Host ""
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
    $host.ui.RawUI.WindowTitle = "PowerNest - Franck FERMAN"
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
    Write-Host "Hello dearest " -NoNewline
    Write-Host "$env:UserName " -NoNewline -ForegroundColor Green
    Write-Host "and welcome to " -NoNewLine
    Write-Host "PowerNest" -NonewLine -ForegroundColor Green
    Write-Host "."
    Write-Host ""
    Write-Host "1 - Specific request"
    Write-Host "2 - Hey Google"
    Write-Host "3 - Schedule an alarm"
    Write-Host ""
    Write-Host "10 - Change the voice of your assistant"
    Write-Host ""
    Write-Host "42 - Random funny feature"
    Write-Host ""
    Write-Host "0 - Exit program"
    Write-Host ""

    [int]$userChoice = Read-Host "Your choice"
    switch ($userChoice) {
        1 { Invoke-SpecificRequest }
        2 { Invoke-HeyGoogle }
        3 { Invoke-ScheduleAlarm }
        10 { Invoke-ChangeVoice }
        42 { Invoke-FunnyFeature }
        0 { Exit-Program }
        default { Handle-InvalidOption }
    }
}


function Invoke-SpecificRequest {
    [CmdletBinding()]
    param ()

    Write-Host ""
    Write-Host "Write the message you want to tell your Google Assistant." -ForegroundColor Cyan
    Write-Host ""
    $User_Input = Read-Host "Enter your request"
    
    if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
        Add-Type -AssemblyName System.speech
    }

    try {
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.SpeakAsync('Hey Google') | Out-Null
        Start-Sleep -Seconds 1
        $speak.SpeakAsync($User_Input) | Out-Null
        Write-Host ""
        Write-Host "Your request has been processed." -ForegroundColor Green
        Write-Host ""
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while processing your request." -ForegroundColor Red
        Write-Host ""
    }

    pause
    main
}


function Invoke-HeyGoogle {
    [CmdletBinding()]
    param ()

    try {
        if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
            Add-Type -AssemblyName System.speech
        }
        
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.SpeakAsync('Hey Google') | Out-Null
        
        Write-Host ""
        Write-Host "Initiating interaction with Google..." -ForegroundColor Cyan
        Write-Host ""
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while trying to initiate interaction with Google." -ForegroundColor Red
        Write-Host ""
    }
    
    pause
    main
}


function Invoke-ScheduleAlarm {
    [CmdletBinding()]
    param ()

    Write-Host ""
    Write-Host "Please specify the time for the alarm." -ForegroundColor Cyan
    Write-Host ""
    $time = Read-Host "Time (e.g., 10AM, 10PM, or in 60 minutes)"
    
    Write-Host ""
    Write-Host "Please specify the date for the alarm." -ForegroundColor Cyan
    $date = Read-Host "Date (e.g., tomorrow, every day, or specific date like 'July 16 2022')"

    try {
        if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
            Add-Type -AssemblyName System.speech
        }

        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.SpeakAsync('Hey Google') | Out-Null
        Start-Sleep -Seconds 1
        $speak.SpeakAsync("Schedule an alarm for $date at $time") | Out-Null
        
        Write-Host ""
        Write-Host "Your request to schedule an alarm for $date at $time has been communicated to Google Assistant." -ForegroundColor Green
        Write-Host ""
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while trying to schedule the alarm." -ForegroundColor Red
        Write-Host ""
    }

    pause
    main
}


function Invoke-ChangeVoice {
    [CmdletBinding()]
    param ()

    try {
        if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
            Add-Type -AssemblyName System.speech
        }

        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.SpeakAsync("Hey Google") | Out-Null
        Start-Sleep -Seconds 1
        $speak.SpeakAsync("Change your voice.") | Out-Null
        
        $result = Ask-YesOrNo -Title "PowerNest - MessageBox function - Franck FERMAN" -Message "Confirm changing the Google Assistant voice?"

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
        Write-Host ""
    }

    pause
    main
}


function Invoke-FunnyFeature {
    [CmdletBinding()]
    param ()

    $CommandsList = @(
        "Wubba lubba dub dub.",
        "What sound does a unicorn make?",
        "Self destruct.",
        "Sing a Christmas song",
        "Show me the money.",
        "up, up, down, down, left, right, B, A.",
        "Get Schwifty."
    )

    $Command = $CommandsList | Get-Random

    try {
        if (-not ([System.Management.Automation.PSTypeName]'System.Speech.Synthesis.SpeechSynthesizer').Type) {
            Add-Type -AssemblyName System.speech
        }

        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.SpeakAsync("Hey Google") | Out-Null
        Start-Sleep -Seconds 1
        $speak.SpeakAsync($Command) | Out-Null
        Write-Host ""
    }
    catch {
        Write-Host ""
        Write-Host "An error occurred while processing the funny feature." -ForegroundColor Red
        Write-Host ""
    }

    pause
    main
}


if ($Help) {
    Show-Help
}
else {
    main
}
