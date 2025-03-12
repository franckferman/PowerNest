<div id="top" align="center">

<!-- Shields Header -->
[![Contributors][contributors-shield]](https://github.com/franckferman/PowerNest/graphs/contributors)
[![Forks][forks-shield]](https://github.com/franckferman/PowerNest/network/members)
[![Stargazers][stars-shield]](https://github.com/franckferman/PowerNest/stargazers)
[![License][license-shield]](https://github.com/franckferman/PowerNest/blob/stable/LICENSE)

<!-- Logo -->
<a href="https://github.com/franckferman/PowerNest">
  <img src="https://raw.githubusercontent.com/franckferman/PowerNest/refs/heads/stable/docs/github/graphical_resources/Logo-without_background-PowerNest.png" alt="PowerNest Logo" width="auto" height="auto">
</a>

<!-- Title & Tagline -->
<h3 align="center">🔹 PowerNest</h3>
<p align="center">
    <em>PowerShell-Driven Google Nest Management.</em>
    <br>
    Manage Google Nest devices effortlessly from PowerShell — for when speaking out loud is not an option.
</p>

</div>

## 📜 Table of Contents

<details open>
  <summary><strong>Click to collapse/expand</strong></summary>
  <ol>
    <li><a href="#-about">📖 About</a></li>
    <li><a href="#-installation">🛠️ Installation</a></li>
    <li><a href="#-usage">🎮 Usage</a></li>
    <li><a href="#-contributing">🤝 Contributing</a></li>
    <li><a href="#-star-evolution">🌠 Star Evolution</a></li>
    <li><a href="#-license">📜 License</a></li>
    <li><a href="#-contact">📞 Contact</a></li>
  </ol>
</details>

## 📖 About

`PowerNest` started as a fun personal experiment — an alternative way to control my Google Nest without having to say "Hey Google" out loud every time.

As an IT and cybersecurity professional, I’m always looking for ways to make life easier and faster (yes, a good sysadmin is a bit lazy — but smart lazy!).

At first, it was just a tool to save time on simple tasks:

> "Instead of saying 'Hey Google, set an alarm for tomorrow at 7 AM', I can just run a PowerShell script that prompts me for the time and date, and sends the command automatically."

But over time, I realized PowerNest could be useful for others, and even go beyond that. It could become a command hub to preconfigure and automate recurring Google Nest tasks, making interactions even faster and more efficient — without needing to speak a word.

Today, PowerNest can help:

- People who can't (or don’t want to) use voice commands (accessibility, disabilities, privacy).
- IT pros, geeks, and automation lovers who want to streamline their smart home usage.
- IT experts for demos on smart assistant behaviors.
And... Easter egg hunters, because PowerNest also includes a lot of hidden funny commands.

Key features of PowerNest:

- Send custom commands directly to Google Nest.
- Say "Hey Google" and trigger follow-up commands — from PowerShell.
- Schedule alarms quickly without voice.
- Change Google Assistant’s voice on the fly.
- Launch random funny commands (Easter eggs).
- And in the future: automate and chain multiple tasks (routine-style commands, pre-configured scenarios, etc.).

> All of this entirely in PowerShell, without third-party tools — just leveraging Windows' built-in speech synthesis engine.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🚀 Installation

### Prerequisites

- **Windows OS** (Tested on **Windows 10 & 11** — may work on older versions but not officially supported).
- **PowerShell 5.1 or higher** (pre-installed on modern Windows).

> ⚠️ **Note**: 100% **pure PowerShell**, **no external software required**.

### Getting PowerNest

#### Option 1: One-liner with `Invoke-WebRequest` (Recommended)
```powershell
Invoke-WebRequest https://raw.githubusercontent.com/franckferman/PowerNest/stable/PowerNest.ps1 -OutFile PowerNest.ps1
```

#### Option 2: Clone via Git
```powershell
git clone https://github.com/franckferman/PowerNest.git
```

#### Option 3: **Direct Download** from GitHub
1. Go to GitHub repo.
2. Click `<> Code` → `Download ZIP`.
3. Extract the archive to your desired location.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🎮 Usage

### Getting started

1. Temporarily allow script execution:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
```

> 🛑 Important: This command temporarily adjusts the execution policy to allow script execution for the current process only, minimizing security risks. 
> Always examine scripts before executing them to ensure safety.

2. Run the script:
```powershell
.\PowerNest.ps1
```

Alternatively, for a streamlined approach, combine the execution policy adjustment with script launch in a single line:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process; .\PowerNest.ps1
```

> This command executes the script. 
> The script provides a user-friendly graphical interface, facilitating navigation through various tasks and options with ease.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🤝 Contributing

We truly appreciate and welcome community involvement. Your contributions, feedback, and suggestions play a crucial role in improving the project for everyone. If you're interested in contributing or have ideas for enhancements, please feel free to open an issue or submit a pull request on our GitHub repository. Every contribution, no matter how big or small, is highly valued and greatly appreciated!

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🌠 Star Evolution

Explore the star history of this project and see how it has evolved over time:

<a href="https://star-history.com/#franckferman/PowerNest&Timeline">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=franckferman/PowerNest&type=Timeline&theme=dark" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=franckferman/PowerNest&type=Timeline" />
  </picture>
</a>

Your support is greatly appreciated. We're grateful for every star! Your backing fuels our passion. ✨

## 📚 License

This project is licensed under the GNU Affero General Public License, Version 3.0. For more details, please refer to the LICENSE file in the repository: [Read the license on GitHub](https://github.com/franckferman/PowerNest/blob/stable/LICENSE)

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 📞 Contact

[![ProtonMail][protonmail-shield]](mailto:contact@franckferman.fr)
[![LinkedIn][linkedin-shield]](https://www.linkedin.com/in/franckferman)
[![Twitter][twitter-shield]](https://www.twitter.com/franckferman)

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/franckferman/PowerNest.svg?style=for-the-badge
[contributors-url]: https://github.com/franckferman/PowerNest/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/franckferman/PowerNest.svg?style=for-the-badge
[forks-url]: https://github.com/franckferman/PowerNest/network/members
[stars-shield]: https://img.shields.io/github/stars/franckferman/PowerNest.svg?style=for-the-badge
[stars-url]: https://github.com/franckferman/PowerNest/stargazers
[license-shield]: https://img.shields.io/github/license/franckferman/PowerNest.svg?style=for-the-badge
[license-url]: https://github.com/franckferman/PowerNest/blob/stable/LICENSE
[protonmail-shield]: https://img.shields.io/badge/ProtonMail-8B89CC?style=for-the-badge&logo=protonmail&logoColor=blueviolet
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=blue
[twitter-shield]: https://img.shields.io/badge/-Twitter-black.svg?style=for-the-badge&logo=twitter&colorB=blue

