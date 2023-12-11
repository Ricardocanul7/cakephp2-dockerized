### DOCKER CONFIGURATION FOR CakePHP 2

## Technology stack:
- PHP 5.6 || PHP 7.4
- MySQL 5.6
- NGINX 1.22

### Installation

To start using this configuration follow next steps:

1.- Copy the .env.example as .env in the root directory or execute `cp .env.example .env` in the root directory.

2.- Open .env file and set `PHP_VERSION` value to `5` or `7` depending on your needs.

> NOTE: CakePHP >= 2.8 is compatible with PHP7 but lower versions only works with PHP5
So choose wisely which version you need.

3.- Set DB_DATABASE, DB_USERNAME and DB_PASSWORD with your custom values you want docker to create the database.

> NOTE: values should not contain spaces.

> Also, step 3.- is not required, you can leave the default values if you want. (Just for development).

4.- Set `DB_VOLUME_NAME` with the name of your project.

> NOTE: use snake case for this value and don't use spaces. Example: my_todo_list_db

5.- Execute the command `make docker-project-init` to build the environment for your project.
> NOTE: You can costumize this command to adapt it to your needs.

6.- Copy the database values you added in the .env file to the app/Config/database.php file.

> Example:

```
public $default = array(
	'datasource' => 'Database/Mysql',
	'persistent' => false,
	'host' => 'db',     // 'db' is the name of the docker service in the docker-compose.yml
	'login' => '{{ DB_USERNAME }}',
	'password' => '{{ DB_PASSWORD }}',
	'database' => '{{ DB_DATABASE }}',
	'prefix' => '',
	//'encoding' => 'utf8',
);
```

Your project should be running in `localhost` or `127.0.0.1`

7.- (Optional) If you want to customize your virtual host. Check: [HostsFileEditor](https://github.com/scottlerch/HostsFileEditor) for Windows.

Create a new entry and set IP Address to 127.0.0.1 and Host Name as your custom URL.
> NOTE: Don't forget to click the `Save` button.

## Usage

Daily use is very simple, go into the root directory of your project.
So you will be able to execute:

- `make docker-start` to start your local server
- `make docker-stop` to stop your local server


## Switch between PHP versions

if you want to change PHP version, you can change the `PHP_VERSION` value

and then execute `make docker-restart`.

> Be aware that PHP versions available are only '5' or '7' as mentioned at the begining

## Help

Execute `make help` and you will see the list of custom commands.

> NOTE: You can modify the Makefile to add your custom commands or improve existing ones.

## Windows users

Windows doesn't have `make` installed by default as MacOS or Linux

A solution for this is to install chocolately from [Chocolatey](https://chocolatey.org/install)

Once `chocolately` is installed, install the `make` package with the following instruction: `choco install make`

So after that you will be able to run the commands in the makefile using Git Bash or Powershell
