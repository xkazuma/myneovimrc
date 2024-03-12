all:

check:
	sh scripts/check-requirements.sh

install: backup
	echo no-implemented

install-pure-lua-for-docker: backup
	sh scripts/install-for-docker.sh

baktime      := $(shell date --date='TZ="Japan/Kyoto" now' +%Y%m%d%I%M)
backup:
	sh scripts/backup.sh
