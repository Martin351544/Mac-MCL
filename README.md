# MCL Terminal Setup

**MCL** (Mac Command Launcher) is a terminal utility designed for Mac developers to streamline everyday development tasks. It provides a main menu with shortcuts, helper functions, and aliases to make development faster and more convenient.

---

## ⚠️ Warnings

- **Proprietary software**: This project is **not open source**. You are **not allowed to modify, redistribute, or sell this code** without explicit permission from the author.  
- **Backup recommended**: The installer creates a backup of your current `~/.zshrc` file, but manually backing up your configuration is recommended.  
- **Use at your own risk**: The installer modifies your `~/.zshrc` and terminal configuration. Ensure you understand what it does before running.

---

## Features

- Custom aliases for terminal navigation and commands  
- `MCL` main menu with system info and available commands  
- `checkAndKill <port>` — check a port and kill the process if needed  
- `new` — create new files or directories quickly  
- `addCmd` — add custom aliases/commands directly from the terminal  
- `showCmd` — view all available shortcuts and their descriptions  

---

## Recommended Modules / Software

For the **best performance**, it is recommended to install the following before running the installer:

- **Homebrew** — package manager for macOS  
- **Node.js + npm** — for JavaScript development  
- **Deno** — required for some MCL commands  
- **Python 3** — for Python projects  
- **Visual Studio Code** — recommended for `customtc` alias  
- **nvm** — Node version manager (optional but recommended)  

You can install them with:

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Node.js and npm
brew install node

# Install Deno
brew install deno

# Install Python 3
brew install python

# Install nvm
brew install nvm

###### MCL installation process
#clone/download the repo
git clone https://github.com/YourUsername/MCL-Terminal-Setup.git
cd MCL-Terminal-Setup

# Make the installer executable
chmod +x install_mcl.sh

# run the installer
./install_mcl.sh

# reload the terminal
source ~/.zshrc

# open MCL
MCL


