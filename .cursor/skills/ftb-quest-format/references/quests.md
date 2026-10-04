# FTB Quests (Developer Summary)

Source concepts: [FTB Quests docs](https://docs.feed-the-beast.com/mod-docs/mods/suite/Quests/)

## Hierarchy

- **Chapter group** → organizes chapters (Tech, Magic, …)
- **Chapter** → canvas of quests for one theme/mod
- **Quest** → node with tasks, rewards, dependencies, position
- **Task** → completion condition
- **Reward** → grant on claim/complete
- **Reward table** → weighted loot used by random/loot/choice rewards

## Creating content (in-game)

1. Enable editing mode (`/ftbquests editing_mode true`)
2. Create chapter / chapter group from sidebar `+`
3. Right-click empty canvas → choose initial task type
4. Add more tasks/rewards with `+` in the quest editor
5. Reload with `/ftbquests reload` after file edits

## Item tags

Item tasks can use FTB Filter System tag filters (requires FTB Filter System + FTB XMod Compat).

## Reward types

| Type | Role |
|---|---|
| Item | Give item stack |
| Choice | Player picks one |
| All Table | Every entry from a table |
| Random | Guaranteed weighted pick |
| Loot | Weighted pick; may roll nothing |
| Command | Run command (`@p` supported) |
| Custom | No built-in effect |
| XP | Experience points |
| XP Levels | Levels |
| Advancement | Complete advancement |
| Toast | Show toast |
| Stage | Grant/revoke Game Stage |

## Common task types seen in packs

`item`, `checkmark`, `xp`, `xp_levels`, `kill`, `dimension`, `biome`, `location`, `structure`, `observation`, `advancement`, `command`, plus mod-specific tasks when integrations exist.

## Useful commands

| Command | Purpose |
|---|---|
| `/ftbquests open_book [id]` | Open book |
| `/ftbquests editing_mode [true\|false] [player]` | Toggle editor |
| `/ftbquests reload` | Reload quests/config |
| `/ftbquests change_progress <reset\|complete> …` | Debug progress |
| `/ftbquests generate_chapter_with_all_items_in_game` | Bulk item chapter (raw, not tutorial quality) |

## Chapter settings (high value)

- Icon / subtitle / tags
- Default quest shape & size
- Progression mode (linear/flexible)
- Hide dependency lines / visibility gates
- Sequential task completion
- Default consume-items for item tasks

## File formats

See `resources/docs/format/snbt-vs-json5.md`.