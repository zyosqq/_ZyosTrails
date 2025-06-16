# 🎮 Game Engine — ZyosTrails

This file explains which Roblox engine features and services are used to power **ZyosTrails**.

---

## Core Technologies

- **Roblox Luau Scripting**  
  All game logic is written in Roblox's Luau language for both server and client.
  
- **StreamingEnabled**  
  Optimizes performance by loading only parts of the map that players can see.

---

## Roblox Services Used

- **Players Service**  
  Manages player join/leave, data handling, and attributes.

- **ReplicatedStorage**  
  Stores RemoteEvents and shared modules for client-server communication.

- **ServerStorage**  
  Stores BindableEvents and secure server-only resources.

- **ServerScriptService**  
  Runs all main server scripts and core services.

- **RunService**  
  Handles frame updates, heartbeat events, and runtime loops.

---

## Client-Server Communication

- **RemoteEvents**  
  Used for secure client-server calls (e.g. when a player reaches a checkpoint).

- **BindableEvents**  
  Used for internal server-server or client-client communication without network calls.

- **Attributes**  
  Store player-specific and object-specific data in a clean, performant way.