

# install uv
 curl -LsSf https://astral.sh/uv/install.sh | sh

## pyenv 指令

    - initialize a project in the working directory: uv  init
    - uv python list
    - uv python install 3.9
    - setup python env in current folder, it need base on .python-version: uv venv --python=3.10.18 .venv
    - sync uv.lock file packages: uv sync

# reference

- [uv document](https://docs.astral.sh/uv/guides/projects/#project-structure)