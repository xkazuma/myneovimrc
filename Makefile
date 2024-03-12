all:

check:
	sh scripts/check-requirements.sh

install: backup
	echo no-implemented

install-pure-lua-for-docker: reset-nvim
	sh scripts/install-for-docker.sh

reset-nvim: backup
	sh scripts/reset.sh

update-conf-for-docker: backup install-pure-lua-for-docker

backup:
	sh scripts/backup.sh
