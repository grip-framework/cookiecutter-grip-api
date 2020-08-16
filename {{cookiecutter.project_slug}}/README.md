# {{cookiecutter.module_slug}}

## Installation

```bash
git clone ...
cd {{cookiecutter.project_slug}}
shards install
make sam db:create
make sam db:migrate
```

## Running

```bash
make run
```