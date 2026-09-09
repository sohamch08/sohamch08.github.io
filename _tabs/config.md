---
layout: page
icon: fa-solid fa-terminal
order: 5
permalink: /configs/
title: My Configs
---
<link rel="stylesheet" href="{{ '/assets/css/config.css' | relative_url }}">

<nav class="config-navigation" aria-label="On this page">
  <a href="#zsh">Zsh</a>
  <a href="#neovim">Neovim</a>
</nav>

<h2 id="zsh" class="config-section-title">Zsh</h2>

I keep my Zsh startup files in `~/.config/zsh` rather than directly in my home directory. To make Zsh find them
there, I added the following to `/etc/zshenv`:

```zsh
if [[ -z "$XDG_CONFIG_HOME" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

### Structure

Since `/etc/zshenv` is read first, `ZDOTDIR` tells Zsh to load `.zshenv`, `.zprofile`, and `.zshrc` from the new
location. My `.zshrc` handles history, shell behavior, and completion, then sources focused files for aliases, fuzzy
finding, plugins, bindings, and the prompt. Environment variables and platform-specific paths for Linux and macOS
remain in `.zshenv`.

### Prompt and command-line tools

I use [Starship](https://starship.rs/) for a single-line prompt showing the current directory, operating system, Git
status, and relevant language versions. The Rust-based [eza](https://github.com/eza-community/eza) replaces `ls`,
while [zoxide](https://github.com/ajeetdsouza/zoxide) replaces `cd` and learns my frequently used directories. I pair
them with [fzf](https://github.com/junegunn/fzf) for interactive file, directory, history, and Git search, using `fd`,
`bat`, and `tree` for results and previews.

<h3 id="zsh-plugins">Plugins</h3>

I do not use a plugin manager. A small function in `plugins.zsh` clones missing plugin repositories and sources them;
I update them myself with `zplugin-update`. My current plugins provide autosuggestions, substring history search, vi
mode, and fast syntax highlighting.

The complete configuration is available in my [Zsh repository](https://github.com/sohamch08/zsh).

<h2 id="neovim" class="config-section-title">Neovim</h2>

### Structure and appearance

My Neovim configuration is written in Lua and follows the same modular approach. The top-level `init.lua` loads core
options and mappings, bootstraps [lazy.nvim](https://github.com/folke/lazy.nvim), and imports separate plugin
specifications from `lua/plugins`. This keeps the startup path simple and makes individual parts easy to change.

I use a transparent [Rose Pine Moon](https://github.com/rose-pine/neovim) theme with relative line numbers,
four-space indentation, persistent undo, smart-case search, system-clipboard integration, and predictable split
placement.

<h3 id="neovim-plugins">Plugins</h3>

[Oil](https://github.com/stevearc/oil.nvim) is my default file explorer; it presents directories as editable buffers,
shows hidden files, and sends deleted items to the system trash. [Snacks](https://github.com/folke/snacks.nvim)
provides file and text search, Git pickers, previews, and LazyGit integration, while
[Flash](https://github.com/folke/flash.nvim) provides quick label-based movement.

I use selected `mini.nvim` modules for comments, surroundings, file browsing, whitespace, and split/join operations.
`nvim-autopairs` adds syntax-aware pairs, `todo-comments.nvim` highlights and searches annotations, and TreeSJ switches
Tree-sitter structures between compact and expanded forms.

The complete configuration is available in my
[Neovim configuration repository](https://github.com/sohamch08/neovim-config).
