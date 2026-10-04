# Emit snippets (structure reference)

Player text goes in `lang/`. Chapter files hold graph + tasks + rewards.

## Chapter quest node (conceptual)

```json5
{
  id: "A1B2C3D4E5F60718",
  x: 2.5,
  y: 0.0,
  shape: "hexagon",
  size: 1.0,
  dependencies: ["1111222233334444"],
  tasks: [
    {
      id: "5555666677778888",
      type: "item",
      item: { id: "exampletech:assembler", count: 1 },
    },
  ],
  rewards: [
    { id: "9999000011112222", type: "xp", xp: 15 },
    {
      id: "3333444455556666",
      type: "item",
      item: { id: "exampletech:ingot_widget", count: 1 },
      count: 2,
    },
  ],
}
```

## Lang keys

```json5
{
  "quest.A1B2C3D4E5F60718.title": "&9Assembler",
  "quest.A1B2C3D4E5F60718.quest_subtitle": "Where components become machines",
  "quest.A1B2C3D4E5F60718.quest_desc": [
    "The &9Assembler&r combines framed parts into working machines.",
    "",
    "Wire power before you scale ingredients.",
  ],
}
```

## Reward table (basic)

```json5
{
  id: "ABCD1111ABCD1111",
  order_index: 0,
  loot_size: 1,
  rewards: [
    {
      id: "R001",
      item: { id: "exampletech:ingot_widget", count: 1 },
      count: 2,
      weight: 4.0,
      random_bonus: 1,
    },
    {
      id: "R002",
      item: { id: "exampletech:frame", count: 1 },
      weight: 2.0,
    },
  ],
}
```

## Pack tree

```
config/ftbquests/quests/
  data.(snbt|json5)
  chapter_groups.(snbt|json5)
  chapters/exampletech.(snbt|json5)
  reward_tables/exampletech_basic.(snbt|json5)
  lang/en_us/chapters/exampletech.(snbt|json5)
  lang/es_es/chapters/exampletech.(snbt|json5)
  lang/es_mx/chapters/exampletech.(snbt|json5)  // identical to es_es
```

IDs: 16-char uppercase hex. Format from MC version — see format skill references.