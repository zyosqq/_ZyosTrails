# 📁 Data Structure

This document describes the **folder structure** of **ZyosTrails** and explains how the core parts of the project are organized.

---

## 🗂️ Overview

The project structure follows a clean and logical hierarchy:

### 📂 Workspace

- [Workspace/](Workspace/)
  - [assets/](Workspace/assets/)
  - [WORLD_x/](Workspace/WORLD_x/)
    - [assets/](Workspace/WORLD_x/assets/)
    - [trails/](Workspace/WORLD_x/trails/)
      - [TRAIL_x/](Workspace/WORLD_x/trails/TRAIL_x/)
        - [assets/](Workspace/WORLD_x/trails/TRAIL_x/assets/)
        - [info/](Workspace/WORLD_x/trails/TRAIL_x/info/)
        - [obby/](Workspace/WORLD_x/trails/TRAIL_x/obby/)
          - [main/](Workspace/WORLD_x/trails/TRAIL_x/obby/main/)
          - [checkpoints/](Workspace/WORLD_x/trails/TRAIL_x/obby/checkpoints/)
          - [decor/](Workspace/WORLD_x/trails/TRAIL_x/obby/decor/)

### 📂 ServerScriptService

- [Modules/](ServerScriptService/Modules/)
- [Scripts/](ServerScriptService/Scripts/)
  - [player/](ServerScriptService/Scripts/player/)
  - [trails/](ServerScriptService/Scripts/trails/)

### 📂 ServerStorage

- [BindableEvents/](ServerStorage/BindableEvents/)

### 📂 ReplicatedStorage

- [Events/](ReplicatedStorage/Events/)
  - [RemoteEvents/](ReplicatedStorage/Events/RemoteEvents/)

### 📂 StarterPlayer

- [StarterPlayerScripts/](StarterPlayer/StarterPlayerScripts/)
- [StarterCharacterScripts/](StarterPlayer/StarterCharacterScripts/)
```

