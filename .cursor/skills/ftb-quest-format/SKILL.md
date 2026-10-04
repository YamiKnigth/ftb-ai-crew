---
name: ftb-quest-format
description: >-
  Emits and validates FTB Quests file formats (SNBT vs JSON5), chapter/lang
  layout, reward tables, and migration rules. Use when writing ftbquests files,
  choosing .snbt or .json5, migrating quest packs, or fixing quest book structure.
---

# FTB Quest Format

## Format choice

| Target | Files |
|---|---|
| MC 1.21.1 and earlier | `.snbt` |
| MC 26.1+ / modern FTB Library lineage | `.json5` |

Detect from instance metadata + `ftb-quests` jar when possible. If existing files disagree with target, migrate SNBT → JSON5 only when target is JSON5.

Full notes: [../../../resources/docs/format/snbt-vs-json5.md](../../../resources/docs/format/snbt-vs-json5.md)

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

## Separation of concerns

- **Chapter files**: ids, x/y, dependencies, tasks, rewards, shapes — not long prose
- **Lang files**: `quest.<ID>.title`, `quest.<ID>.quest_subtitle`, `quest.<ID>.quest_desc`, chapter/group titles

Locales required for this crew: `en_us`, `es_es`, `es_mx` (ES copies identical).

## IDs

Use 16-char uppercase hex ids for chapters/quests/tasks/rewards (FTB style).

## Task / reward types (common)

Tasks: `item`, `checkmark`, `kill`, `dimension`, `biome`, `structure`, `observation`, `advancement`, …

Rewards: `item`, `xp`, `xp_levels`, `random`, `loot`, `choice`, `command`, `toast`, `stage`, …

## Emit checklist

- [ ] `data` + `chapter_groups` present
- [ ] Every quest id unique; deps resolve
- [ ] Item ids look like `modid:path`
- [ ] Lang keys exist for all visible quests in EN and ES
- [ ] Extension matches format target

## FTB docs summary

See [../../../resources/docs/ftb-suite/quests.md](../../../resources/docs/ftb-suite/quests.md)