---
name: ftb-server-suite
description: >-
  Advises and drafts configuration for FTB Core Suite mods on Minecraft
  servers: Chunks, Teams, Essentials, Ranks, Library, XMod Compat, Ultimine,
  backups. Use when setting up FTB servers, claim/forceload limits, teams,
  ranks permissions, essentials commands, or FTB suite configs.
---

# FTB Server Suite

Help configure FTB suite mods for a finished server instance. Prefer editing the instance’s real config/serverconfig files when the user provides a path.

## Knowledge

- Suite overview notes: [../../../resources/docs/ftb-suite/teams-chunks-essentials-ranks.md](../../../resources/docs/ftb-suite/teams-chunks-essentials-ranks.md)
- Upstream hub: https://docs.feed-the-beast.com/mod-docs/mods/suite/

## Typical advisory areas

### FTB Chunks

- Max claims / forceloads per player or team
- Ally permissions
- Dimension rules
- Optional onboarding quest pointers (claim map key, forceload)

### FTB Teams

- Party/team creation for shared quest progress / claims
- Alignment with quest `default_reward_team` settings

### FTB Essentials

- Homes, spawn, RTP, and related QoL commands
- Cooldowns/limits for public servers
- Document key commands in welcome quests when useful

### FTB Ranks

- Permission nodes for staff vs players
- Integration expectations via XMod Compat when present

### Library / XMod Compat

- Shared UI/config backbone
- JEI/REI / stages / ranks bridges depending on installed set

## Workflow

1. Detect which FTB suite jars exist in `mods/`
2. Locate config/serverconfig files actually present
3. Recommend minimal safe defaults for a public or private server (ask which)
4. Apply edits only where the user wants changes
5. Call out options that need in-game testing

## Do not

- Invent config keys that are not in the instance files or docs
- Turn Ultimine/Backups into full quest chapters unless asked