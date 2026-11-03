# Neovim Cheatsheet & Guia de Produtividade

> Documentação e referência rápida baseada nas configurações portáteis dos seus dotfiles em [`nvim/.config/nvim/`](file:///home/gvao/.dotfiles/nvim/.config/nvim/).

---

## 1. Destaques da Configuração & Visual

* **Tema**: Catppuccin Mocha com True Color (`termguicolors`).
* **Fonte de Ícones**: Nerd Fonts (`mono` variant) integrada ao autocompletar.
* **Números de Linha**: Híbrido — **absoluto** na linha do cursor, **relativo** nas demais.
* **Cursor**: Linha atual destacada (`cursorline`) com coluna de sinais sempre visível (`signcolumn=yes`).
* **Scroll Confortável**: 8 linhas de margem vertical e horizontal (`scrolloff`, `sidescrolloff`).
* **Sem Quebra de Linha**: `wrap = false` — linhas longas rolam horizontalmente.
* **Clipboard do Sistema**: Integrado via `unnamedplus` — copiar/colar compartilha com o OS.
* **Splits**: Novos splits abrem à **direita** e **abaixo** (comportamento natural).
* **Gerenciador de Plugins**: [Lazy.nvim](https://github.com/folke/lazy.nvim) com bootstrap automático.
* **Portabilidade**: Ao clonar os dotfiles num computador novo, o Lazy.nvim se instala sozinho na primeira execução. Servidores LSP só ativam se o binário existir no PATH — sem erros em máquinas sem tooling.
* **Performance**: Plugins nativos desnecessários desabilitados (`gzip`, `tarPlugin`, `tohtml`, `tutor`, `zipPlugin`).

---

## 2. Tecla Leader

> **Leader:** `Espaço` *(pressione `Espaço` e em seguida a tecla do comando)*

---

## 3. Atalhos Gerais

| Atalho | Modo | Ação |
| :--- | :--- | :--- |
| `Espaço + w` | Normal | **Salvar** o arquivo (`:w`). |
| `Espaço + q` | Normal | **Fechar** o buffer/janela (`:q`). |
| `Esc` | Normal | **Limpar** o destaque da busca (`nohlsearch`). |

---

## 4. Navegação entre Splits

| Atalho | Ação |
| :--- | :--- |
| `Ctrl + h` | Foca o split da **esquerda**. |
| `Ctrl + j` | Foca o split de **baixo**. |
| `Ctrl + k` | Foca o split de **cima**. |
| `Ctrl + l` | Foca o split da **direita**. |

---

## 5. Mover Linhas no Modo Visual

| Atalho | Modo | Ação |
| :--- | :--- | :--- |
| `J` | Visual | Move a seleção **uma linha para baixo** (reindenta automaticamente). |
| `K` | Visual | Move a seleção **uma linha para cima** (reindenta automaticamente). |

> Selecione linhas com `V` (visual line), depois use `J` / `K` para reorganizar.

---

## 6. Busca de Texto

| Atalho | Ação |
| :--- | :--- |
| `/texto` | Busca **à frente** no arquivo. |
| `?texto` | Busca **para trás** no arquivo. |
| `n` | Próxima ocorrência. |
| `N` | Ocorrência anterior. |
| `*` | Busca a palavra sob o cursor (à frente). |
| `#` | Busca a palavra sob o cursor (para trás). |

> A busca ignora maiúsculas/minúsculas (`ignorecase`), exceto quando você digita uma letra maiúscula (`smartcase`). O destaque das ocorrências (`hlsearch`) é limpo com `Esc`.

---

## 7. Autocompletar (blink.cmp)

> Plugin: [`saghen/blink.cmp`](https://github.com/saghen/blink.cmp) · Configuração em [`completion.lua`](file:///home/gvao/.dotfiles/nvim/.config/nvim/lua/plugins/completion.lua).

O autocompletar é alimentado por 4 fontes, em ordem de prioridade:

1. **LSP** — sugestões inteligentes do servidor de linguagem.
2. **Path** — caminhos de arquivos e diretórios.
3. **Snippets** — trechos de código expandíveis.
4. **Buffer** — palavras do arquivo atual.

### Atalhos do Autocompletar

| Atalho | Ação |
| :--- | :--- |
| `Ctrl + Espaço` | **Abre** o menu / alterna exibição da documentação. |
| `Tab` | Seleciona o **próximo** item da lista. |
| `Shift + Tab` | Seleciona o item **anterior** da lista. |
| `Enter` | **Aceita** a sugestão selecionada. |

---

## 8. LSP (Language Server Protocol)

> Plugin: [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) · Configuração em [`lsp.lua`](file:///home/gvao/.dotfiles/nvim/.config/nvim/lua/plugins/lsp.lua).

### Servidores Configurados

| Servidor | Linguagem | Binário Necessário |
| :--- | :--- | :--- |
| `lua_ls` | Lua | `lua-language-server` |
| `ts_ls` | TypeScript / JavaScript | `typescript-language-server` |
| `jsonls` | JSON | `vscode-json-language-server` |
| `yamlls` | YAML | `yaml-language-server` |
| `dockerls` | Dockerfile | `docker-langserver` |
| `bashls` | Bash / Shell | `bash-language-server` |
| `gopls` | Go | `gopls` |

> Cada servidor só é ativado se o binário correspondente existir no `$PATH`. Em máquinas sem o tooling instalado, nenhum erro é gerado — o LSP simplesmente não carrega.

### Atalhos do LSP (ativos apenas com servidor conectado)

| Atalho | Ação |
| :--- | :--- |
| `gd` | Ir para a **definição** do símbolo. |
| `gD` | Ir para a **declaração** do símbolo. |
| `gi` | Ir para a **implementação**. |
| `K` | Exibir **documentação** (hover) do símbolo sob o cursor. |
| `Espaço + rn` | **Renomear** o símbolo em todo o projeto. |
| `Espaço + ca` | Exibir **ações de código** disponíveis (quick fixes, refactors). |
| `Espaço + d` | Ver **detalhes do diagnóstico** (erro/warning) em float. |
| `[d` | Ir para o **diagnóstico anterior**. |
| `]d` | Ir para o **próximo diagnóstico**. |

### Diagnósticos Visuais

| Recurso | Estado |
| :--- | :--- |
| Texto virtual inline | ✅ Ativo |
| Ícones na coluna de sinais | ✅ Ativo |
| Sublinhado no código | ✅ Ativo |
| Atualização durante digitação | ❌ Desativado (só ao sair do insert mode) |
| Ordenação por severidade | ✅ Ativo |

---

## 9. Indentação & Formatação

| Opção | Valor | Descrição |
| :--- | :--- | :--- |
| `tabstop` | `2` | Largura visual de um tab. |
| `shiftwidth` | `2` | Espaços usados em cada nível de indentação. |
| `softtabstop` | `2` | Espaços inseridos ao pressionar Tab. |
| `expandtab` | `true` | Converte tabs em espaços. |
| `smartindent` | `true` | Indentação automática inteligente baseada na sintaxe. |

---

## 10. Plugins Instalados (Lazy.nvim)

| Plugin | Descrição |
| :--- | :--- |
| [`folke/lazy.nvim`](https://github.com/folke/lazy.nvim) | Gerenciador de plugins moderno com lazy-loading. |
| [`catppuccin/nvim`](https://github.com/catppuccin/nvim) | Tema Catppuccin Mocha (prioridade máxima de carregamento). |
| [`saghen/blink.cmp`](https://github.com/saghen/blink.cmp) | Engine de autocompletar rápido com múltiplas fontes. |
| [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) | Configuração facilitada de servidores LSP. |

### Comandos de Gestão do Lazy.nvim

| Comando | Ação |
| :--- | :--- |
| `:Lazy` | Abre o painel interativo do Lazy.nvim. |
| `:Lazy install` | Instala plugins declarados que estão faltando. |
| `:Lazy update` | Atualiza todos os plugins para a versão mais recente. |
| `:Lazy sync` | Instala, atualiza e remove plugins de uma vez. |
| `:Lazy clean` | Remove plugins que foram excluídos da configuração. |
| `:Lazy profile` | Exibe tempos de carregamento de cada plugin. |

---

## 11. Estrutura dos Arquivos

```
nvim/.config/nvim/
├── init.lua                  # Ponto de entrada — carrega options, keymaps e lazy
├── lua/
│   ├── config/
│   │   ├── options.lua       # Opções gerais (números, indentação, visual, clipboard)
│   │   ├── keymaps.lua       # Atalhos customizados (leader, splits, mover linhas)
│   │   └── lazy.lua          # Bootstrap e inicialização do Lazy.nvim
│   └── plugins/
│       ├── theme.lua         # Catppuccin Mocha
│       ├── completion.lua    # blink.cmp (autocompletar)
│       └── lsp.lua           # nvim-lspconfig + servidores LSP
└── lazy-lock.json            # Lockfile de versões dos plugins (gerado automaticamente)
```

---

## 12. Opções de Performance

Plugins nativos do Neovim desabilitados para reduzir tempo de startup:

| Plugin Desabilitado | Motivo |
| :--- | :--- |
| `gzip` | Edição de arquivos `.gz` — raramente usado. |
| `tarPlugin` | Edição de arquivos `.tar` — raramente usado. |
| `tohtml` | Conversão de buffer para HTML — desnecessário. |
| `tutor` | Tutorial interativo — já não precisa mais. |
| `zipPlugin` | Edição de arquivos `.zip` — raramente usado. |
