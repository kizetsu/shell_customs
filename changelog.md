**@ToDo:**
- [ ] add windows-compatible python prompt
- [ ] add "fuckaround" for 'project go' function
- [X] ~~add autoComplete for 'project go' function~~ (not working on windows)
- [ ] fix performance leak at prompt (windows only)
- [ ] add documentation files
  - [ ] bashrc doc
  - [ ] bash_functions doc
  - [ ] bash_aliases doc
  - [X] gitrc doc (add new contents)
  - [ ] gitrc doc (add new images)
  - [ ] git-conf doc
  - [ ] tool-installer (windows only)
- [ ] finish tests linux
- [X] finish tests Windows (git bash & ~~CygWin~~ MSYS2)
- [ ] finish tests OSX
- [ ] update README.md

#v0.2.0 (in work)
added tool-installer to get linux header and standard tools for shell use
fully reworked .gitrc file (include renaming git to gittool for more compatibility)
updated gitrc documentation
updated project command


#v0.1.1
small modifications in git extension -> better outup for git short-status
added git colordiff function
added clipdiff function
added gitrc documentation
added .bash_profile and moved includes here
reworked .bashrc for compatibility in windows
added push commands to git finish
modified git help for custom functions
modified python prompt - semi-working on windows
added some more short commands in sample gitconfig file
added sample gitignore file at sample folder
added windows SUDO command (sudo.cmd and sudo.sh files)


#v0.1.0
Reformatted whole code and split to several files
added Folder with config samples