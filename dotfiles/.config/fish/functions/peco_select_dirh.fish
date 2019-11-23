# fishの独自のcd関数で設定される以下の変数に依存
#
#   - $dirprev
#   - $dirnext
#
# prevd、nextd、dirh関数と整合性が維持されるように、
# pecoによる選択後のディレクトリ移動はprevdとnextdを使用

function print_dirh
  set dirs $dirprev
  set dirs $dirs $PWD
  if [ (count $dirnext) -gt 0 ]
    set dirs $dirs $dirnext[-1..1]
  end

  set dirs_count (count $dirs)
  if [ $dirs_count -gt 0 ]
    for i in (seq $dirs_count 1)
        echo "$i $dirs[$i]"
    end
  end
end

function peco_select_dirh
  set dirprev_count (count $dirprev)
  set dirnext_count (count $dirnext)

  set peco_flags '--layout=bottom-up'
  set peco_flags $peco_flags '--select-1'
  set peco_flags $peco_flags "--initial-index=$dirnext_count"

  print_dirh|peco $peco_flags|read foo

  if [ $foo ]
    set num_and_path (string split --max=1 " " $foo)
    set num $num_and_path[1]

    if [ $num -le $dirprev_count ]
      set prev_num (math $dirprev_count - $num + 1)
      prevd $prev_num
    else if [ $num -gt (math $dirprev_count + 1) ]
      set next_num (math $num - $dirprev_count - 1)
      nextd $next_num
    else
      # カレントディレクトリが選択されたので何もしない
    end
  end
end
