# My readme files


install zsh script
```bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

install zsh plugins that are in .zshrc
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $ZSH_CUSTOM/plugins/zsh-vi-mode

```



install starship
```bash
curl -sS https://starship.rs/install.sh | sh
```
after pulling this repo, run this command to install all the dependencies

```bash
brew install git fzf ripgrep fd tmux bat btop exa zsh-autosuggestions zsh-syntax-highlighting ollama entr
```

autin search history finder
```bash
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

```


web dev related tools
```bash
brew install nvm
nvm install 18
nvm use 18
brew install jq neovim awscli tmux
brew install --cask docker wezterm  cursor google-chrome visual-studio-code
brew install jesseduffield/lazygit/lazygit
brew install jesseduffield/lazydocker/lazydocker
```
