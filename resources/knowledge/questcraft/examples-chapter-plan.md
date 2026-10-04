# Example filled chapter plan (miniature)

Use this as the expected depth/shape of `plans/<modid>-chapter-plan.md`.
Replace ExampleTech with the real mod after research.

---

## 1. Meta

- Mod id: `exampletech`
- Chapter filename: `exampletech`
- Group: Tech
- Format: `json5` (MC 26.1+) or `snbt` (≤1.21.1)
- Icon: `exampletech:assembler`
- Default shape: `hexagon`
- Estimated quests: 18

## 2. Teaching thesis

Players leave able to build a powered assembly line: gate materials → assembler → cables/pipes → first processing loop → upgrades. Advanced multiblocks stay optional.

## 3. Systems map

1. Tools (configurator)  
2. Gate mats (widget ingot, frame)  
3. Assembler  
4. Power (generator + cables)  
5. Logistics (pipes)  
6. Processing loop  
7. Speed upgrade  
8. Optional late machine  

## 4. Softlocks & skip-noise

- Softlocks: no power, wrong cable mode, assembler starved of frames  
- Skip: stairs/slabs/decorative casings  

## 5. Stages

1. `intro`  
2. `basics`  
3. `core_machines`  
4. `power`  
5. `logistics`  
6. `loop`  
7. `upgrades`  
8. `optional_late`  

## 6. Quest graph (excerpt)

| key | stage | task | item | depends | opt | teach focus | reward idea |
|---|---|---|---|---|---|---|---|
| intro | intro | item | exampletech:assembler | — | no | Chapter goals + how deps work | xp 10 |
| configurator | intro | item | exampletech:hammer | intro | no | Configure sides/modes | xp + stick-equivalent tool mat |
| widget | basics | item | exampletech:ingot_widget | intro | no | Gate material sourcing | xp + 2 widgets |
| frame | basics | item | exampletech:frame | widget | no | Frame as hull ingredient | xp + iron |
| assembler | core_machines | item | exampletech:assembler | frame,configurator | no | GUI slots + energy | xp + frame |
| generator | power | item | exampletech:generator | intro | no | Starter power placement | xp + coal |
| cable | power | item | exampletech:pipe | generator | no | Actually a power cable; push/pull | xp + cable |
| … | … | … | … | … | … | … | … |

(Full plans must list **every** quest, not an excerpt.)

## 7. Layout

- Columns by stage, left → right  
- `intro` at (0,0) size 1.5 octagon  
- Power column above logistics if canvas gets tall  

## 8. Rewards plan

- Default: `xp` 10–25 + 1–3 on-mod components of current tier  
- Tables: `exampletech_basic`, `exampletech_mid`  
- Never reward endgame machine in early stages  

## 9. Locales

EN first; ES for `es_es` and `es_mx` identical.

## 10. Open questions

- Confirm exact item ids against installed jar version before generate.