# Nero v2 - Cyber-Cyan (Linux Port)

A Linux port of the **Nero v2 - CyberCyan** cursor theme, originally created for Windows by [**BIueGuy**](https://www.deviantart.com/biueguy), and carefully converted for Linux desktop environments by [**XBEAST1**](https://github.com/XBEAST1).

---

## 🎨 Original Theme Details

- **Creator**: [BIueGuy](https://www.deviantart.com/biueguy)
- **Platform**: Windows
- **Release Date**: March 27, 2021
- **Design Style**: Inspired by *Detroit: Become Human*
- **Sizes Available**: 32px and 48px

> *"I created Nero and took a bit of inspiration from the game Detroit: Become Human. Simple yet stylish."* — BIueGuy

---

## 🛠️ Linux Port by XBEAST1

This theme was converted and packaged for Linux by [**XBEAST1**](https://github.com/XBEAST1), with full support for X11 desktop environments and Hyprland (Wayland).

- **Converter**: [XBEAST1](https://github.com/XBEAST1)
- **Platform**: Linux (X11/Wayland)
- **Purpose**: To bring high-quality Windows cursor themes to Linux users

---

## 📦 Installation

1. **Copy the theme folder** to one of these locations:

   - Local install (for a single user):
     ```bash
     mkdir -p ~/.icons
     tar -xvzf Nero-Cyber-Cyan.tar.gz -C ~/.icons/
     ```

   - System-wide install (for all users):
     ```bash
     sudo tar -xvzf Nero-Cyber-Cyan.tar.gz -C /usr/share/icons/
     ```

2. **Apply the cursor** in your environment:

### 🖥️ GNOME

- Open **GNOME Tweaks** → *Appearance* → *Cursor*
- Select `Nero-Cyber-Cyan`

### 🧩 KDE Plasma

- Open **System Settings** → *Appearance* → *Cursors*
- Choose `Nero-Cyber-Cyan`

### 💠 Hyprland (Wayland)

Edit your `~/.config/hypr/hyprland.conf` and add:

```ini
env = XCURSOR_THEME,Nero-Cyber-Cyan
env = XCURSOR_SIZE,48
```

### ⚠️ License & Credits

- This port is for personal use only
- All artwork and original design by [**BIueGuy**](https://www.deviantart.com/biueguy)
- Linux cursor conversion by [**XBEAST1**](https://github.com/XBEAST1)