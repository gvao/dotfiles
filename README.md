# 🗂️ Dotfiles

Repositório pessoal com todas as configurações do meu ambiente de desenvolvimento e desktop Linux, gerenciado com [GNU Stow](https://www.gnu.org/software/stow/).

Cada diretório na raiz é um **módulo independente** que espelha a estrutura do `$HOME` — basta um comando `stow` para criar os symlinks automaticamente no lugar certo.

---

## 📦 Módulos Disponíveis

| Módulo | Descrição | Destino dos Symlinks |
| :--- | :--- | :--- |
| `alacritty/` | Terminal GPU-accelerated com tema Catppuccin (Mocha & Latte). | `~/.config/alacritty/` |
| `bash/` | Configuração do Bash com Oh My Bash, `.bashrc` e `.inputrc`. | `~/` |
| `i3/` | Window manager i3 (X11) com i3status e Picom (compositor). | `~/.config/i3/`, `~/.config/i3status/`, `~/.config/picom/` |
| `nvim/` | Neovim com Lazy.nvim, LSP, autocompletion e tema Catppuccin. | `~/.config/nvim/` |
| `sway/` | Window manager Sway (Wayland) com Waybar, Mako e Wofi. | `~/.config/sway/`, `~/.config/waybar/`, `~/.config/mako/`, `~/.config/wofi/` |
| `tmux/` | Tmux com TPM, Catppuccin, vim-tmux-navigator e resurrect. | `~/.tmux.conf`, `~/.tmux/` |
| `zsh/` | Zsh com configuração modular (aliases, FZF, prompt, syntax highlighting). | `~/.zshrc`, `~/.zsh/` |
| `scripts/` | Scripts utilitários avulsos (otimização de VRAM/swap, isolamento de daemons Wayland). | `~/scripts/` |

---

## 🚀 Instalação

### Requisitos

- [Git](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/) (`sudo apt install stow` / `sudo pacman -S stow`)

### 1. Clonar o repositório

```bash
git clone https://github.com/gvao/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Instalar módulos com Stow

O GNU Stow cria **symlinks** dos arquivos de cada módulo para o seu `$HOME`, respeitando a estrutura de diretórios interna.

#### Instalar um módulo específico

```bash
stow nvim        # Cria: ~/.config/nvim → .dotfiles/nvim/.config/nvim
stow tmux        # Cria: ~/.tmux.conf → .dotfiles/tmux/.tmux.conf
stow sway        # Cria: ~/.config/sway, waybar, mako, wofi
```

#### Instalar todos os módulos de uma vez

```bash
stow */
```

#### Remover symlinks de um módulo

```bash
stow -D nvim     # Remove os symlinks do nvim sem apagar os arquivos
```

#### Reinstalar (atualizar) um módulo

```bash
stow -R tmux     # Remove e recria os symlinks do tmux
```

> [!TIP]
> Se houver conflito (arquivo já existe no destino), o Stow vai avisar. Faça backup do arquivo existente e remova-o antes de rodar o `stow`.

### 3. Exemplo prático completo

```bash
# Clonar
git clone https://github.com/SEU_USUARIO/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Instalar shell + terminal + editor + WM
stow zsh alacritty nvim tmux sway

# Pronto! Todos os symlinks foram criados no $HOME.
```

---

## 🗺️ Estrutura do Repositório

```
~/.dotfiles/
├── alacritty/          # Terminal
│   └── .config/alacritty/
│       ├── alacritty.toml
│       ├── catppuccin-mocha.toml
│       └── catppuccin-latte.toml
├── bash/               # Shell Bash
│   ├── .bashrc
│   ├── .bash_logout
│   ├── .inputrc
│   └── .oh-my-bash/
├── i3/                 # WM X11
│   └── .config/
│       ├── i3/config
│       ├── i3status/config
│       └── picom/picom.conf
├── nvim/               # Editor
│   └── .config/nvim/
│       ├── init.lua
│       └── lua/
│           ├── config/     (keymaps, options, lazy)
│           └── plugins/    (completion, lsp, theme)
├── sway/               # WM Wayland
│   └── .config/
│       ├── sway/config
│       ├── waybar/     (config + style.css)
│       ├── mako/config
│       └── wofi/style.css
├── tmux/               # Multiplexador
│   └── .tmux.conf
├── zsh/                # Shell Zsh
│   ├── .zshrc
│   └── .zsh/
│       ├── aliases.sh
│       ├── completion.sh
│       ├── env.sh
│       ├── fzf.sh
│       ├── path.sh
│       ├── prompt.sh
│       └── syntax-highlighting.sh
├── scripts/            # Utilitários
│   ├── otimizar_vram_swap.sh
│   └── configurar_servicos_wayland.sh
├── docs/               # Documentação
│   ├── NVIM_CHEATSHEET.md
│   ├── SWAY_CHEATSHEET.md
│   └── TMUX_CHEATSHEET.md
```

---

## 📚 Documentação & Cheatsheets

Guias de referência rápida com todos os atalhos e configurações documentados:

| Documento | Descrição |
| :--- | :--- |
| [NVIM_CHEATSHEET.md](docs/NVIM_CHEATSHEET.md) | Atalhos, LSP, autocompletar (blink.cmp), plugins e opções do Neovim. |
| [SWAY_CHEATSHEET.md](docs/SWAY_CHEATSHEET.md) | Keybindings, workspaces, Waybar, Wofi e daemons do Sway. |
| [TMUX_CHEATSHEET.md](docs/TMUX_CHEATSHEET.md) | Atalhos, plugins, copy-mode, sessões e visual do Tmux. |

---

## 🎨 Stack Visual

- **Tema**: Catppuccin Mocha em todo o ambiente (terminal, editor, WM, barra de status).
- **Fonte**: JetBrainsMono Nerd Font.
- **Ícones**: Nerd Fonts integrado em Waybar, Tmux e Neovim.

---

## 💡 Como Funciona o GNU Stow

O Stow trata cada subdiretório como um **pacote**. Ao executar `stow <pacote>`, ele cria symlinks no diretório pai (por padrão `$HOME`) espelhando a estrutura interna do pacote:

```
# Dentro do repositório:
nvim/.config/nvim/init.lua

# Após `stow nvim`, o Stow cria:
~/.config/nvim/init.lua → ~/.dotfiles/nvim/.config/nvim/init.lua
```

Isso significa que **editar o arquivo no `$HOME` ou no repositório é a mesma coisa** — são symlinks apontando para o mesmo lugar. Qualquer alteração é rastreada pelo Git automaticamente.

| Comando | O que faz |
| :--- | :--- |
| `stow <pacote>` | Cria os symlinks do pacote no `$HOME`. |
| `stow -D <pacote>` | Remove os symlinks (não apaga os arquivos originais). |
| `stow -R <pacote>` | Reinstala (remove + cria novamente). |
| `stow */` | Instala todos os pacotes de uma vez. |
| `stow -n <pacote>` | Simula a operação sem executar (dry-run). |
| `stow -v <pacote>` | Modo verboso — mostra cada symlink criado. |
