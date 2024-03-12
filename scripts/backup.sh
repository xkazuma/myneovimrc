BAKTIME=$(date --date='TZ="Japan/Tokyo" now' +%Y%m%d%I%M)
CONFIG_PATH="$HOME/.config/nvim"
SHARE_PATH="$HOME/.local/share/nvim"
STATE_PATH="$HOME/.local/state/nvim"
CACHE_PATH="$HOME/.cache/nvim"

## see https://www.lazyvim.org/installation
# required
if [ -e ~/.config/nvim ]; then
  echo "backed up ${CONFIG_PATH}"
  mv "${CONFIG_PATH}" "${CONFIG_PATH}-${BAKTIME}.bak"
fi
# optional but recommended
if [ -e ~/.local/share/nvim ]; then
  echo "backed up ${SHARE_PATH}"
  mv "${SHARE_PATH}" "${SHARE_PATH}-${BAKTIME}.bak"
fi
if [ -e ~/.local/state/nvim ]; then
  echo "backed up ${STATE_PATH}"
  mv "${STATE_PATH}" "${STATE_PATH}-${BAKTIME}.bak"
fi
if [ -e ~/.cache/nvim ]; then
  echo "backed up ${CACHE_PATH}"
  mv "${CACHE_PATH}" "${CACHE_PATH}-${BAKTIME}.bak"
fi
