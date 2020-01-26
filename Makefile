ENVIRONMENT ?= development # defaults the ENVIRONMENT infrastructure config to development
# Drupal Files folder
FILES_FOLDER = backend/web/sites/default/files
# Drupal default site folder
SITE_FOLDER = backend/web/sites/default

# Prepares the environment for the first time execution
install:
	@(cd backend; composer install) \
	&& echo "" \
	&& make npm_install \
	&& (cd infrastructure/${ENVIRONMENT}; docker-compose up -d) \
	&& make -s setup_files_folder \
	&& make -s db_import \
	&& make -s up_react

# Starts this project's containers, or create them if the doesn't exist already
up:
	@cd infrastructure/${ENVIRONMENT} \
	&& docker-compose up -d

# Stops this project's containers
stop:
	@cd infrastructure/${ENVIRONMENT} \
	&& docker-compose stop

# Stops and starts the containers again
reload:
	@cd infrastructure/${ENVIRONMENT} \
	&& docker-compose stop \
	&& docker-compose up -d

npm_install:
	@cd frontend \
	&& npm install;

# Starts the React project with dev server
up_react:
	@cd frontend \
	&& npm run start;

# Creates a backup .sql file in the backend/backups folder
db_backup:
	@docker exec -it drupalheadless_mysql bash -c "mysqldump -u admin -p23gnnNXs@ drupalheadless > /backups/dump.sql"

# Imports the dump.sql file into the mysql database
db_import:
	@docker exec -it drupalheadless_mysql bash -c "mysql -u admin -p23gnnNXs@ drupalheadless < /backups/dump.sql"


# Creates the Drupal sites/default/files directory if it doesn't exist already.
setup_files_folder:
	@echo "Creating the 'files' folder"
	@if [ ! -d ${FILES_FOLDER} ]; then \
		mkdir ${FILES_FOLDER} \
		&& sudo chmod 777 -R ${FILES_FOLDER}; \
	else \
		echo "Folder already exists"; \
	fi \
	&& echo ""
