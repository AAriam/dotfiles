# DotFiles Repository


## Installation

[chezmoi](https://github.com/twpayne/chezmoi)


## Installation With Chezmoi

1. [Install chezmoi](https://www.chezmoi.io/install/):
   - Using `curl`:
     ```bash
     sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
     ```
   - Using `wget`:
     ```bash
     sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin
     ```
2. Apply:
   ```bash
   chezmoi init --apply https://github.com/aariam/dotfiles.git --source ~/dotfiles
   ```


## Installation From Local Clone

1. Clone this GitHub repository on your local machine.
2. Inside the repository, run the installation script:
   ```bash
   ./install.sh
   ```

The installation script first installs `chezmoi`
if not already installed, and uses it to install
all other applications and configuration files. 
