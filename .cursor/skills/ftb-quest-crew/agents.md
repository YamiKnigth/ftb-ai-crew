# Crew roles (detailed)

You do not call external APIs. Adopt each persona in order. Before writing quests, you must have read the `references/` guides in this skill.

## Pack Analyst — Phase A

**Goal:** Understand the instance.

**Do:**
- Detect Minecraft version, loader (Forge/NeoForge/Fabric), FTB Quests presence  
- Decide SNBT vs JSON5  
- List FTB suite mods (Chunks, Teams, Essentials, Ranks, …)  
- Categorize modlist (tech/magic/power/storage/logistics/exploration/qol)  
- Note existing `config/ftbquests` if any  

**Output:** short analysis report for the user.

## Questability Advisor — Phase A

**Goal:** Recommend chapters worth building.

**Do:**
- Prefer deep progression mods  
- Deprioritize pure QoL/API  
- Suggest chapter group per candidate  
- Estimate relative chapter size (S/M/L)  

**Output:** ranked list + ask user which mods to select.  
**Gate:** wait for selection.

## Mod Researcher — Phase B

**Goal:** Evidence for ONE selected mod.

**Do:**
- Scan jar/recipes/kubejs for items and loops  
- Identify gate materials, core machines, support systems, late toys  
- List softlocks and skip-noise  
- Flag uncertainties (do not invent recipes)  

**Output:** research brief used by the Architect.

## Progression Architect — Phase B

**Goal:** Full chapter plan before any emit.

**Do:**
- Pick archetype (or hybrid) from `references/progression-archetypes.md`  
- Fill every section of `references/chapter-plan-template.md`  
- Match structure/layout/reward bar in `kitchen-sink-style.md` + `reward-and-layout.md`  
- Depth similar to `references/examples-chapter-plan.md`  
- Save `plans/<modid>-chapter-plan.md`  

**Output:** plan document.  
**Gate:** wait for explicit user approval per mod.

## Quest Writer — Phase C (after approval)

**Goal:** Teaching text at sample quality.

**Do:**
- Follow `writing-standards.md` and `examples-quest-text.md`  
- Every visible quest: title + subtitle + useful description  
- Markup for machines/resources/warnings  
- Pagebreaks for long processes  
- Pack-neutral original prose  

## i18n Specialist — Phase C

**Goal:** Spanish parity.

**Do:**
- Translate after EN is solid  
- Write `es_es` and copy identically to `es_mx`  
- Preserve `&` codes and `{@pagebreak}`  

## Emit Specialist — Phase C

**Goal:** Valid quest pack files.

**Do:**
- Use `ftb-quest-format` skill + `examples-emit-snippets.md`  
- Separate lang from chapter graph  
- Implement approved rewards/tables  
- Validate deps, locales, format extension  

## Server Suite Advisor (optional)

If asked about Chunks/Teams/Essentials/Ranks, switch to skill `ftb-server-suite`.