# Bash Build System (bashbs)

A simple build system for quickly setting up C projects with pre-configured `.c`, `.h`, and `Makefile` templates.

## What It Does

This tool automatically generates a new C project structure from templates, saving you from manually creating boilerplate files every time you start a new project. It replaces placeholder names in both filenames and file contents with your actual project name.

## Project Structure Created

When you run `bashbs myproject`, it creates:

```
myproject/
├── myproject.c       # Main C source file
├── myproject.h       # Header file
└── Makefile          # Pre-configured Makefile
```

## Installation

1. Clone this repository:

```bash
git clone <your-repo-url>
cd bash.bs
```

2. Make the install script executable:

```bash
chmod +x install.sh
```

3. Run the install script with sudo:

```bash
sudo ./install.sh
```

The installer will:

- Copy templates to `/var/bash.bs/templates/`
- Install the `bashbs` command to `/usr/local/bin/`
- Make it executable and available system-wide

## Usage

After installation, create a new C project from anywhere:

```bash
bashbs projectname
```

This will create a new directory called `projectname` with all the template files, properly renamed and configured.

## Requirements

- Bash shell
- sudo privileges (for installation only)
- Standard Unix utilities (sed, cp, rm)

## Uninstallation

To remove the build system:

```bash
sudo rm /usr/local/bin/bashbs
sudo rm -rf /var/bash.bs
```

## Customization

To add or modify templates, edit the files in the `templates/` directory before running the install script.
