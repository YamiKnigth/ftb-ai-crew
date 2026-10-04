# Example quest text (ORIGINAL samples — match this quality)

These samples show the voice, markup density, and teaching depth expected.
Do **not** copy third-party pack wording. Invent new text per mod.

## EN — intro hub

```
title: &dExampleTech&r
subtitle: Start your factory the right way
quest_desc:
- &dExampleTech&r turns raw resources into automated production lines.
- ""
- This chapter teaches materials, the first machines, power, and logistics before advanced loops.
- ""
- Follow the dependency lines. Each quest explains a system, then asks you to craft the proof item.
```

## EN — core machine

```
title: &9Assembler
subtitle: Where components become machines
quest_desc:
- The &9Assembler&r combines framed parts into working machines.
- ""
- &4Red&r slots take ingredients. &9Blue&r is output. &aGreen&r is energy.
- ""
- Common mistake: cables set to the wrong mode. Use your configurator and confirm extract/insert before blaming the recipe.
```

## EN — process / multipage

```
title: &dEnrich&r then &6Smelt
subtitle: Tier 1 processing loop
quest_desc:
- Tier 1 is simple on purpose: &dEnrich&r ores into dust, then &6Smelt&r into ingots.
- ""
- Build a short line with power first. If the smelter starves, fix cables before adding more machines.
- "{@pagebreak}"
- When this loop feels automatic, unlock the next processing tier. Do not skip support infrastructure.
```

## ES — same quests (es_es == es_mx)

```
title: &dExampleTech&r
subtitle: Empieza tu fábrica bien
quest_desc:
- &dExampleTech&r convierte recursos en líneas de producción automatizadas.
- ""
- Este capítulo enseña materiales, las primeras máquinas, energía y logística antes de los bucles avanzados.
- ""
- Sigue las líneas de dependencia. Cada misión explica un sistema y luego pide el objeto que lo demuestra.
```

```
title: &9Ensambladora
subtitle: Donde los componentes se vuelven máquinas
quest_desc:
- La &9Ensambladora&r combina piezas con marco para crear máquinas funcionales.
- ""
- Ranuras &4rojas&r: entradas. &9Azul&r: salida. &aVerde&r: energía.
- ""
- Error común: cables en el modo incorrecto. Usa el configurador y confirma extract/insert antes de culpar a la receta.
```

## Anti-patterns (reject these)

- `"Get an Assembler."` with no teaching  
- Walls of lore with no setup steps  
- Rewards that skip the craft just taught  
- Mentioning other commercial modpacks by name