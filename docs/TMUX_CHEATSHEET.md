# Tmux Cheatsheet & Guia de Produtividade

> Documentação e referência rápida baseada nas configurações portáteis dos seus dotfiles em [`.tmux.conf`](file:///home/gvao/.dotfiles/tmux/.tmux.conf).

---

## 1. Destaques da Configuração & Visual

* **Tema Visual**: Catppuccin Mocha com 24-bit True Color (`tmux-256color` + overrides RGB).
* **Barra de Status (Topo)**: Módulos no estilo "pílula arredondada" (*rounded*) com ícones Nerd Fonts:
  - Diretório do projeto atual (``)
  - Identificador da sessão (``)
  - Janelas ativas e inativas com badges numerados e nomes dos processos.
* **Foco & Conforto nos Painéis**:
  - **Painel Ativo**: Borda em destaque vibrante **Catppuccin Mauve** (`#cba6f7`).
  - **Modo Zoom**: Quando um painel está maximizado (`[Z]`), a borda muda para amarelo/pêssego (`#f9e2af`) para alertar visualmente.
  - **Painéis Inativos**: Bordas discretas em tom escuro (**Surface0** `#313244`).
* **Portabilidade Git**:
  - Bootstrap automático do **TPM**: ao clonar seus dotfiles em um computador novo, o tmux baixa o TPM e instala todos os plugins sozinho na primeira execução.
  - `tmux/.tmux/` ignorado no `.gitignore` para não versionar plugins de terceiros.

---

## 2. Prefixo Mestre

> **Prefix:** `Ctrl+a` *(pressione `Ctrl+a`, solte e em seguida pressione a tecla do comando)*

---

## 3. Divisões de Tela (Splits) & Produtividade

> **Nota:** Todos os splits e novas janelas mantêm automaticamente a **pasta atual** (`#{pane_current_path}`).

| Atalho | Ação |
| :--- | :--- |
| `Ctrl+a` seguido de `\|` | Divide o painel na **vertical** (lado a lado) na pasta atual. |
| `Ctrl+a` seguido de `-` | Divide o painel na **horizontal** (cima / baixo) na pasta atual. |
| `Ctrl+a` seguido de `c` | Cria uma **nova janela** aberta na pasta do painel atual. |
| `Ctrl+a` seguido de `z` | **Zoom / Maximizar** o painel (pressione de novo para restaurar). Borda fica amarela! |
| `Ctrl+a` seguido de `x` | **Fecha** o painel atual (pede confirmação `y/n`). |
| `Ctrl+a` seguido de `r` | **Recarrega** o `.tmux.conf` instantaneamente sem fechar a sessão. |

---

## 4. Navegação Transparente com Neovim (`vim-tmux-navigator`)

Com o plugin ativo, você transita de forma fluida entre splits do Neovim e painéis do Tmux usando as mesmas teclas, **sem precisar apertar o prefixo**:

| Atalho Direto *(sem prefixo)* | Ação |
| :--- | :--- |
| `Ctrl + Shift + h` | Foca o painel ou split da **esquerda**. |
| `Ctrl + Shift + j` | Foca o painel ou split de **baixo**. |
| `Ctrl + Shift + k` | Foca o painel ou split de **cima**. |
| `Ctrl + Shift + l` | Foca o painel ou split da **direita**. |

### Redimensionamento de Painéis (Estilo Vi)

| Atalho com Prefixo | Ação |
| :--- | :--- |
| `Ctrl+a` seguido de `H` *(Shift+h)* | Expande o painel 5 passos para a **esquerda**. |
| `Ctrl+a` seguido de `J` *(Shift+j)* | Expande o painel 5 passos para **baixo**. |
| `Ctrl+a` seguido de `K` *(Shift+k)* | Expande o painel 5 passos para **cima**. |
| `Ctrl+a` seguido de `L` *(Shift+l)* | Expande o painel 5 passos para a **direita**. |

*(Você também pode arrastar as linhas divisórias usando o mouse).*

---

## 5. Gerenciamento de Janelas (Tabs)

| Atalho | Ação |
| :--- | :--- |
| `Ctrl+a` seguido de `1` a `9` | Pula diretamente para a janela pelo número. |
| `Ctrl+a` seguido de `n` | Vai para a **próxima** janela (*next*). |
| `Ctrl+a` seguido de `p` | Vai para a janela **anterior** (*previous*). |
| `Ctrl+a` seguido de `l` | Alterna com a **última janela acessada** (*last*). |
| `Ctrl+a` seguido de `,` | **Renomeia** a janela atual. |
| `Ctrl+a` seguido de `&` | **Fecha** a janela atual. |
| `Ctrl+a` seguido de `w` | Exibe a lista interativa de janelas/sessões. |

---

## 6. Modo Vi de Cópia & Integração com o Clipboard do Sistema

O modo de cópia usa as teclas clássicas do Vim e sincroniza direto com a área de transferência do Linux (X11 / Wayland via `xclip` / `wl-copy` / `tmux-yank`):

1. Pressione `Ctrl+a` seguido de `[` (ou use o scroll do mouse) para entrar no **Copy Mode**.
2. Navegue pelo texto usando `h`, `j`, `k`, `l`, `w`, `b`, `Ctrl+u`, `Ctrl+d`, etc.
3. Para buscar texto: digite `/` (busca à frente) ou `?` (busca para trás), pressione `Enter` e navegue com `n`/`N`.

| Tecla no Copy Mode | Ação |
| :--- | :--- |
| `v` | Inicia a seleção visual de texto (*modo caractere*). |
| `Ctrl+v` | Alterna para seleção em bloco retangular. |
| `y` | **Copia (Yank)** a seleção direto para o Clipboard do sistema e sai do copy mode. |
| Selecionar com o Mouse | Copia automaticamente para o Clipboard ao soltar o clique. |
| `Ctrl+a` seguido de `]` | Cola o conteúdo do buffer interno do tmux (ou use `Ctrl+Shift+V` normal do terminal). |
| `q` ou `Esc` | Sai do modo de cópia sem copiar. |

---

## 7. Gerenciamento de Sessões

### Atalhos no Tmux:
| Atalho | Ação |
| :--- | :--- |
| `Ctrl+a` seguido de `d` | **Desanexa** da sessão atual (*detach*). |
| `Ctrl+a` seguido de `s` | Lista interativa de sessões com pré-visualização. |
| `Ctrl+a` seguido de `$` | **Renomeia** a sessão atual. |
| `Ctrl+a` seguido de `:` | Abre a linha de comandos do tmux. |

### Comandos no Terminal (Bash):
```bash
# Iniciar nova sessão nomeada
tmux new -s meu-projeto

# Listar sessões existentes
tmux ls

# Reconectar a uma sessão existente
tmux attach -t meu-projeto
# ou simplesmente:
tmux a

# Encerrar uma sessão pelo nome
tmux kill-session -t meu-projeto
```

---

## 8. Plugins Instalados (TPM)

| Plugin | Descrição |
| :--- | :--- |
| `tmux-plugins/tpm` | Gerenciador oficial de plugins do Tmux. |
| `tmux-plugins/tmux-sensible` | Configurações padrão universais e seguras. |
| `catppuccin/tmux#v2.1.2` | Tema estético moderno Mocha com pílulas arredondadas. |
| `christoomey/vim-tmux-navigator` | Navegação fluida entre nvim e tmux (`Ctrl+h/j/k/l`). |
| `tmux-plugins/tmux-yank` | Cópia integrada ao clipboard do sistema operacional. |
| `tmux-plugins/tmux-resurrect` | Salva o estado (`Ctrl+a` + `Ctrl+s`) e restaura (`Ctrl+a` + `Ctrl+r`). |
| `tmux-plugins/tmux-continuum` | Salva e restaura as sessões automaticamente a cada 15 min. |

### Comandos de Gestão do TPM:
* `Ctrl+a` seguido de `I` *(Shift+i)*: Instala plugins declarados no `.tmux.conf`.
* `Ctrl+a` seguido de `U` *(Shift+u)*: Atualiza todos os plugins instalados.
* `Ctrl+a` seguido de `Alt+u`: Remove plugins que foram excluídos do arquivo.
