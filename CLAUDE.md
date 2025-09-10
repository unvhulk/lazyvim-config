# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a LazyVim-based Neovim configuration with extensive customizations. The configuration follows a modular architecture:

- **Base**: Built on LazyVim starter template with Lazy.nvim plugin manager
- **Entry Point**: `init.lua` bootstraps the configuration and loads `config.lazy`
- **Configuration Structure**:
  - `lua/config/`: Core configuration files (keymaps, autocmds, options, theme management)
  - `lua/plugins/`: Individual plugin configurations (40+ plugins)
  - `lua/current_theme.lua`: Auto-generated theme configuration file

## Key Components

### Theme Management System
- **Theme Manager**: `lua/config/theme-mgr.lua` provides advanced theme switching with file watching
- **Current Theme**: `lua/current_theme.lua` stores active theme (auto-generated)
- **Multiple Themes**: Extensive colorscheme collection including Catppuccin, Gruvbox, Tokyo Night, etc.
- **External Integration**: Works with external theme switcher script at `~/bin/theme-manager.sh`

### AI Integration
- **Avante.nvim**: Primary AI assistant plugin with multiple providers
- **Providers Configured**:
  - Claude Code (primary via ACP)
  - Gemini CLI (via ACP) 
  - Groq, OpenRouter, Morph
- **ACP Support**: Advanced completion protocol for Claude Code and Gemini CLI

### Terminal Integration
- **NvTerm**: Integrated terminal with float, horizontal, vertical modes
- **Keybindings**: Alt+v (vertical), Alt+b (horizontal), Alt+i (float)

## Development Commands

### Code Formatting
```bash
# Format Lua code
stylua .
```

### Plugin Management
```bash
# Update plugins (from within Neovim)
:Lazy sync
:Lazy update
```

### Theme Operations
```bash
# Reload current theme
:ThemeReload

# Set theme via command
:ThemeSet <theme> <variant>

# External theme switching (if script exists)
~/bin/theme-manager.sh <theme> <variant>
```

## Configuration Patterns

### Plugin Structure
Each plugin is configured in `lua/plugins/` following this pattern:
```lua
return {
  "plugin/name",
  dependencies = { ... },
  opts = { ... },
  config = function() ... end,
  -- LazyVim integration
}
```

### Keymap Conventions
- Leader key: `<space>`
- Mode-specific prefixes: `<leader>n` (notifications), `<leader>t` (themes)
- Terminal toggles: `Alt` combinations
- Escape: `jk` in insert/terminal modes

### AI Integration Pattern
Providers are configured in `aiIntegration.lua` with:
- API key environment variables
- ACP (Advanced Completion Protocol) support
- Multiple fallback providers

## File Watching & Auto-reload
The theme system includes sophisticated file watching:
- Monitors `~/.config/themes/current_theme` for external changes
- Auto-reloads theme configuration when files change
- Provides user commands for manual control

## Customization Guidelines

### Adding New Plugins
1. Create new file in `lua/plugins/`
2. Follow existing plugin structure
3. Use LazyVim integration patterns
4. Consider lazy loading for performance

### Theme Development
1. Add theme to `lua/plugins/colorscheme.lua`
2. Configure transparency support via `isTransparent` variable
3. Update theme manager completions if needed

### Keymap Extensions
1. Add to `lua/config/keymaps.lua`
2. Follow existing conventions and prefixes
3. Document complex keybindings

## Environment Setup
- Requires Node.js for ACP providers
- Neovide support configured with custom opacity and fonts
- Clipboard integration with system clipboard
- Word wrap enabled by default