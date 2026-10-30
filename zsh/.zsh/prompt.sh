# Carrega o sistema de controle de versão para obter informações do Git
autoload -Uz vcs_info
precmd() { vcs_info }

# Habilita o git no vcs_info
zstyle ':vcs_info:*' enable git

# Formato para exibir o branch do git (ex: "(main)")
zstyle ':vcs_info:git:*' formats '(%b)'

# Cores
cyan="%F{cyan}"
yellow="%F{yellow}"
green="%F{green}"
reset="%f%u%b%s"

# Configuração do Prompt
# Linha 1: Diretório atual em ciano
# Linha 2: Branch do Git em amarelo (se houver) e símbolo do prompt em verde
PROMPT="${cyan}%~${reset}
${yellow}${vcs_info_msg_0_} ${green}%# ${reset}"
