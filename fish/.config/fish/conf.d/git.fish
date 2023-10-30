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
	abbr -a gbda 'git branch --no-color --merged | grep -vE \'^([+]|\s*(main|develop|master)\s*$)\' | xargs git branch -d 2>/dev/null'
	abbr -a gbD  git branch --delete --force
	abbr -a gbnm git branch --no-merged
	abbr -a gbr  git branch --remote

	############
	# checkout #
	############

   abbr -a gco  git checkout
	abbr -a gcb  git checkout -b
   abbr -a gcd  git checkout develop
   abbr -a gcm  git checkout main

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
	abbr -a gcf   git commit --fixup=

	########
	# diff #
	########

	# s = staged (cached), w = word-diff
	abbr -a gd   git diff
   abbr -a gds  git diff --staged
   abbr -a gdsw git diff --staged --word-diff
   abbr -a gdt  git diff-tree --no-commit-id --name-only -r
   abbr -a gdup git diff @{upstream}
   abbr -a gdw  git diff --word-diff

	##########
	# status #
	##########

   abbr -a gs  git status
	abbr -a gss git status --short

	#--- Common commands second ---#

   ###############
   # cherry-pick #
   ###############

   abbr -a gcp   git cherry-pick
   abbr -a gcpa  git cherry-pick --abort
   abbr -a gcpc  git cherry-pick --continue

   #########
   # fetch #
   #########

   abbr -a gf  git fetch
   abbr -a gfo git fetch origin

	#######
	# log #
	#######

	# g = graph, a = all, m = max-count=10, o = oneline
	abbr -a gl    git log
   abbr -a gls   git log --stat
   abbr -a glg   git log --graph
   abbr -a glga  git log --graph --decorate --all
   abbr -a glgm  git log --graph --max-count=10
   abbr -a glo   git log --oneline --decorate
   abbr -a glog  git log --oneline --decorate --graph
   abbr -a gloga git log --oneline --decorate --graph --all
   abbr -a glogm git log --oneline --decorate --graph --max-count=10

   #########
   # merge #
   #########

   abbr -a gm  git merge

	########
	# pull #
	########

	abbr -a gpl  git pull

   ##########
	# rebase #
	##########

	abbr -a grb   git rebase
	abbr -a grba  git rebase --abort
	abbr -a grbc  git rebase --continue
	abbr -a grbd  git rebase develop
	abbr -a grbm  git rebase main

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
