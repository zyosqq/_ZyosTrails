# 📁 Data Structure

This document describes the **folder structure** of **ZyosTrails** and explains how the core parts of the project are organized.

---

## 🗂️ Overview

The project structure follows a clean and logical hierarchy:

```plaintext
Workspace/
 ├─ worlds/
 │   ├─ assets/
 │   ├─ WORLD_x/
 │   │   ├─ trails/
 │   │   │   ├─ TRAIL_x/
 │   │   │   │   ├─ assets/
 │   │   │   │   ├─ info/
 │   │   │   │   ├─ obby/
 │   │   │   │   │   ├─ main/
 │   │   │   │   │   ├─ checkpoints/
 │   │   │   │   │   ├─ decor/

ServerScriptService/
 ├─ Modules/
 ├─ Scripts/
 │   ├─ player/
 │   ├─ trails/

ServerStorage/
 ├─ BindableEvents/

ReplicatedStorage/
 ├─ Events/
 │   ├─ RemoteEvents/

StarterPlayer/
 ├─ StarterPlayerScripts/
 ├─ StarterCharacterScripts/
```