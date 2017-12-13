function __fish_shenv_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'shenv' ]
    return 0
  end
  return 1
end

function __fish_shenv_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c shenv -n '__fish_shenv_needs_command' -a '(shenv commands)'
for cmd in (shenv commands)
  complete -f -c shenv -n "__fish_shenv_using_command $cmd" -a \
    "(shenv completions (commandline -opc)[2..-1])"
end
