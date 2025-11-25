# NeoMacVim

Use Neovim's Qt GUI like a regular Mac app—no terminal required.

NeoMacVim wraps the official [nvim-qt](https://github.com/neovim/neovim-qt) into a macOS `.app` bundle. This means you can open it from Spotlight, Alfred, the Dock, or Finder—just like any other app.

## Is this for you?

- You want to open Neovim's GUI without typing commands every time.  
- You're used to Mac/MacVim apps and want something familiar.  
- You prefer a simple setup without extra tools or fuss.

If that sounds like you, NeoMacVim fits.

## Why use NeoMacVim?

- Launch `nvim-qt` quickly from anywhere on your Mac.  
- No compiling or repackaging needed.  
- Easy install with one script.  
- Comes with a polished app icon.  
- No Xcode or complicated setup required.

NeoMacVim makes Neovim's GUI feel at home on macOS.

---

## Quick start

Get NeoMacVim up and running in just a few steps.

### Before you start

- Make sure `nvim-qt` is installed and accessible at `/usr/local/bin/nvim-qt` (or update the script if it's somewhere else).  
- You're on a Mac with Terminal access.

### Steps

1. Clone this repo:
   ```bash
   git clone https://github.com/jpadamsonline/neo-mac-vim.git
   ```

2. Run the app creation script:
   ```bash
   cd neo-mac-vim/scripts
   chmod +x create_app.sh
   ./create_app.sh
   ```

3. Move the app to your Applications folder:
   ```bash
   mv ../NeoMacVim.app ~/Applications/
   ```

4. Open NeoMacVim from Spotlight, Dock, Alfred, Raycast, or Finder.

### What's next?

Once launched, NeoMacVim runs your existing `nvim-qt` but makes it behave like a native Mac app. If it opens without errors, you're all set!

---

## How it works

NeoMacVim wraps your installed `nvim-qt` inside a standard macOS `.app` bundle with:

- A launcher script that runs your `nvim-qt` binary.  
- An `Info.plist` file with macOS metadata.  
- A custom app icon for a native look and feel.

This means you get smooth macOS integration without repackaging or modifying `nvim-qt`.

---

## Customization

If your `nvim-qt` executable is installed in a different location, edit the launcher script (`scripts/create_app.sh`) to update the path.

To change the app icon, replace `resources/icon.icns` and rebuild the app.

---

## Troubleshooting

- If Spotlight or Finder does not show the app, run:

```bash
mdimport ~/Applications/NeoMacVim.app`
```

Or restart your Mac.


- Verify that `nvim-qt` is installed and executable at the expected path.

---

## Contribution & License

Feel free to open issues or pull requests! Your feedback and improvements are welcome.

Licensed under MIT.

---

## Credits & Links

Created by [@jpadamsonline](https://github.com/jpadamsonline)

- [Neovim Qt GUI](https://github.com/neovim/neovim-qt)  
- [Neovim](https://neovim.io/)  
- [MacVim](https://macvim-dev.github.io/) — MacVim inspired the native app experience

