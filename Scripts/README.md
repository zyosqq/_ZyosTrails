# 📜 Scripts

This file explains the purpose and structure of all main scripts used in **ZyosTrails**.

---

## Structure

The `Scripts/` folder is divided into logical parts to keep server and client logic organized:

```plaintext
Scripts/
├─ ServerScripts/
├─ ClientScripts/
├─ Modules/
├─ Events/
```


---

## Description

### **ServerScripts/**
Contains all server-side logic that runs game mechanics and controls gameplay.

### **ClientScripts/**
Contains client-side scripts, such as:

### **Modules/**
Reusable ModuleScripts that define core systems:

- `checkpointService`
- `trailService`
- `dataService`
- `playerService`
- `zcoinsService`
- `zxpService`

These modules are required by server scripts and manage the main game features.

---

### **Events/**
Organizes all RemoteEvents for client-server communication.
