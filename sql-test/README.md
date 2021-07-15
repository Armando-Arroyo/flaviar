To launch a Postgres image and create a database with docker compose, run the following:

```bash
$ python3 -m pip install pipenv --user
```

```bash
$ PIPENV_VENV_IN_PROJECT=true pipenv shell
```

```bash
$ pipenv install --dev
```

To run the Postgres server, execute the following

```bash
$ docker-compose up db
```

to acces the container shell

```bash
$ docker exec -it postgres_test bash
```

and once in the container run

```bash
$ psql -d test -U postgres
```

To exit the container

```bash
$ exit
```

And finally to exit the virtualenv, just type

```bash
$ deactivate
```
