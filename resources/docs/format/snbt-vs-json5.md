# SNBT vs JSON5 for FTB Quests

## Rule used by ftb-crew

| Minecraft / FTB lineage | Quest file format |
|---|---|
| MC **1.21.1 and earlier** | **SNBT** (`.snbt`) |
| MC **26.1+** (modern FTB Library lineage) | **JSON5** (`.json5`) |

Detection order:

1. Minecraft version from instance metadata / mod jars
2. FTB Quests / FTB Library jar version hints
3. Existing files under `config/ftbquests/quests`

## Migration

If the **target** format is JSON5 and the instance still has SNBT quests:

```bash
ftb-crew migrate <server_instance> --dest output/migrated_quests --overwrite
```

Migration converts:

- `data.snbt` → `data.json5`
- `chapter_groups.snbt` → `chapter_groups.json5`
- `chapters/*.snbt` → `chapters/*.json5`
- `reward_tables/*.snbt` → `reward_tables/*.json5`
- `lang/**/*.snbt` → `lang/**/*.json5`

Item stacks are normalized toward `{ id, count, components? }`. Custom NBT → components conversion is best-effort and may need manual review.

## Layout (both formats)

```
config/ftbquests/quests/
  data.(snbt|json5)
  chapter_groups.(snbt|json5)
  chapters/
  reward_tables/
  lang/
    en_us/
    es_es/
    es_mx/
```

Modern packs keep player-facing text in `lang/`, not inside chapter quest objects.