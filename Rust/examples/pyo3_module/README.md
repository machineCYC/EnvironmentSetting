
- setup python env
    - virtualenv -p python3.10 my_env
    - source my_env/bin/activate

- use maturin to build the module
    - pip install maturin
    - maturin develop

- run python to call rust module
    - python3 test_pyo3_modele.py