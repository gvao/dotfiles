# Estilos para zsh-syntax-highlighting (remove sublinhado de comandos)
# Esta configuração deve ser definida ANTES de carregar o plugin.
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,nobold,nounderline'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan,nounderline'

# Carrega o plugin de syntax highlighting
# Este deve ser um dos últimos itens a serem carregados no .zshrc
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
