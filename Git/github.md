# github CI

## Travis CI

[Travis CI](https://travis-ci.org/) 是提供 GitHub 專案持續整合的服務平台，且支援各種程式語言，間單來說使用 Travis CI 之後只要更新(Push)專案到 GitHub 就會自動進行測試。

主要 SOP

- 與 GitHub 連動
- 選取要使用的 project
- 新增 .travis.yml 檔案
    - 如下為一個自動測試的例子
        ```
        language: python
        matrix:
        include:
        - name: "3.6 Unit Test"
            python: "3.6"
            env: TEST_SUITE=suite_3_6_unit
        script:
        - pip3 install pipenv
        - pipenv --python /usr/bin/python3
        - pipenv sync
        - pipenv run pytest
        ```


## github action

github action 提供多種情境 (自動測試、自動發布 package) 的 yml file 可以使用

- 自動測試 yml 如下

    ```
    # This workflow will install Python dependencies, run tests and lint with a variety of Python versions
    # For more information see: https://help.github.com/actions/language-and-framework-guides/using-python-with-github-actions

    name: Python package

    on:
    pull_request:
        branches: [ master ]

    jobs:
    build:

        runs-on: ubuntu-latest
        strategy:
        matrix:
            python-version: [3.5, 3.6, 3.7, 3.8]

        steps:
        - uses: actions/checkout@v2
        - name: Set up Python ${{ matrix.python-version }}
        uses: actions/setup-python@v2
        with:
            python-version: ${{ matrix.python-version }}
        - name: Install dependencies
        run: |
            python -m pip install --upgrade pip
            pip3 install pipenv
            pipenv --python /usr/bin/python3
            pipenv sync
        - name: Test with pytest
        run: |
            pipenv run pytest

    ```

## Reference

- [[Node.js] GitHub 使用 Travis-CI 自動化單元測試](https://andy6804tw.github.io/2018/03/16/travis-ci-tutorial/)

- [What is a Webhook?](https://codeburst.io/what-are-webhooks-b04ec2bf9ca2)