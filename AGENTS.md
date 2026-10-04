# FTB AI Crew

Cursor skills + knowledge for FTB Quests and FTB server suite work.

## Gated quest workflow

1. **Analyze modpack** and **recommend** questable mods  
2. **User selects** which mods get chapters  
3. For each selected mod: **research + full chapter plan** (flow, layout, rewards)  
4. **User approves** each plan at 100%  
5. **Only then** generate quest files + rewards + `en_us`/`es_es`/`es_mx`

Style/structure/rewards must follow `resources/knowledge/questcraft/` (kitchen-sink style bar). Original prose only.

## Skills

| Skill | Role |
|---|---|
| `ftb-quest-crew` | Main gated workflow |
| `ftb-quest-format` | SNBT/JSON5 emit + validation |
| `ftb-server-suite` | Chunks/Teams/Essentials/Ranks configs |

## Do not

- Generate quest files before plan approval  
- Force one ladder onto every mod  
- Require external API keys for the crew to work