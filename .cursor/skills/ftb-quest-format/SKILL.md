---
name: ftb-quest-format
description: >-
  Emits and validates FTB Quests SNBT/JSON5 packs: data, chapter_groups,
  chapters, reward tables, and lang files. Use when writing ftbquests files,
  choosing .snbt vs .json5, migrating quest packs, or fixing quest structure.
---

# FTB Quest Format

## MUST READ

1. [references/snbt-vs-json5.md](references/snbt-vs-json5.md)  
2. [references/quests.md](references/quests.md) — tasks/rewards/commands overview  
3. Sibling skill samples: `../ftb-quest-crew/references/examples-emit-snippets.md`  

## Format choice

| Target | Files |
|---|---|
| MC 1.21.1 and earlier | `.snbt` |
| MC 26.1+ | `.json5` |

Detect from instance metadata / jars / existing quest files. Migrate SNBT→JSON5 only when target is JSON5.

## Pack layout

```
config/ftbquests/quests/
  data.(snbt|json5)
  chapter_groups.(snbt|json5)
  chapters/<filename>.(snbt|json5)
  reward_tables/<filename>.(snbt|json5)
  lang/<locale>/chapter_group.(snbt|json5)
  lang/<locale>/chapters/<filename>.(snbt|json5)
```

## Rules

- Chapter files: ids, x/y, deps, tasks, rewards, shapes — not long prose  
- Lang files: `quest.<ID>.title|quest_subtitle|quest_desc`  
- Required locales for this crew: `en_us`, `es_es`, `es_mx` (`es_es` == `es_mx`)  
- IDs: 16-char uppercase hex  
- Item stacks: `{ id, count, components? }` on modern packs  

## Reward types (common)

`item`, `xp`, `xp_levels`, `random`, `loot`, `choice`, `command`, `toast`, `stage`, …

## Task types (common)

`item`, `checkmark`, `kill`, `dimension`, `biome`, `structure`, `observation`, `advancement`, …

## Validation checklist

- [ ] `data` + `chapter_groups` exist  
- [ ] Quest ids unique; all deps resolve; no cycles  
- [ ] Item ids look like `modid:path`  
- [ ] Every visible quest has EN+ES title/subtitle/desc  
- [ ] File extension matches format target  
- [ ] Reward tables referenced by id exist  

## In-game helpers

- `/ftbquests editing_mode true`  
- `/ftbquests reload` after file edits