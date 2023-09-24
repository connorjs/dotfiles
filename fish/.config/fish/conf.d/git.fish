if status is-interactive
	# Assumes `main` and `develop` branch names
	# TODO: Consider dynamically using `git_main_branch` and `git_current_branch`

	abbr -a g git

	#--- Most used commands first ---#

	##########
	# branch #
	##########

	abbr -a gb   git branch
	abbr -a gba  git branch --all
	abbr -a gbd  git branch --delete
	abbr -a gbda git branch --no-color --merged | grep -vE "^([+]|\s(main|develop|master)\s*$)" | xargs git branch -d 2>/dev/null
	abbr -a gbD  git branch --delete --force
	abbr -a gbnm git branch --no-merged
	abbr -a gbr  git branch --remote

	############
	# checkout #
	############

   export alias gco = git checkout
	export alias gcb = git checkout -b
   export alias gcd = git checkout develop
   export alias gcm = git checkout main

	##########
	# commit #
	##########

	# a = all, ! = amend, n = no-edit
	abbr -a gc    git commit --verbose
	abbr -a gc!   git commit --verbose --amend
	abbr -a gcn!  git commit --verbose --no-edit --amend
	abbr -a gca   git commit --verbose --all
	abbr -a gca!  git commit --verbose --all --amend
	abbr -a gcan! git commit --verbose --all --no-edit --amend
	abbr -a gcam  git commit --all --message
	abbr -a gcmsg git commit --message
	abbr -a gcf  git commit --fixup=

	########
	# diff #
	########

	# s = staged (cached), w = word-diff
	export alias gd = git diff
   export alias gds = git diff --staged
   export alias gdsw = git diff --staged --word-diff
   export alias gdt = git diff-tree --no-commit-id --name-only -r
   export alias gdup = git diff @{upstream}
   export alias gdw = git diff --word-diff

	##########
	# status #
	##########

   export alias gs = git status
	export alias gss = git status --short

	#--- Common commands second ---#

   ###############
   # cherry-pick #
   ###############

   export alias gcp = git cherry-pick
   export alias gcpa = git cherry-pick --abort
   export alias gcpc = git cherry-pick --continue

   #########
   # fetch #
   #########

   export alias gf = git fetch
   export alias gfo = git fetch origin

	#######
	# log #
	#######

	# g = graph, a = all, m = max-count=10, o = oneline
	export alias gl = git log
   export alias gls = git log --stat
   export alias glg = git log --graph
   export alias glga = git log --graph --decorate --all
   export alias glgm = git log --graph --max-count=10
   export alias glo = git log --oneline --decorate
   export alias glog = git log --oneline --decorate --graph
   export alias gloga = git log --oneline --decorate --graph --all
   export alias glogm = git log --oneline --decorate --graph --max-count=10

   #########
   # merge #
   #########

   export alias gm = git merge

	########
	# pull #
	########

	export alias gpl = git pull

   ##########
	# rebase #
	##########

	export alias grb = git rebase
	export alias grba = git rebase --abort
	export alias grbc = git rebase --continue
	export alias grbd = git rebase develop
	export alias grbm = git rebase main

	#--- Least used last ---#

	#######
	# add #
	#######

	abbr -a ga   git add
	abbr -a gaa  git add --all
	abbr -a gapa git add --patch
	abbr -a gau  git add --update
	abbr -a gav  git add --verbose

	#########
	# apply #
	#########

	abbr -a gap   git apply
	abbr -a gapt  git apply --3way

	##########
	# bisect #
	##########

	abbr -a gbs   git bisect
	abbr -a gbsb  git bisect bad
	abbr -a gbsg  git bisect good
	abbr -a gbsr  git bisect reset
	abbr -a gbss  git bisect start

	#########
	# blame #
	#########

	abbr -a gbl  git blame -b -w

end
