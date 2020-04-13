# Jupyterlab template

## Requirements

- Docker


## Directory Structure

    ├── Dockerfile         <- Dockerfile for Jupyter notebook environment.
    ├── README.md          <- The top-level README for developers using this project.
    ├── data               <- Data from third party sources.
    ├── module             <- Project specific modules.
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creators initials, and a short `-` delimited description,
    │                         e.g. `1.0-jqp-initial-data-exploration`.
    ├── start.sh           <- Set environmental value to `.env`
    ├── requirements.txt   <- The requirements file for reproducing the analysis environment
    └── requirements.lock  <- generated with `pip freeze > requirements.lock`


reference: [Cookiecutter Data Science](https://drivendata.github.io/cookiecutter-data-science/#directory-structure)

## Usage
First, create `.env` file to use `start.sh`

Please change `TAG` in `start.sh` if you need.
```
sh start.sh
```

Build a Docker image.

`
docker-compose build
`

Run image
```
docker-compose up -d
```

Access notebook
```
http://{IP ADDRESS}:8888/
```
__Password is 'jupyter'.__

Stop and delete container
```
docker-compose down
```

If you want to change password, try below

```
$ docker container exec -it template bash
[root@template /]# python -c 'from notebook.auth import passwd;print(passwd())'
Enter password:
Verify password:
sha1:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  #これに変更
[root@template /]# sed -i -e "/^c\.NotebookApp\.password/s/\(sha1:\).*/\1XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\'/" ~/.jupyter/jupyter_notebook_config.py 
[root@template /]# exit
$ docker-compose restart
```
