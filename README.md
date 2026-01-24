# OrgMacs - Modular Emacs Configuration

A modular, org-based Emacs configuration that's easy to maintain and customize.

## 📁 Directory Structure

```
~/.emacs.d/
├── init.el                    # Main entry (auto-generated)
├── early-init.el              # Early init (auto-generated)
├── init.org                   # Main orchestrator
├── config/
│   ├── core.org              # Core settings & package manager
│   ├── ui.org                # UI, theme, modeline, dashboard
│   ├── editing.org           # Editing tools & completion
│   ├── programming.org       # Programming tools (LSP, Git, etc.)
│   ├── languages.org         # Language-specific configs
│   ├── infrastructure.org    # DevOps tools
│   ├── org-mode.org          # Org-mode configuration
│   └── files.org             # File management (Dired)
└── custom.el                 # Auto-generated custom settings
```

## 🚀 Installation

### Quick Setup

Run the setup script to generate all `.el` files from `.org` files:

```bash
./setup.sh
```

This will:
1. Tangle all `.org` files to generate corresponding `.el` files
2. Create the necessary directory structure
3. Initialize your Emacs configuration

Then start Emacs:

```bash
emacs
```

## 📝 Usage

### Editing Configuration

1. Open any `.org` file in the config
2. Make your changes
3. Save (auto-tangle will generate `.el` files)
4. Reload Emacs or run `M-x config-reload`

### Quick Access

- `C-c e` - Edit main configuration (opens init.org)
- `C-c r` - Reload configuration

### Enabling/Disabling Modules

In `init.el` (tangled from `init.org`), comment out modules you don't want:

```emacs-lisp
;; (require 'infrastructure-config)  ; Disable DevOps tools
```

## 🔧 Customization

### Adding a New Module

1. Create `config/my-module.org`
2. Add header with tangle target:

```org
#+TITLE: My Module
#+PROPERTY: header-args:emacs-lisp :tangle ./config/my-module-config.el :mkdirp yes

* Header
#+begin_src emacs-lisp
;;; my-module-config.el --- Description -*- lexical-binding: t -*-
;;; Code:
#+end_src

* Your Configuration
#+begin_src emacs-lisp
;; Your code here
#+end_src

* Footer
#+begin_src emacs-lisp
(provide 'my-module-config)
;;; my-module-config.el ends here
#+end_src
```

3. Add to `init.org`:
```emacs-lisp
(require 'my-module-config)
```

### Modifying Existing Config

Just edit the relevant `.org` file and save. The `.el` files will be regenerated automatically.

## 📦 Package Management

All packages use `use-package` with `:ensure t` by default (set in `core.org`).

### Installing New Packages

Add to appropriate module:

```org
#+begin_src emacs-lisp
(use-package package-name
  :config
  ;; your config
  )
#+end_src
```

## 🎯 Features

- **Modular**: Each concern in its own file
- **Documented**: Org-mode makes configuration self-documenting
- **Maintainable**: Easy to enable/disable features
- **Portable**: Share specific modules with others
- **Literate**: Mix documentation with code

## 📚 Module Overview

| Module | Purpose |
|--------|---------|
| `core.org` | Package manager, basic settings, performance |
| `ui.org` | Theme, modeline, dashboard, fonts |
| `editing.org` | Company, Helm, snippets, editing tools |
| `programming.org` | LSP, Magit, Projectile, syntax checking |
| `languages.org` | Python, Go, Rust, Clojure, etc. |
| `infrastructure.org` | Docker, K8s, Terraform, JSON/YAML |
| `org-mode.org` | Org-mode enhancements |
| `files.org` | Dired and file management |

## 🛠️ Prerequisites

### Required

- Emacs 27.1 or higher
- Git

### Optional Tools

#### Python Development
```bash
pip3 install pyright black
```

#### Go Development
```bash
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
```

#### Rust Development
```bash
rustup component add rust-analyzer
```

#### General Tools
```bash
# macOS
brew install ripgrep fzf

# Ubuntu/Debian
apt install ripgrep fzf

# Arch
pacman -S ripgrep fzf
```

## 🔍 Troubleshooting

### Packages not installing

```emacs-lisp
M-x package-refresh-contents
M-x package-install-selected-packages
```

### Tangling not working

Ensure org file has:
```org
#+PROPERTY: header-args:emacs-lisp :tangle ./path/to/file.el :mkdirp yes
```

### Module not loading

Check that:
1. `.el` file was generated in correct location
2. Module is required in `init.el`
3. No syntax errors in org file

## 📄 License

GPL v3 - Same as GNU Emacs

## 🤝 Contributing

Feel free to:
- Fork and customize
- Share your modules
- Report issues
- Suggest improvements

---

**Happy Hacking! 🎉**