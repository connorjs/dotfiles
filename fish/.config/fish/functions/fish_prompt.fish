function fish_prompt --description 'Write out the prompt'
	# 0. Capture pipestatus (must come first)
	set -l last_pipestatus $pipestatus


	# 1. Distinguish SSH (host)
	set -l host ''
	if set -q SSH_TTY
		set host (set_color $fish_color_host_remote)(prompt_hostname)(set_color normal)' '
	end


	# 2. Distinguish root (cwd color + prompt character)
	set -l color_cwd (set_color $fish_color_cwd)
	set -l suffix '❯'

	if functions -q fish_is_root_user; and fish_is_root_user
		set color_cwd (set_color $fish_color_cwd_root)
		set suffix '#'
	end

	set -l cwd $color_cwd (prompt_pwd) (set_color normal)


	# 3. VCS information
	# https://fishshell.com/docs/current/cmds/fish_git_prompt.html
	if not set -q fish_git_configured
		set -g __fish_git_prompt_show_informative_status 1
		set -g __fish_git_prompt_showdirtystate 1
		set -g __fish_git_prompt_showuntrackedfiles 1
		set -g __fish_git_prompt_char_stateseparator ''

		set -g __fish_git_prompt_char_cleanstate      ''
		set -g __fish_git_prompt_char_dirtystate      ' │ 🚧 '
		set -g __fish_git_prompt_char_invalidstate    ' │ ⚠️ '
		set -g __fish_git_prompt_char_stagedstate     ' │ 🟢 '
		set -g __fish_git_prompt_char_stashstate      ' │ 📦 '
		set -g __fish_git_prompt_char_untrackedfiles  ' │ ⁉️ '
		set -g __fish_git_prompt_char_upstream_ahead  ' │ ⬆️ '
		set -g __fish_git_prompt_char_upstream_behind ' │ ⬇️ '

		set -g __fish_git_prompt_color_branch magenta --bold
		set -g fish_git_configured 1
   end

	set -l vcs (fish_vcs_prompt)


	# 4. Status
	set -l ps_left_brace '['
	set -l ps_right_brace ']'
	set -l ps_separator '|'
	set -l ps_brace_sep_color (set_color $fish_color_status)
	set -l ps_status_color (set_color --bold $fish_color_status)

	# https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_print_pipestatus.fish
	set -l prompt_status (__fish_print_pipestatus \
	    $ps_left_brace \
	    $ps_right_brace \
	    $ps_separator \
	    $ps_brace_sep_color \
	    $ps_status_color \
	    $last_pipestatus \
	) (set_color normal)


	# 5. Print prompt
	echo -ens '\n ' $host $cwd $vcs ' ' $prompt_status '\n  ' $suffix ' '

	# Example typing `echo foo` (including an error code from previous command)
	# The left `|` bars show the window edge for clarity
	# ```
	# |
	# | ~/some/dir (branch │ ⬆️ 1 │ ⬇️ 1 │ 🟢 1 │ ⚠️ 1 │ 🚧 1 │ ⁉️ 1) [1]
	# |  ❯ echo foo
	# |foo
	# |
	# | ~/some/dir (branch │ ⬆️ 1 │ ⬇️ 1 │ 🟢 1 │ ⚠️ 1 │ 🚧 1 │ ⁉️ 1)
	# |  ❯
	# ```
end
