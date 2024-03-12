CONFIG_PATH="$HOME/.config/nvim"
SHARE_PATH="$HOME/.local/share/nvim"
STATE_PATH="$HOME/.local/state/nvim"
CACHE_PATH="$HOME/.cache/nvim"

if [ -e ~/.config/nvim ]; then
  echo "removed ${CONFIG_PATH}"
  rm -rf ${CONFIG_PATH}
fi
if [ -e ~/.local/share/nvim ]; then
  echo "removed ${SHARE_PATH}"
  rm -rf ${SHARE_PATH}
fi
if [ -e ~/.local/state/nvim ]; then
  echo "removed ${STATE_PATH}"
  rm -rf ${STATE_PATH}
fi
if [ -e ~/.cache/nvim ]; then
  echo "removed ${CACHE_PATH}"
  rm -rf ${CACHE_PATH}
fi
