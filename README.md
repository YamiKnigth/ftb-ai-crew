# ftb-ai-crew

Skills y knowledge de Cursor para crear **misiones FTB Quests** (y apoyar configs del FTB Suite) en modpacks/servidores terminados.

## Flujo obligatorio

1. Analizar el modpack y **recomendar** a qué mods se les pueden hacer misiones  
2. Tú eliges qué mods entran  
3. Por cada mod elegido: investigación + **plan de capítulo completo** (flujo, layout, rewards)  
4. Apruebas cada plan al 100%  
5. Solo entonces se **generan** los archivos de misiones + recompensas + traducciones EN/ES  

La estructura, diseño, estilo didáctico y disciplina de rewards deben seguir la barra de `resources/knowledge/questcraft/` (estilo kitchen-sink de alta calidad, prosa original).

## Instalar en otro repo (un comando)

Desde la raíz del otro proyecto (Windows / PowerShell):

```powershell
irm https://raw.githubusercontent.com/YamiKnigth/ftb-ai-crew/main/install-oasis.ps1 | iex
```

Linux / macOS / Git Bash:

```bash
curl -fsSL https://raw.githubusercontent.com/YamiKnigth/ftb-ai-crew/main/install.sh | bash
```

Eso copia skills (`.cursor/skills`), rules, knowledge y deja `FTB-AI-CREW.md` + `plans/`.

## Cómo usarlo

En Cursor (en el repo donde lo instalaste), pide por ejemplo:

- “Usa ftb-quest-crew: analiza este modpack y recomienda mods para misiones”
- “Planes para Mekanism y AE2” (después de elegir)
- “Plan de Mekanism aprobado al 100%, genera el capítulo”

## Skills

| Skill | Uso |
|---|---|
| `ftb-quest-crew` | Flujo principal con gates |
| `ftb-quest-format` | Formato SNBT/JSON5 y validación |
| `ftb-server-suite` | Configs Chunks/Teams/Essentials/Ranks |

## Knowledge clave

- `resources/knowledge/questcraft/kitchen-sink-style.md` — barra de estilo/estructura  
- `resources/knowledge/questcraft/chapter-plan-template.md` — plantilla del plan por mod  
- `resources/knowledge/questcraft/writing-standards.md` — textos  
- `resources/knowledge/questcraft/reward-and-layout.md` — rewards/layout  
- `resources/docs/format/snbt-vs-json5.md` — formato según versión  

Planes generados: `plans/<modid>-chapter-plan.md`

## Formato

| Versión | Archivos |
|---|---|
| MC ≤ 1.21.1 | `.snbt` |
| MC 26.1+ | `.json5` |

Locales: `en_us`, `es_es`, `es_mx` (ES idéntico).