# postgresql

if [ nohola.installed "postgresql" ]; then
	echo "postgresql already installed, skipping."
else
	sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" >> /etc/apt/sources.list.d/postgresql-pgdgp-xenial.list
	sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
	sudo apt-get update
	sudo apt-get -y install postgresql libpq-dev

	#enable password authentication
	sudo mv files/pg_hba.conf /etc/postgresql/9.5/main/pg_hba.conf
	sudo chown postgres:postgres /etc/postgresql/9.5/main/pg_hba.conf
	sudo chmod 640 /etc/postgresql/9.5/main/pg_hba.conf
	sudo service postgresql restart

	#create user and database
	sudo -u postgres psql -c "create user sowrov with password 'password';"
	sudo -u postgres psql -c "ALTER USER sowrov CREATEDB;"
fi
