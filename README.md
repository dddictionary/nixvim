# Nixvim Configuration

A modular Neovim configuration built with [nixvim](https://github.com/nix-community/nixvim), providing a fully reproducible and declarative editor setup.

## Features

- Modular configuration structure organized by functionality
- LSP support with language servers
- Treesitter syntax highlighting
- Code completion and formatting
- Custom keybindings and UI enhancements
- Cross-platform support (Linux and macOS, both x86_64 and ARM64)

## Prerequisites

You need to have the Nix package manager installed on your system.

### Installing Nix

**For Linux and macOS:**

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Or use the official installer:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

After installation, restart your shell or source the Nix profile:

```bash
. /etc/profile
```

### Enable Flakes

If you're using an older Nix installation, ensure flakes are enabled by adding this to `~/.config/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

## Installation

### Option 1: Install to Your Profile

Clone this repository and install the nixvim binary to your Nix profile:

```bash
git clone <repository-url>
cd nixvim
nix profile install .
```

This will make the `nvim` command available in your PATH.

### Option 2: Run Without Installing

You can try the configuration without installing:

```bash
nix run .
```

### Option 3: Build Only

To build the configuration without installing:

```bash
nix build .
./result/bin/nvim
```

## Usage

After installation, simply run:

```bash
nvim
```

## Making Changes

### Modify Configuration

The configuration is organized in the `config/` directory:

- `config/nixvim.nix` - Main configuration entry point
- `config/options.nix` - Vim options
- `config/keymaps.nix` - Key bindings
- `config/plugins/` - Plugin configurations organized by category

Edit any of these files to customize your setup.

### Deploy Changes

After making changes to the configuration:

1. **Update your profile installation:**

   ```bash
   nix profile upgrade nixvim
   ```

2. **Or reinstall if the upgrade doesn't work:**

   ```bash
   nix profile remove nixvim
   nix profile install .
   ```

### Verify Configuration

Before deploying, you can check if your configuration is valid:

```bash
nix flake check .
```

## Uninstallation

To remove nixvim from your profile:

```bash
nix profile remove nixvim
```

To completely remove Nix from your system, follow the [official uninstallation guide](https://nixos.org/manual/nix/stable/installation/uninstall).

## Project Structure

```
.
├── flake.nix           # Flake configuration and package definition
├── flake.lock          # Locked dependency versions
└── config/
    ├── default.nix     # Configuration entry point
    ├── nixvim.nix      # Main nixvim configuration
    ├── options.nix     # Vim options
    ├── keymaps.nix     # Key bindings
    ├── extra.nix       # Extra configurations
    └── plugins/        # Plugin configurations
        ├── completion.nix
        ├── editor.nix
        ├── formatter.nix
        ├── lsp.nix
        ├── starter.nix
        ├── treesitter.nix
        └── ui.nix
```

## Troubleshooting

### Profile Commands Not Working

If `nix profile upgrade` doesn't recognize `nixvim`, list your installed profiles:

```bash
nix profile list
```

Use the index number instead:

```bash
nix profile upgrade <index>
```

### Configuration Errors

If you encounter errors after making changes:

1. Run `nix flake check .` to validate your configuration
2. Check the error messages for syntax issues in your `.nix` files
3. Revert recent changes if necessary

### Nix Command Not Found

Ensure Nix is properly sourced in your shell:

```bash
. /etc/profile
```

Or add to your shell configuration (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
if [ -e /etc/profile.d/nix.sh ]; then . /etc/profile.d/nix.sh; fi
```

## Resources

- [Nixvim Documentation](https://nix-community.github.io/nixvim/)
- [Nix Package Manager](https://nixos.org/manual/nix/stable/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)

## License

[Your License Here]
