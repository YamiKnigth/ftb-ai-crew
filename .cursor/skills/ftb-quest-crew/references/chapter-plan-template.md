# Chapter Plan Template (required before generation)

For every selected mod/chapter, produce a markdown plan document and get explicit user approval before writing quest files.

Suggested path:

`plans/<modid>-chapter-plan.md`

## Required sections

### 1. Meta

- Mod id / display name  
- Chapter filename  
- Chapter group (Tech, Magic, Power, …)  
- Output format (`snbt` or `json5`)  
- Icon item id  
- Default quest shape  
- Estimated quest count  

### 2. Teaching thesis

2–4 sentences: what the player should understand after finishing this chapter.

### 3. Systems map

List real systems in this mod (from research), e.g. materials → core machine → power → logistics → mid loop → upgrades → late optional.

### 4. Softlocks & skip-noise

- Softlocks to teach around (power, channels, multiblock size, dimension gate, …)  
- Item classes to skip (stairs/slabs/cosmetic spam, trivial variants)

### 5. Stage list

Ordered stages with purpose. Example shape (adapt per mod):

1. Intro / tools  
2. Gate materials  
3. First critical machine  
4. Support (power / mana / logistics)  
5. Core loop  
6. Mid systems  
7. Upgrades  
8. Optional late mastery  

### 6. Quest graph (full)

Table or bullet list. Every quest must include:

| key | stage | task type | item/target | depends on | optional? | teach focus | reward idea |

Rules:

- Intro first  
- DAG only (no cycles)  
- Optional branches must not gate the spine  
- teach focus is mechanic-oriented, not “get item”  

### 7. Layout notes

- Column/row intent per stage  
- Hub quests (larger size / distinct shape)  
- Clustering of related machines  

### 8. Rewards plan

- Per-quest default reward pattern (XP + helpful mats)  
- Chapter reward tables (early/mid/late) with example item pools from **this mod**  
- What never to reward (skip-unlock junk, unrelated mods)

### 9. Locale plan

- Confirm EN authoring then ES (`es_es` == `es_mx`)  
- Any terms kept untranslated  

### 10. Open questions

Anything uncertain (recipes, version differences). Must be resolved or explicitly accepted before generation.

## Approval gate

Do **not** generate quest files until the user says the plan for that mod is approved (e.g. “aprobado”, “100%”, “generate”).