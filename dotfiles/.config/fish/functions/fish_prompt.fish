function fish_prompt
  set -l chars '🐈' '🐱' '😺' '😸' '😹' '😻' '😼' '😽' '😾' '😿' '🙀'
  set -l char_idx (math (random) % (count $chars) + 1)
  set -l char $chars[$char_idx]

  set -l prompt (set_color yellow)$char(set_color normal)"  "
	echo -n $prompt
end
