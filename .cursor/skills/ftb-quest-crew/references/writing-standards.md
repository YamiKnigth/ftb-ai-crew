# Writing Standards for FTB Quests

Also follow [kitchen-sink-style.md](kitchen-sink-style.md) for chapter pacing and structural polish.

## Goal

Every visible quest is a short lesson. The item task proves the lesson was practiced.

## Required fields

- `title` — short, scannable, may use color markup  
- `quest_subtitle` — one-line promise (“Starter power”, “Tier 2 processing”)  
- `quest_desc` — multipage when needed; explain why, how, and what fails  

## Markup

Common FTB codes:

- `&a` green, `&c` red, `&6` gold, `&e` yellow, `&d` light purple, `&b` aqua, `&7` gray  
- `&l` bold, `&o` italic, `&r` reset  
- `{@pagebreak}` for long guides  

Use color to highlight machine names, resources, and warnings — not every word.

## Voice

- Direct second person (“place”, “pipe”, “open the GUI”)  
- Call out traps (wrong cable mode, dump buttons, hollow multiblocks, missing channels)  
- Prefer concrete slot/side/power language over fluff  
- Keep pack-neutral: do not mention other commercial packs  

## Length heuristics

- Intro quest: 3–6 short paragraphs or pagebreaks  
- Machine quest: what it does + how to feed/power + one common mistake  
- Material quest: how to make it + what later crafts burn it  
- Avoid one-line descriptions for non-checkmark quests  

## Localization

Always author `en_us`, then `es_es` and `es_mx` with identical Spanish text. Preserve markup codes. Keep mod/item ids readable.