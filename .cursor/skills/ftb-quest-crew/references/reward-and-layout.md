# Rewards, Layout, and Dependency Craft

Aligned with the kitchen-sink style bar in `kitchen-sink-style.md`.

## Dependencies

- Clear spine + optional side branches  
- Usually ≤ 2–3 parents unless a true merge gate  
- No cycles  
- Optional late toys never gate core progression  

## Layout

- Stages in columns (left → right) or rows (top → bottom)  
- Hub/intro quests: larger size, distinct shape (`octagon`, `pentagon`, …)  
- Cluster machines that belong to the same loop  
- Keep the canvas readable; prefer fewer crossings  

## Per-quest rewards

Default pattern for teaching chapters:

1. Small `xp` or `xp_levels`  
2. 1–3 helpful items from **this mod’s current tier** (components, fuel, circuits, essences)  

Avoid:

- Unrelated mod items  
- Rewards that skip the craft being taught  
- Huge stacks that trivialize the next quest  

## Reward tables

Create chapter-local tables when many quests share loot pools:

| Table idea | Contents |
|---|---|
| `<mod>_basic` | early mats / basic components |
| `<mod>_mid` | mid-tier alloys/circuits/essences |
| `<mod>_advanced` | rarer components, still on-mod |

Use `random` / `loot` / `choice` thoughtfully:

- `random`: always gives something weighted  
- `loot`: may roll nothing if that fits crate-like rewards  
- `choice`: when the player should pick a path (e.g. two valid tools)

Keep weights simple and documented in the chapter plan.

## Task mix

- Mostly `item` tasks for tutorial spines  
- `checkmark` for reading/onboarding  
- `dimension` / `structure` / `kill` / `observation` when the lesson is place- or combat-driven  

## Plan → generate

Reward tables and per-quest reward ideas must appear in the chapter plan and be user-approved before file emission.