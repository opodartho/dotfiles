# postgresql

if package.installed "postgresql"; then
	echo "postgresql already installed, skipping."
else
	sudo -i
	echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" >> /etc/apt/sources.list.d/postgresql-pgdgp-xenial.list
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
	apt update
	apt -y install postgresql libpq-dev

	#enable password authentication
	mv files/pg_hba.conf /etc/postgresql/9.5/main/pg_hba.conf
	chown postgres:postgres /etc/postgresql/9.5/main/pg_hba.conf
	chmod 640 /etc/postgresql/9.5/main/pg_hba.conf
	service postgresql restart

	exit
	#create user and database
	sudo -u postgres psql -c "create user sowrov with password 'password';"
	sudo -u postgres psql -c "ALTER USER sowrov CREATEDB;"
fi
