
function fish_greeting
	echo Hello $USER\n
end

function lst
   exa -x --header --tree --group-directories-first --sort type --sort modified --reverse --level=2
end

function lsa
   exa -GFxahml --group-directories-first --sort type --sort modified --reverse
end

function lsf
   fzf
end

function mcd
   mkdir $argv
   cd $argv
end

