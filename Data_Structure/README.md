# 📁 Data Structure

This document describes the **folder structure** of **ZyosTrails** and explains how the core parts of the project are organized.

---

## 🗂️ Overview

The project structure follows a clean and logical hierarchy:

```plaintext
Workspace/
 ├─ worlds/
 │   ├─ assets/
 │   ├─ WORLDx/
 │   │   ├─ trails/
 │   │   │   ├─ TRAILx/
 │   │   │   │   ├─ assets/
 │   │   │   │   ├─ info/
 │   │   │   │   ├─ obby/
 │   │   │   │   │   ├─ main/
 │   │   │   │   │   ├─ checkpoints/

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

