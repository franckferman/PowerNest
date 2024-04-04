<div id="top" align="center">

<!-- Shields Header -->
[![Contributors][contributors-shield]](https://github.com/franckferman/PowerNest/graphs/contributors)
[![Forks][forks-shield]](https://github.com/franckferman/PowerNest/network/members)
[![Stargazers][stars-shield]](https://github.com/franckferman/PowerNest/stargazers)
[![Issues][issues-shield]](https://github.com/franckferman/PowerNest/issues)
[![License][license-shield]](https://github.com/franckferman/PowerNest/blob/stable/LICENSE)

<!-- Logo -->
<a href="https://github.com/franckferman/PowerNest">
  <img src="https://raw.githubusercontent.com/franckferman/PowerNest/stable/docs/github/graphical_resources/Logo-Without_background-PowerNest.png" alt="PowerNest Logo" width="auto" height="auto">
</a>

<!-- Title & Tagline -->
<h3 align="center">🔹 PowerNest: PowerShell-Driven Google Nest Management</h3>
<p align="center">
    <em>A bridge between PowerShell commands and your Google Nest, enabling simplified control.</em>
    <br>
     PowerNest brings smart home automation to your fingertips, offering an inclusive and accessible way for everyone to command their environment effortlessly, regardless of their ability to speak.
</p>

<!-- Links & Demo -->
<p align="center">
    <a href="https://github.com/franckferman/PowerNest/blob/stable/README.md" class="button-style"><strong>📘 Explore the full documentation</strong></a>
    ·
    <a href="https://github.com/franckferman/PowerNest/issues">🐞 Report Bug</a>
    ·
    <a href="https://github.com/franckferman/PowerNest/issues">🛠️ Request Feature</a>
</p>

</div>

## 📜 Table of Contents

<details open>
  <summary><strong>Click to collapse/expand</strong></summary>
  <ol>
    <li><a href="#-about">📖 About</a></li>
    <li><a href="#-installation">🛠️ Installation</a></li>
    <li><a href="#-usage">🎮 Usage</a></li>
    <li><a href="#-troubleshooting">❗ Troubleshooting</a></li>
    <li><a href="#-contributing">🤝 Contributing</a></li>
    <li><a href="#-star-evolution">🌠 Star Evolution</a></li>
    <li><a href="#-license">📜 License</a></li>
    <li><a href="#-contact">📞 Contact</a></li>
  </ol>
</details>

## 📖 About

**Voice Control for Google Nest with PowerShell :** _Streamline your Google Nest interactions._

PowerNest introduces a novel and efficient way to control your Google Nest devices using PowerShell. This project is dedicated to enhancing the convenience of managing Google Nest's smart features such as alarms, reminders, and home automation directly from your PowerShell terminal. It's particularly designed for users seeking an alternative method to interact with their smart devices, offering a powerful solution for both enthusiasts and those with physical limitations that make voice commands challenging.

<p align="center">
  <img src="https://raw.githubusercontent.com/franckferman/PowerNest/stable/docs/github/graphical_resources/powernest-main.png" alt="PowerNest main menu Demo Screenshot" width="auto" height="auto">
</p>

Embrace a new era of smart home control with PowerNest. Whether for convenience, accessibility, or the sheer joy of tech experimentation, PowerNest makes smart home management more inclusive and versatile. Start scripting your way to a smarter home today.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🚀 Installation

Setting up `PowerNest` is streamlined for your convenience. Before you begin, ensure you meet the basic requirements.

### Prerequisites

`PowerNest` requires PowerShell 5.1 or higher, readily available on Windows 10 and Windows 11 systems. Designed to integrate seamlessly with the PowerShell environment, PowerNest leverages the powerful scripting capabilities of PowerShell to offer a unique voice control experience for Google Nest devices.

> ⚠️ **Note**: `PowerNest` has been thoroughly tested on Windows 10 and Windows 11 with PowerShell 5.1 and later. While it may function on older versions of Windows with PowerShell 3.0 and above, functionality and experience are guaranteed on the latest platforms.

### Getting PowerNest

You have a few options to get started with PowerNest, including direct download and using Git. For the quickest setup, we also provide a one-liner using Invoke-WebRequest.

Option 1: Recommended - **One-liner with `Invoke-WebRequest`**
For a fast and easy start, run the following PowerShell command. This one-liner downloads the PowerNest script directly, ready for immediate use:
```bash
Invoke-WebRequest https://raw.githubusercontent.com/franckferman/PowerNest/stable/PowerNest.ps1 -OutFile PowerNest.ps1
```

Remember to navigate to the directory where you want the script saved before running the command.

Option 2: **Using Git**
First, ensure you have Git installed on your system. Open PowerShell or your favorite terminal and run the following command to clone the repository:
```bash
git clone https://github.com/franckferman/PowerNest.git
```

This method clones the entire project to your local machine.

Option 3: **Direct Download** from GitHub
If you prefer not using Git, you can download the project directly:

Visit the project's page at `https://github.com/franckferman/PowerNest`.
Click on the `<> Code` button, then select `Download ZIP`.
After downloading, extract the ZIP file to your preferred location.

Whichever method you choose, you'll have everything needed to start controlling your Google Nest devices with PowerShell.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🎮 Usage

Using `PowerNest` is designed to be as simple and intuitive as possible, allowing you to control your Google Nest devices through PowerShell with ease.

### **Getting started**

Before using PowerNest, ensure that your PowerShell execution policy permits script execution. Open PowerShell as an administrator and set the execution policy, if necessary, by running:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
```

> 🛑 Important: Adjusting the execution policy to Unrestricted for the Process scope allows you to run scripts for the current session while maintaining overall system security. Always review scripts from the internet before running them to avoid potential security risks.

Navigate to the directory where you've downloaded or cloned `PowerNest`.

To start PowerNest, run the following command:
```powershell
.\PowerNest.ps1
```

For convenience, you can adjust the execution policy and launch PowerNest in one command:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process; .\PowerNest.ps1
```

Executing this command will launch PowerNest, providing you with a menu of voice command options for your Google Nest. From here, you can perform various actions.

Enjoy the blend of PowerShell's scripting power with the convenience of voice control for your Google Nest, making smart home automation more accessible and fun.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🔧 Troubleshooting

Encountering issues? Don't worry. If you come across any problems or have questions, please don't hesitate to submit a ticket for assistance: [Submit an issue on GitHub](https://github.com/franckferman/PowerNest/issues)

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
[issues-shield]: https://img.shields.io/github/issues/franckferman/PowerNest.svg?style=for-the-badge
[issues-url]: https://github.com/franckferman/PowerNest/issues
[license-shield]: https://img.shields.io/github/license/franckferman/PowerNest.svg?style=for-the-badge
[license-url]: https://github.com/franckferman/PowerNest/blob/stable/LICENSE
[protonmail-shield]: https://img.shields.io/badge/ProtonMail-8B89CC?style=for-the-badge&logo=protonmail&logoColor=blueviolet
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=blue
[twitter-shield]: https://img.shields.io/badge/-Twitter-black.svg?style=for-the-badge&logo=twitter&colorB=blue
