if status is-interactive
	# Leave `ls` as-is in case its needed (example: copying command for parsing).
	abbr -a l   lsd -A
	abbr -a ll  lsd -Al
	abbr -a ld  lsd -Al --blocks date,size,name
	abbr -a lg  lsd -Alg
	abbr -a lt  lsd --tree -A
	abbr -a ltl lsd --tree -Al
	abbr -a lt3 lsd --tree -A --depth 3
	abbr -a ltd lsd --tree -A --blocks date,size,name
end
