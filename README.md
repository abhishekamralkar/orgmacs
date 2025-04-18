# OrgEmacs Configuration

This repository contains my personal Emacs configuration, named **OrgEmacs**, written in Org Mode and designed to enhance productivity, streamline workflows, and provide a personalized editing experience. The configuration is modular, easy to maintain, and uses `straight.el` for package management.

## Features

- **Custom Keybindings**: Includes custom keybindings for faster navigation and editing.
- **Programming Support**: Syntax highlighting, linting, autocompletion, and language server integration for multiple programming languages.
- **Org Mode Enhancements**: Improved support for `org-mode` with custom templates, bullets, and settings.
- **Modern UI**: Features a clean and modern UI with `doom-modeline`, `dashboard`, and custom themes.
- **Performance Optimizations**: Includes `gcmh` for optimized garbage collection and other tweaks for a smoother experience.

## Supported Languages

OrgEmacs provides configurations for the following programming languages:

- **Python**: Integrated with `lsp-pyright`, `blacken`, and `pyvenv` for virtual environments and formatting.
- **Golang**: Configured with `go-mode` and `gopls` for Go development.
- **Rust**: Includes `rust-mode` and `cargo` for Rust development.
- **Clojure**: Configured with `clojure-mode`, `cider`, and `clj-refactor`.
- **Bash**: Enhanced with `company-shell` and `flycheck` for shell scripting.
- **Emacs Lisp**: Includes `slime` and `slime-company` for Lisp development.
- **JSON**: Configured with `json-mode` for editing JSON files.
- **YAML**: Adds support for YAML files with `yaml-mode`.
- **Docker**: Provides tools for managing Docker containers and images.
- **Kubernetes**: Configured with `kubernetes` and `k8s-mode` for Kubernetes resources.
- **Terraform**: Adds support for editing Terraform configuration files.

## Directory Structure

```
.emacs.d/
├── init.el               # Main configuration file (generated from emacs.org)
├── emacs.org             # Org file containing the configuration
├── .github/              # GitHub workflows and wiki files
└── README.md             # Documentation for the configuration
```

## Installation

To set up this Emacs configuration, follow these steps:

1. **Install Emacs**  
   Ensure you have Emacs installed on your system. You can download it from [GNU Emacs](https://www.gnu.org/software/emacs/) or use your system's package manager.

2. **Install Git**  
   Ensure `git` is installed on your system. Use your system's package manager to install it if necessary.

3. **Clone the Repository**  
   Clone this repository into your `.emacs.d` directory:

   ```sh
   git clone git@github.com:abhishekamralkar/myemacs.git ~/.emacs.d
   ```

4. **Run the Installation Script**  
   Navigate to the cloned directory and execute the `install.sh` script to automate the setup process:

   ```sh
   cd ~/.emacs.d
   chmod +x install.sh
   ./install.sh
   ```

5. **Start Emacs**  
   Open Emacs, and it will automatically install the required packages using `straight.el`.

6. **Verify Configuration**  
   Check if all packages are installed and working correctly. Use `M-x config-edit` to edit the configuration if needed.

## Key Features

### Programming Support

- **Python**: Integrated with `lsp-pyright`, `blacken`, and `pyvenv` for a seamless Python development experience.
- **Golang**: Configured with `go-mode` and `gopls` for Go development.
- **Rust**: Includes `rust-mode` and `cargo` for Rust development.
- **Clojure**: Configured with `clojure-mode`, `cider`, and `clj-refactor`.

### Org Mode Enhancements

- Custom bullets with `org-bullets`.
- Improved visual appearance and usability with settings for ellipsis, fontification, and indentation.

### Modern UI

- **Modeline**: Uses `doom-modeline` for a clean and informative modeline.
- **Dashboard**: Displays a customizable startup dashboard with recent files, bookmarks, and projects.
- **Themes**: Includes `ef-themes` for a modern look and feel.

### Performance Optimizations

- **Garbage Collection**: Uses `gcmh` to minimize GC interference during user activity.
- **Auto-Save**: Configured for frequent auto-saving to prevent data loss.

## Customization

- **Themes**: Place your custom themes in the `themes/` directory and load them in `emacs.org`.
- **Keybindings**: Modify keybindings in the `Custom` section of `emacs.org`.
- **Languages**: Add or update language-specific configurations in the `Languages` section of `emacs.org`.

## Contributing

Feel free to fork this repository and submit pull requests with improvements or bug fixes. Contributions are always welcome!

## License

This configuration is licensed under the [GPLv3 License](https://www.gnu.org/licenses/gpl-3.0).