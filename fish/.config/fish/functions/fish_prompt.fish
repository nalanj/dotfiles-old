function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

  # Begin with empty line
  echo

  # Time
  set -l date (date "+$c2%H$c0:$c2%M$c0:$c2%S")
  echo -n "[$date] "

  # User
  set_color $fish_color_user
  echo -n (whoami)
  set_color normal

  echo -n ':'

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  __terlar_git_prompt
  __fish_hg_prompt
  echo

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n '> '
  set_color normal
end
