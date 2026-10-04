---
name: ftb-quest-crew
description: >-
  FTB Quests crew in Cursor: analyze a modpack/server, recommend questable
  mods, wait for user selection, write a full chapter plan per mod for
  approval, then generate SNBT/JSON5 quests and rewards with kitchen-sink
  teaching quality. Use for FTB Quests, misiones FTB, ftbquests, quest
  chapters, tutorial quests, or reward tables.
---

# FTB Quest Crew

In-Cursor expert crew for high-quality **teaching** FTB Quests.
No external API keys. **No file generation until each chapter plan is user-approved.**

## MUST READ before designing or writing

Read these files in this skill (do not skip):

1. [references/kitchen-sink-style.md](references/kitchen-sink-style.md) — structure / layout / rewards bar  
2. [references/writing-standards.md](references/writing-standards.md) — titles, markup, EN/ES  
3. [references/progression-archetypes.md](references/progression-archetypes.md) — pick a flow per mod type  
4. [references/chapter-plan-template.md](references/chapter-plan-template.md) — mandatory plan sections  
5. [references/reward-and-layout.md](references/reward-and-layout.md) — deps, XP, tables  
6. [references/examples-quest-text.md](references/examples-quest-text.md) — quality samples  
7. [references/examples-chapter-plan.md](references/examples-chapter-plan.md) — plan depth sample  
8. [references/examples-emit-snippets.md](references/examples-emit-snippets.md) — file shape  
9. [agents.md](agents.md) — role playbook  

Also: [references/chapter-taxonomy.md](references/chapter-taxonomy.md), [references/quality-bar.md](references/quality-bar.md).

For SNBT/JSON5 emit details use skill `ftb-quest-format` (its `references/`).

## Non-negotiables

- Reason **per mod** — never paste one ladder onto every mod  
- Quests teach mechanics; item tasks prove the lesson  
- Match kitchen-sink **structure, pacing, layout grammar, markup voice, reward discipline**  
- Original prose only (samples in references are style guides, not copy-paste libraries)  
- Locales: `en_us` + `es_es` + `es_mx` with `es_es == es_mx`  
- Format: `.snbt` on MC ≤ 1.21.1, `.json5` on MC 26.1+  

## Hard workflow (gates)

```
FTB Quest Crew Progress:
- [ ] Phase A — Analyze modpack + recommend mods
- [ ] GATE: user selects which mods get chapters
- [ ] Phase B — Research + FULL chapter plan per selected mod
- [ ] GATE: user approves each plan at 100%
- [ ] Phase C — Generate quests + reward tables + EN/ES
- [ ] Self-validate
```

### Phase A — Analyze + recommend

Inspect modpack/server: `mods/`, metadata, `config/ftbquests`, FTB suite configs.

Deliver:

1. MC version, loader, quest format target  
2. FTB suite mods present  
3. Ranked questable mods (why + suggested chapter group)  

**STOP** for user selection. Do not plan unselected mods.

### Phase B — Chapter plan (per selected mod)

1. Research jars/recipes/kubejs/datapacks (+ optional `resources/knowledge/mods/<modid>.md` if present)  
2. Choose archetype from `progression-archetypes.md`  
3. Write complete plan via `chapter-plan-template.md`  
4. Save `plans/<modid>-chapter-plan.md`  
5. Plan must include **full quest graph**, layout, and rewards/tables — see `examples-chapter-plan.md` for depth  

**STOP** until user approves that plan (“aprobado”, “100%”, “generate X”).

### Phase C — Generate (approved only)

1. Emit chapter + reward tables + lang (`ftb-quest-format`)  
2. Text quality ≥ `examples-quest-text.md`  
3. Rewards follow approved plan + `reward-and-layout.md`  
4. Validate: DAG deps, locale parity, format match, no empty teaching text  

## Output paths

- Plans: `plans/<modid>-chapter-plan.md`  
- Quests: `config/ftbquests/quests/` (or user staging path)  

## Roles

Follow [agents.md](agents.md): Analyst → Advisor → Researcher → Architect → (approval) → Writer/i18n → Emit.