---
name: ftb-server-suite
description: >-
  Configures and advises FTB Core Suite on Minecraft servers: Chunks, Teams,
  Essentials, Ranks, Library, XMod Compat, Ultimine, backups. Use for FTB
  server setup, claims, forceloads, teams, ranks, or essentials commands.
---

# FTB Server Suite

## MUST READ

- [references/teams-chunks-essentials-ranks.md](references/teams-chunks-essentials-ranks.md)  
- Upstream: https://docs.feed-the-beast.com/mod-docs/mods/suite/  

## Workflow

1. Detect which FTB suite jars exist in `mods/`  
2. Open the real config/serverconfig files in the instance  
3. Ask private vs public server goals  
4. Propose minimal safe defaults, then edit only with user OK  
5. Note what needs in-game verification  

## Areas

### Chunks
Max claims/forceloads, ally perms, dimension rules; optional welcome-quest tips.

### Teams
Party creation for shared quests/claims; align with quest team reward settings.

### Essentials
Homes/spawn/RTP and cooldowns; document key commands in onboarding quests if useful.

### Ranks
Staff vs player permission nodes; XMod Compat bridges when present.

### Library / XMod Compat
Shared UI/config; JEI/REI/stages/ranks integrations depending on installed set.

## Do not

- Invent config keys absent from files/docs  
- Turn Ultimine/Backups into full quest chapters unless asked