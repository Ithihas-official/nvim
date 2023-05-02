# Installation Guide

- Install latest version of nvim
- Install xclip for clipboard access
- Install node and npm
- Install rust and corgo.install selene(for lua diagnostics in null-ls) with help of corgo.
- Install grep tools
- For CSS install `npm i -g vscode-langservers-extracted`
- check mason.lua for addition install options.
- for codeium to run run ':Codeium Auth'

## Python Installation

**use this method if installation fails in Mason.**

- Install python3
- Install pip3
  - install flake8 using `pip install flake8`
  - install black using `pip install black`

## Java Installation

- Enable nvim-jdtls in lua/users/plugins/lua
- Download [jdtls](http://download.eclipse.org/jdtls/milestones/)
- Install Java
- Change directories in ftplugin-java.lua
  1. **JAVA_BIN** is the directory which we direct to the bin/java folder of java we installed.
  2. **JDTLS_EQUINOX** is a jar file that is located in jdtls we have downloaded i.e., _jdtls/plugins/org.eclipse.equinox.launcher\_[version].jar_ .
  3. **JDTLS_CONFIG** is the config folder located in jdtls we have downloaded i.e., _jdtls/config\_[SYSTEM]_ where SYSTEM is the operation system we are using.
