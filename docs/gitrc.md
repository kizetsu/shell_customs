#Functions
git cp<br/>
git init<br/>
git start<br/>
git publish<br/>
git finish<br/>
git short-status<br/>
git secure-checkout<br/>
git colordiff<br/>
githelp<br/>
gadd<br/>
glone<br/>
<br/><br/>
### Aliases
status      (alias for) git status<br/>
gitst		(alias for) git short-status<br/>
gitco		(alias for) git secure-checkout<br/>
start       (alias for) git start<br/>
publish     (alias for) git publish<br/>
finish      (alias for) git finish<br/>
init-flow	(alias for) git init flow<br/>
<br/>
<br/>
###git cp
This command combines 'git commit -m' and 'git push'.<br/>
Syntax: git cp COMMIT_MSG<br/>
![git cp example](http://i.imgur.com/ubtco7Q.png)

###git init
This command extends the standard 'git init' command.<br/>
parameters:
- flow: initialize a new git repository with git flow
- lab:  initialize a new git repository, create a README-md and make inital commit
- full: initialize a new git repository with git flow, README.md and inital commit

You can also use standard git init parameters or use without parameters.<br/>
Syntax: git init (flow|lab|full)<br/>
![git init full](http://imgur.com/c78yHiz.png)

###git start
This is a smarter command for 'git flow (feature/hotix/etc.) start {BRANCHNAME}'.<br/>
Syntax: git start (feature/hotix/etc.) {BRANCHNAME}

###git publish
This is a smarter command for 'git flow (feature/hotix/etc.) publish {BRANCHNAME}'.<br/>
Syntax: git publish (feature/hotix/etc.) {BRANCHNAME}

###git finish
This is a smarter command for 'git flow (feature/hotix/etc.) finish {BRANCHNAME}'.<br/>
Syntax: git finish (feature/hotix/etc.) {BRANCHNAME}

###git short-status
This command gives you a short, nice, coloured output for 'git status'<br/>
Syntax: git short-status<br/>
![git short-status colors](http://i.imgur.com/dSmZtsn.png)

###git secure-checkout
This command gives you a higlight if the checked out branch is ahead or behind<br/>
Syntax: git secure-checkout {BRANCHNAME}<br/>
![git secure-checkout](---)

###git colordiff
This command gives you a coloured 'diff --name-status' output
Syntax: git colordiff {BRANCHNAME}<br/>
![git colordiff](---)

###glone
It's more an alias then a command. It just shorten the command for 'git clone'.<br/>
It also has an "*usage output*" but thats just because.. ok, I don't remember why I have implemented this.<br/>
Syntax: glone GITPATH (e.g. http://github.com/kizetsu/shell_customs)

###gadd
At first this was only a shortcut for 'git add'. Because git makes a difference between 'git add ./' and 'git add --all' and I wanted also to add only specified files, I made a function. After I begann to write the Function I also thought of make it more comfortable so I added a nice, coloured output of 'git status' (see git short-status). The status will only show if you use no parameters after gadd command.
Syntax: gadd [optional: PATH_TO_FILE]

###githelp
It's just a simple help output for the new commands.<br/>
It overrides 'git help' but not 'git --help'. Also it shows the standard git help after the new one.<br/>
Syntax: git help<br/>
![git help output](http://i.imgur.com/AdEPdq9.png)