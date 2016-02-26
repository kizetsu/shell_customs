#Functions
git cp<br/>
git reroll *beta*<br/>
git init<br/>
git lab *beta*<br/>
git start<br/>
git publish<br/>
git finish<br/>
git short-status<br/>
githelp<br/>
gadd<br/>
glone<br/>
<br/><br/>
# Aliases
status      (alias for) git status<br/>
gitst		(alias for) git short-status<br/>
start       (alias for) git start<br/>
publish     (alias for) git publish<br/>
finish      (alias for) git finish<br/>
init-flow	(alias for) git init flow<br/>
<br/>
<br/>
###git cp
This command combines 'git commit -m' and 'git push'.<br/>
Syntax: git cp COMMIT_MSG
![git cp example](http://i.imgur.com/ubtco7Q.png)

###git reroll
Careful: Beta-Status because it's not fully testet yet. Do **not** use<br/>
This command triggers some git functions to get your actual working status on top of the master.<br/>
Ihe thought is to reroll your working process to a specified point. You will have to checkout the commit you want to get on top. Then, if you want or need to, make some modifications and use the reroll command.<br/>
Syntax: git reroll<br/>

###git init
This command extends the standard 'git init' command.<br/>
parameters:
- flow: initialize a new git repository with git flow
- lab:  initialize a new git repository, create a README-md and make inital commit
- full: initialize a new git repository with git flow, README.md and inital commit
You can also use standard git init parameters or use without parameters.<br/>
Syntax: git init (flow|lab|full)
![git init full](http://imgur.com/c78yHiz.png)

###git lab
Careful: Beta-Status because it's not fully testet yet. Can cause problems.<br/>
This command installs a git.conf to your system.
Parameters:
- smart: installs a gitconf with some smart configurations
- show: not implemented yet
Syntax: git lab (smart|show)

###git start
This is a smarter command for 'git flow (feature/hotix/etc.) start NAME'.<br/>
Syntax: git start (feature/hotix/etc.) NAME

###git publish
This is a smarter command for 'git flow (feature/hotix/etc.) publish NAME'.<br/>
Syntax: git publish (feature/hotix/etc.) NAME

###git finish
This is a smarter command for 'git flow (feature/hotix/etc.) finish NAME'.<br/>
Syntax: git finish (feature/hotix/etc.) NAME

###git short-status
This command gives you a short, nice, coloured output for 'git status'<br/>
Syntax: git short-status
![git short-status colors](http://i.imgur.com/dSmZtsn.png)

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
Syntax: git help
![git help output](http://i.imgur.com/AdEPdq9.png)