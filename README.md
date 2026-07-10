# Radius Viewer

Script utilitário para admins — desenha um círculo (marker) ao redor do jogador, indicando visualmente um raio no mapa.

---

<img width="50%" height="50%" alt="radius1" src="https://github.com/user-attachments/assets/adc5eb41-d568-43cd-a058-7773f9a7412a" /> <img width="50%" height="50%" alt="radius2" src="https://github.com/user-attachments/assets/fff4c73c-edb5-49db-9df7-4a80b2db3377" />

## 🇧🇷 Português (Brasileiro)

### Instalação

1. Coloque a pasta `radius-viewer` dentro de `resources/[utils]/`
2. Adicione `ensure radius-viewer` no seu `server.cfg`

### Configuração

Edite `config.lua`:

| Parâmetro | Tipo | Padrão | Descrição |
|---|---|---|---|
| `Config.Command` | string | `'radius'` | Comando para ativar/desativar |
| `Config.defaultlang` | string | `'pt-br'` | Idioma (`'pt-br'` ou `'en'`) |
| `Config.Notify` | string | `'redm-ui'` | Sistema de notificação (`'redm-ui'`, `'oxlib'` ou `'chat'`) |
| `Config.RequirePermission` | bool | `false` | Exigir permissão de admin |
| `Config.AdminPermission` | string | `'admin'` | Permissão ACE necessária |
| `Config.MaxRadius` | number | `1000` | Raio máximo permitido |

### Uso

```
/radius 50      → Mostra círculo de 50m
/radius         → Desativa a visualização
```

### Marker (Config.Marker)

| Parâmetro | Descrição |
|---|---|
| `Type` | Tipo do marker (hash do native) |
| `R, G, B, Alpha` | Cor e transparência |
| `ScaleZ` | Escala no eixo Z (altura) |
| `GroundOffset` | Distância do chão |
| `Bob` | Animação de ida e volta |
| `FaceCamera` | Marker sempre olha para a câmera (billboard) |
| `Rotate` | Rotação do marker |

### Sistemas de Notificação

- **redm-ui** — Usa `l-redm-ui` (padrão do projeto)
- **oxlib** — Usa `ox_lib`
- **chat** — Fallback via chat do jogo

### Estrutura de Idiomas

Arquivos em `languages/`:
- `pt-br_lang.lua` — Português
- `en_lang.lua` — Inglês

Para adicionar um novo idioma, crie um arquivo `xx_lang.lua` seguindo o padrão:

```lua
Locales["xx"] = {
    title = 'Radius Viewer',
    no_permission = 'Your translation here',
    radius_disabled = 'Your translation here',
    radius_usage = 'Use /%s 1-%s.',
    radius_active = 'Viewing radius of %.1fm.',
}
```

E defina `Config.defaultlang = 'xx'`.

---

## 🇺🇸 English

### Installation

1. Place the `radius-viewer` folder inside `resources/[utils]/`
2. Add `ensure radius-viewer` to your `server.cfg`

### Configuration

Edit `config.lua`:

| Parameter | Type | Default | Description |
|---|---|---|---|
| `Config.Command` | string | `'radius'` | Command to toggle on/off |
| `Config.defaultlang` | string | `'pt-br'` | Language (`'pt-br'` or `'en'`) |
| `Config.Notify` | string | `'redm-ui'` | Notification system (`'redm-ui'`, `'oxlib'`, or `'chat'`) |
| `Config.RequirePermission` | bool | `false` | Require admin permission |
| `Config.AdminPermission` | string | `'admin'` | Required ACE permission |
| `Config.MaxRadius` | number | `1000` | Maximum allowed radius |

### Usage

```
/radius 50      → Shows 50m radius circle
/radius         → Disables the display
```

### Marker (Config.Marker)

| Parameter | Description |
|---|---|
| `Type` | Marker type (native hash) |
| `R, G, B, Alpha` | Color and transparency |
| `ScaleZ` | Scale on Z axis (height) |
| `GroundOffset` | Distance from ground |
| `Bob` | Bouncing animation |
| `FaceCamera` | Marker always faces the camera (billboard effect) |
| `Rotate` | Marker rotation |

### Notification Systems

- **redm-ui** — Uses `l-redm-ui` (project standard)
- **oxlib** — Uses `ox_lib`
- **chat** — Fallback via in-game chat

### Language Structure

Files in `languages/`:
- `en_lang.lua` — English
- `pt-br_lang.lua` — Portuguese (Brazil)

To add a new language, create a `xx_lang.lua` file following this pattern:

```lua
Locales["xx"] = {
    title = 'Radius Viewer',
    no_permission = 'Your translation here',
    radius_disabled = 'Your translation here',
    radius_usage = 'Use /%s 1-%s.',
    radius_active = 'Viewing radius of %.1fm.',
}
```

Then set `Config.defaultlang = 'xx'`.
