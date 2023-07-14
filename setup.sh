#!/bin/bash

# Homebrew installieren
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Node und Git installieren
brew install \
node \
git \
--cask firefox \
--cask chromium \
--cask textmate \
--cask webstorm \
--cask visual-studio-code \
docker \
docker-compose \
--cask rectangle \
--cask slack



# Auswahl des Terminals
echo "Bitte wählen Sie Ihr bevorzugtes Terminal aus: 1.iTerm 2.Hyper 3.Warp"
read terminal

case $terminal in
  1) 
    brew install --cask iterm2
    ;;
  2) 
    brew install --cask hyper
    ;;
  3)
    brew install --cask warp
    ;;
  *) 
    echo "Ungültige Auswahl. Standardterminal wird verwendet."
    ;;
esac

# Auswahl zwischen Insomnia und Postman
echo "Bitte wählen Sie Ihr bevorzugtes API Testing Tool aus: 1.Insomnia 2.Postman"
read api_tool

case $api_tool in
  1)
    brew install --cask insomnia
    ;;
  2)
    brew install --cask postman
    ;;
  *)
    echo "Ungültige Auswahl. Es wird kein API Testing Tool installiert."
    ;;
esac

# Oh My Zsh installieren
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh-Thema ändern
sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="eastwood"/g' ~/.zshrc

# Zsh-Plugins installieren
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

brew install z
echo '. /usr/local/etc/profile.d/z.sh' >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo "source ${(q-)PWD}/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# Änderungen wirksam machen
source ~/.zshrc