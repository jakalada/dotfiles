# abbr
alias g='git'
alias r='rails'
alias pf='platformio'

# replacement
if which rmtrash >/dev/null
  alias rm='rmtrash'
end

# function like alias
function pfr --description 'Build and upload by platformio'
  set -l parent_dir $PWD/..
  set -l src_dir $PWD/$argv[2]
  set -lx PLATFORMIO_LIB_DIR $parent_dir
  set -lx PLATFORMIO_SRC_DIR $src_dir
  platformio run --target=upload -e $argv[1]; and platformio serialports monitor
end

function pfb --description 'Build by platformio'
  set -l parent_dir $PWD/..
  set -l src_dir $PWD/$argv[2]
  set -lx PLATFORMIO_LIB_DIR $parent_dir
  set -lx PLATFORMIO_SRC_DIR $src_dir
  platformio run -e $argv[1]
end

fish_vi_key_bindings
