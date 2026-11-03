# Sway Cheatsheet & Guia de Produtividade

> Documentação e referência rápida baseada nas configurações portáteis dos seus dotfiles em [`config`](file:///home/gvao/.dotfiles/sway/.config/sway/config).

---

## 1. Destaques da Configuração & Visual

* **Compositor Wayland**: Sway — tiling window manager compatível com i3, 100% nativo Wayland.
* **Terminal Padrão**: Alacritty (`$mod+Return`).
* **Navegador Padrão**: Firefox (`$mod+e`).
* **Barra de Status (Waybar)**: Posicionada no topo com módulos de sistema:
  - Workspaces e modo ativo (esquerda)
  - Título da janela focada (centro)
  - Pulseaudio, CPU, Memória, Disco, Bateria, Rede, Tray, Relógio (direita)
  - Fonte **JetBrainsMono Nerd Font** com ícones Nerd Fonts
  - Tema escuro (`#1e1e1e`) com acentos azuis (`#4c8aff`)
* **Launcher**: Wofi (Wayland-native) com tema escuro customizado e bordas arredondadas.
* **Notificações**: Mako com visual coerente — fundo escuro, bordas azuis (`#4c8aff`), timeout de 5s (urgentes permanecem visíveis).
* **Gaps Estéticos**: `inner 6px`, `outer 3px` — espaçamento entre janelas para visual limpo.
* **Foco**: `focus_follows_mouse no` — o foco só muda via teclado ou clique explícito.
* **Layout do Teclado**: `br,us` com `AltGr` para terceiro nível e `Ctrl direito` como Compose.
* **Touchpad (Notebook)**: Tap habilitado, scroll natural, emulação de clique do meio.
* **Bloqueio Automático**: `swayidle` + `swaylock` — tela bloqueia após 5 minutos de inatividade e ao suspender.
* **Janelas Flutuantes Automáticas**: Pop-ups, bolhas e diálogos abrem como flutuantes automaticamente.

---

## 2. Tecla Modificadora (Super)

> **$mod:** `Mod4` (tecla **Super** / **⊞ Win**) — usada como prefixo na maioria dos atalhos.

---

## 3. Ações Essenciais

| Atalho | Ação |
| :--- | :--- |
| `Super + Return` | Abre o **terminal** (Alacritty). |
| `Super + e` | Abre o **navegador** (Firefox). |
| `Super + q` | **Fecha** a janela focada. |
| `Super + d` | Abre o **Wofi** (launcher de comandos — modo `run`). |
| `Super + i` | Abre o **Wofi** (launcher de aplicativos — modo `drun`). |
| `Super + f` | Alterna **tela cheia** na janela focada. |
| `Ctrl + Shift + s` | **Captura de tela** com seleção (grim + slurp → clipboard). |

---

## 4. Navegação de Foco

| Atalho | Ação |
| :--- | :--- |
| `Super + ←` | Foca a janela da **esquerda**. |
| `Super + ↓` | Foca a janela de **baixo**. |
| `Super + ↑` | Foca a janela de **cima**. |
| `Super + →` | Foca a janela da **direita**. |
| `Super + a` | Foca o **contêiner pai** (navega na árvore de layout). |
| `Super + Space` | Alterna o foco entre janelas **flutuantes** e **tiling**. |

---

## 5. Mover Janelas

### Com Setas Direcionais

| Atalho | Ação |
| :--- | :--- |
| `Super + Shift + ←` | Move a janela para a **esquerda**. |
| `Super + Shift + ↓` | Move a janela para **baixo**. |
| `Super + Shift + ↑` | Move a janela para **cima**. |
| `Super + Shift + →` | Move a janela para a **direita**. |

### Estilo Vim

| Atalho | Ação |
| :--- | :--- |
| `Super + Shift + j` | Move a janela para a **esquerda**. |
| `Super + Shift + k` | Move a janela para **baixo**. |
| `Super + Shift + l` | Move a janela para **cima**. |
| `Super + Shift + ;` | Move a janela para a **direita**. |

---

## 6. Layout & Splits

| Atalho | Ação |
| :--- | :--- |
| `Super + ;` | Alterna a **direção do split** (horizontal ↔ vertical). |
| `Super + Shift + ?` | **Cicla entre todos os layouts** (splitv, splith, tabbed, stacking). |
| `Super + Shift + Space` | Alterna a janela focada entre **flutuante** e **tiling**. |
| `Alt + arrastar` | Move janelas flutuantes com o **mouse** (floating_modifier). |

---

## 7. Redimensionar Janelas

| Atalho | Ação |
| :--- | :--- |
| `Super + Ctrl + ↑` | **Aumenta** a altura da janela. |
| `Super + Ctrl + ↓` | **Diminui** a altura da janela. |
| `Super + Ctrl + →` | **Aumenta** a largura da janela. |
| `Super + Ctrl + ←` | **Diminui** a largura da janela. |

*(Incrementos de 5px / 10ppt por toque.)*

---

## 8. Workspaces (Áreas de Trabalho)

### Navegar entre Workspaces

| Atalho | Ação |
| :--- | :--- |
| `Super + 1` a `Super + 0` | Vai diretamente para o workspace **1** a **10**. |

### Mover Janela para um Workspace

| Atalho | Ação |
| :--- | :--- |
| `Super + Shift + 1` a `Super + Shift + 0` | Move a janela focada para o workspace **1** a **10**. |

---

## 9. Controle de Volume & Mídia

> Teclas de mídia do teclado (Fn keys), sem precisar de modificador:

| Tecla | Ação |
| :--- | :--- |
| `🔊 Volume Up` | Aumenta o volume em **10%**. |
| `🔉 Volume Down` | Diminui o volume em **10%**. |
| `🔇 Mute` | **Muta/desmuta** o áudio de saída. |
| `🎤 Mic Mute` | **Muta/desmuta** o microfone. |

---

## 10. Sessão & Recarga

| Atalho | Ação |
| :--- | :--- |
| `Super + Shift + r` | **Recarrega** a configuração do Sway (sem reiniciar). |
| `Super + Shift + c` | **Recarrega** a configuração do Sway (alias alternativo). |
| `Super + Shift + q` | **Sair do Sway** com confirmação visual via `swaynag`. |
| `Super + Shift + Escape` | **Sair do Sway** imediatamente (sem confirmação). |

---

## 11. Daemons & Serviços Autostart

Programas que iniciam automaticamente com o Sway:

| Serviço | Descrição |
| :--- | :--- |
| `mate-settings-daemon` | Gerenciador de configurações do MATE (temas, fontes, etc). |
| `nm-applet` | Applet de rede no tray (NetworkManager). |
| `blueman-applet` | Applet de Bluetooth no tray. |
| `mate-power-manager` | Gerenciamento de energia e bateria. |
| `mate-polkit` | Agente de autenticação PolicyKit. |
| `mako` | Daemon de notificações nativo para Wayland. |
| `swayidle` + `swaylock` | Bloqueio automático de tela (5 min) e ao suspender. |

---

## 12. Módulos do Waybar

> Configuração em [`waybar/config`](file:///home/gvao/.dotfiles/sway/.config/waybar/config) e estilo em [`waybar/style.css`](file:///home/gvao/.dotfiles/sway/.config/waybar/style.css).

| Módulo | Formato | Posição |
| :--- | :--- | :--- |
| **Workspaces** | Número do workspace | Esquerda |
| **Mode** | Nome do modo ativo (ex: resize) | Esquerda |
| **Window** | Título da janela focada | Centro |
| **Pulseaudio** |  Volume% (clique → `pavucontrol`) | Direita |
| **CPU** |  Uso% | Direita |
| **Memória** |  Uso% | Direita |
| **Disco** |  Uso% (partição `/`) | Direita |
| **Bateria** | Ícone dinâmico + Capacidade% | Direita |
| **Rede** |  SSID (Wi-Fi) / 󰈀 Conectado (Ethernet) | Direita |
| **Tray** | Bandeja do sistema | Direita |
| **Relógio** |  HH:MM  DD/MM (com tooltip de calendário) | Direita |

---

## 13. Arquivos de Configuração

| Arquivo | Função |
| :--- | :--- |
| [`sway/config`](file:///home/gvao/.dotfiles/sway/.config/sway/config) | Configuração principal do Sway (keybinds, gaps, autostart). |
| [`waybar/config`](file:///home/gvao/.dotfiles/sway/.config/waybar/config) | Módulos e layout da barra de status Waybar. |
| [`waybar/style.css`](file:///home/gvao/.dotfiles/sway/.config/waybar/style.css) | Tema visual da Waybar (cores, fontes, bordas). |
| [`mako/config`](file:///home/gvao/.dotfiles/sway/.config/mako/config) | Configuração do daemon de notificações Mako. |
| [`wofi/style.css`](file:///home/gvao/.dotfiles/sway/.config/wofi/style.css) | Tema visual do launcher Wofi. |
| [`scripts/configurar_servicos_wayland.sh`](file:///home/gvao/.dotfiles/scripts/configurar_servicos_wayland.sh) | Script para mascarar autostart do Waybar/Mako fora do Sway. |

---

## 14. Dica: Convivência com COSMIC Desktop / GNOME

Se você alterna entre o Sway e outros ambientes Wayland como o **COSMIC Desktop**, o systemd pode tentar carregar o Waybar no boot desses outros ambientes. Para evitar que o Waybar e o Mako transbordem para o COSMIC, basta executar:

```bash
bash ~/.dotfiles/scripts/configurar_servicos_wayland.sh
```
*(Para reverter caso necessário: `bash ~/.dotfiles/scripts/configurar_servicos_wayland.sh --reverter`)*
