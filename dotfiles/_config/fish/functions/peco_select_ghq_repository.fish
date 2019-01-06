# 以下のソースコードを参考にghq lookコマンドではなく単純にcdするように変更
# https://github.com/yoshiori/fish-peco_select_ghq_repository
function peco_select_ghq_repository
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  ghq list | peco $peco_flags | read line

  if [ $line ]
    cd (ghq list --exact --full-path $line)
    commandline -f repaint
  end
end
