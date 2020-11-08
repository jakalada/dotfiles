function print_aws_profile
  echo "Clear AWS_PROFILE"
  grep '\[profile' ~/.aws/config | sed 's/\[profile \(.*\)]/\1/g'
end

function peco_select_aws_profile
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  print_aws_profile | peco $peco_flags | read line

  if [ $line ]
    if test "$line" != "Clear AWS_PROFILE"
      set -gx AWS_PROFILE "$line"
    else 
      set -e AWS_PROFILE
    end
  else
    set -e AWS_PROFILE
  end
end
