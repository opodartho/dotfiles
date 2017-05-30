# postgresql

if package.installed "postgresql"; then
	echo "postgresql already installed, skipping."
else
	sudo cp files/postgresql-pgdgp-xenial.list /etc/apt/sources.list.d/postgresql-pgdgp-xenial.list
	sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
	sudo apt update
	sudo apt -y install postgresql libpq-dev

	#enable password authentication
	sudo cp files/pg_hba.conf /etc/postgresql/9.6/main/pg_hba.conf
	sudo chown postgres:postgres /etc/postgresql/9.6/main/pg_hba.conf
	sudo chmod 640 /etc/postgresql/9.6/main/pg_hba.conf
	sudo service postgresql restart

	#create user and database
	# sudo -u postgres psql -c "create user sowrov with password 'password';"
	# sudo -u postgres psql -c "ALTER USER sowrov Superuser;"
fi
