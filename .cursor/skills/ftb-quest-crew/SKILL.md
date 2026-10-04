---
name: ftb-quest-crew
description: >-
  FTB Quests crew in Cursor: analyze a modpack/server, recommend questable
  mods, wait for user selection, write a full chapter plan per mod for
  approval, then generate SNBT/JSON5 quests and rewards. Use for FTB Quests,
  misiones FTB, ftbquests, quest chapters, or tutorial quest generation.
---

# FTB Quest Crew

In-Cursor expert crew. No external API keys. No generation until plans are approved.

## Quality target

Structure, pacing, layout grammar, teaching voice, and reward discipline must match the kitchen-sink style bar:

- [kitchen-sink-style.md](../../../resources/knowledge/questcraft/kitchen-sink-style.md)
- [writing-standards.md](../../../resources/knowledge/questcraft/writing-standards.md)
- [reward-and-layout.md](../../../resources/knowledge/questcraft/reward-and-layout.md)

Original prose only. Do not copy third-party commercial quest text.

## Hard workflow (do not skip gates)

```
FTB Quest Crew Progress:
- [ ] Phase A — Analyze modpack + recommend mods
- [ ] GATE: user selects which mods get chapters
- [ ] Phase B — For each selected mod: research + full chapter plan
- [ ] GATE: user approves each plan at 100%
- [ ] Phase C — Generate quest files + rewards + EN/ES locales
- [ ] Self-validate emit
```

### Phase A — Analyze + recommend

Inspect the modpack/server root (`mods/`, metadata, existing `config/ftbquests`, FTB suite configs).

Deliver:

1. MC version, loader, quest format (`snbt` vs `json5`) — see [snbt-vs-json5.md](../../../resources/docs/format/snbt-vs-json5.md)
2. FTB suite mods present
3. Ranked list of questable mods with reasons and suggested chapter group

Read: [chapter-taxonomy.md](../../../resources/knowledge/questcraft/chapter-taxonomy.md)

**STOP.** Ask the user which mods to take forward. Do not plan chapters for unselected mods.

### Phase B — Chapter plan per selected mod

For **each** selected mod, one at a time (or clearly separated docs):

1. Research evidence (jars/recipes/kubejs + optional `resources/knowledge/mods/<modid>.md`)
2. Write a complete chapter plan using [chapter-plan-template.md](../../../resources/knowledge/questcraft/chapter-plan-template.md)
3. Save under `plans/<modid>-chapter-plan.md` when possible
4. Include full quest graph, layout notes, and rewards/tables plan

Read also:

- [progression-archetypes.md](../../../resources/knowledge/questcraft/progression-archetypes.md)
- [quality-bar.md](../../../resources/knowledge/questcraft/quality-bar.md)
- [agents.md](agents.md)

**STOP after each plan** (or after the batch if the user wants all plans first).  
Do not generate quest files until the user explicitly approves that mod’s plan (e.g. “aprobado”, “100%”, “generate X”).

### Phase C — Generate (only approved plans)

For each approved mod:

1. Emit chapter + reward tables + lang in the correct format
2. Locales: `en_us`, `es_es`, `es_mx` (`es_es` == `es_mx`)
3. Rewards follow the approved plan and [reward-and-layout.md](../../../resources/knowledge/questcraft/reward-and-layout.md)
4. Self-validate: deps DAG, locale parity, format match, teaching text present

Format skill: `ftb-quest-format`  
Server suite config (separate): `ftb-server-suite`

## Output locations

- Plans: `plans/<modid>-chapter-plan.md`
- Quests: instance `config/ftbquests/quests/` or a staging path the user chooses

## Roles

See [agents.md](agents.md). Play Analyst → Advisor → Researcher → Architect → (approval) → Writer/i18n → Emit.