# ChilLLLix Hub - Attach Prop Editor

A FiveM script that provides a visual 3D editor for attaching props to player bones with precise positioning and rotation control.

## 📖 Overview

This script allows players to spawn and attach props (objects) to their character's bones with a visual 3D gizmo editor. It's particularly useful for creating custom prop attachments, testing animation offsets, or generating attachment code for other scripts.

## ✨ Features

- **Visual 3D Editor**: Interactive gizmo controls using React Three.js
- **Translate & Rotate Modes**: Move and rotate props in 3D space
- **Bone Attachment**: Attach props to any player bone
- **Animation Support**: Play animations while editing
- **Export Code**: Automatically generates attachment code
- **Real-time Preview**: See changes immediately in-game

## 📦 Dependencies

### Runtime Dependencies (Required for Script to Function)

**FiveM Server Requirements:**
- **FiveM Server**: Build 2802 or higher (supports `fx_version 'cerulean'`)
- **Game**: GTA V (game 'gta5')
- **Lua**: Version 5.4 enabled (lua54 'yes')

**No External FiveM Resources Required:**
- This script is **standalone** and does not depend on any other FiveM resources
- All UI components are bundled in `web/dist/` directory
- No additional frameworks (ESX, QBCore, etc.) are needed

### Development Dependencies (Only for Building/Modifying Web UI)

If you want to modify and rebuild the web interface, you need:

**Node.js Dependencies** (from `web/package.json`):
- **React**: ^18.2.0 - UI framework
- **Three.js**: ^0.151.3 - 3D graphics library
- **@react-three/fiber**: ^8.12.2 - React renderer for Three.js
- **@react-three/drei**: ^9.65.5 - Helpers for react-three-fiber
- **TypeScript**: ^4.6.4 - Type-safe JavaScript
- **Vite**: ^3.2.0 - Build tool

**Note**: The `web/dist/` folder already contains pre-built files, so you **don't need to install Node.js or npm dependencies** unless you're modifying the web UI.

## 🚀 Installation

1. Download or clone this repository
2. Place the `chilllixhub-attachpropeditor` folder in your FiveM server's `resources` directory
3. Add `ensure chilllixhub-attachpropeditor` to your `server.cfg`
4. Restart your server

## 📝 Usage

### Command Syntax

```
/prop [modelName] [boneId] [animDict] [animName]
```

### Parameters

- **modelName** (optional): The prop model name (default: `prop_cs_burger_01`)
- **boneId** (optional): Bone ID number or bone name (default: `18905` - right hand)
- **animDict** (optional): Animation dictionary to play during editing
- **animName** (optional): Animation name from the dictionary

### Examples

```lua
-- Basic usage (spawns a burger in right hand)
/prop

-- Spawn a sandwich
/prop prop_sandwich_01

-- Spawn a phone in right hand with specific bone ID
/prop prop_npc_phone_02 18905

-- Spawn burger with eating animation
/prop prop_cs_burger_01 18905 mp_player_inteat@burger mp_player_int_eat_burger

-- Attach to a specific bone by name
/prop prop_cs_beer_bot_01 SKEL_R_Hand
```

### Controls (In-Editor)

- **Mouse**: Click and drag the gizmo arrows/circles to move/rotate the prop
- **Q Key** (44): Toggle NUI Focus (camera control)
- **E Key** (45): Switch between Translate and Rotate modes
- **Enter** (200): Finish editing and export code

## 🔧 How It Works

### Architecture

The script consists of three main components:

#### 1. **Client-Side Lua** (`client/`)

**client.lua**
- Core editor functionality
- Manages the gizmo system and entity manipulation
- Handles NUI communication
- Controls player state (freezing, positioning, camera)
- Exports attachment code when finished

**command.lua**
- Registers the `/prop` command
- Handles prop spawning
- Parses command arguments
- Calls the gizmo editor

#### 2. **Web UI** (`web/`)

Built with React, TypeScript, and Three.js:

- **ThreeComponent**: Main 3D canvas renderer
- **CameraComponent**: Syncs in-game camera with 3D scene
- **TransformComponent**: Renders interactive gizmo controls
- **NUI Events**: Handles communication between Lua and React

#### 3. **FXManifest** (`fxmanifest.lua`)

Defines the resource structure and loads client scripts and UI files.

### Technical Flow

1. **Command Execution**:
   - Player runs `/prop` command
   - Script spawns the prop model
   - Prop is attached to player's bone

2. **Editor Activation**:
   - Player is teleported to coordinates (0, 0, 1000)
   - Player is frozen in place
   - Camera moves freely while player stays still
   - NUI (web UI) is activated

3. **Visual Editing**:
   - React Three.js renders 3D gizmo at prop location
   - Player manipulates gizmo with mouse
   - Position/rotation data sent to Lua via NUI callbacks
   - Lua updates actual prop attachment in real-time

4. **Coordinate System**:
   - Uses a virtual coordinate system at Z=1000
   - Translates coordinates back to bone-relative offsets
   - Formula: `extraZ - position.z` converts back to game coords

5. **Finishing**:
   - Player presses Enter to complete editing
   - Script generates `AttachEntityToEntity` code
   - Code is printed to F8 console
   - Player is teleported back to original position
   - Prop is deleted

### Code Output

When you finish editing, the script outputs two lines:

```lua
-- Full attachment command
AttachEntityToEntity(entity, PlayerPedId(), 18905, 0.12, 0.05, 0.03, 0.0, 90.0, 0.0, true, true, false, true, 1, true)

-- Just the coordinates (for easy copying)
0.12, 0.05, 0.03, 0.0, 90.0, 0.0
```

These values can be used in your own scripts for prop attachments.

## 🎮 Common Bone IDs

- `18905` - Right Hand (SKEL_R_Hand)
- `57005` - Left Hand (SKEL_L_Hand)
- `31086` - Head (SKEL_Head)
- `24816` - Pelvis (SKEL_Pelvis)
- `24817` - Left Thigh (SKEL_L_Thigh)
- `51826` - Right Thigh (SKEL_R_Thigh)

You can use either the numeric ID or the bone name (e.g., `SKEL_R_Hand`).

## 🛠️ Development

### Building the Web UI

```bash
cd web
npm install
npm run build
```

The built files will be output to `web/dist/`.

### Technology Stack

- **Lua**: FiveM client scripting
- **React**: UI framework
- **TypeScript**: Type-safe JavaScript
- **Three.js**: 3D graphics library
- **@react-three/fiber**: React renderer for Three.js
- **@react-three/drei**: Useful helpers for Three.js
- **Vite**: Build tool and dev server

## 📄 License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 👤 Author

**ChiLLLix Hub**

---

*Made with ❤️ for the FiveM community*
