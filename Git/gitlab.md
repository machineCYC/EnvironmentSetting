# gitlab CI

## 持續整合 (continuous integration)

「持續整合」目的在儘快讓新功能的程式碼整合到現存的基礎程式庫 (codebase) 中來進行測試。如此，才能儘快找出整合上未預想到問題以及解決衝突的程式碼 (conflict codes)。越將整合的時間點往後拖，造成整合難度與失敗的機率越高。「持續整合」通常會涵蓋單元測試 (unit tests) 與煙霧測試 (smoke tests)，可以儘快找出回歸錯誤 (regression error) 的發生。因此，就算是只有一個人在開發，「持續整合」仍有其價值。

## Gitlab Runner

實際上是一個 docker 的 image，在 Gitlab CI/CD 中每一個工作 (Job) 都是在此運行的，優點是可以確保每次執行的環境都是乾淨的，且可以讓多個工作同時進行，比如執行多種測試項目就可以啟用不同的 runner 同步進行。

## Gitlab-CI

會在專案資料夾中偵測到 Gitlab-ci.yml 這個設定檔的時候觸發，主要是負責協調在各種不同情境時 Runner 該啟動是否該啟用及先後順序，比如流程是先測試後部署，就會限制是測試成功後才能部屬，不成功則中斷。

- 以 gitlab 本身來說，只要建立好 .gitlab-ci.yml，剩下 gitlab 會自動幫您完成
- 如下為一個例子
    - stage : 設定執行順序，常見的有 build、test、services、deploy、doc

    - tags : 指定 runner ( worker 概念，指定 job 給哪台機器接，每台機器設定、環境不同 )

    - script : 要執行的 commend line

    - only : 只在某些狀況下執行

```
variables:
  GIT_STGIT_STRATEGY: fetch
  GIT_SUBMODULE_STRATEGY: recursive

stages:
  - test


test:
    stage: test
    before_script:
      - apt-get update
      - apt-get install python3-pip -y
      - pip3 install pipenv
      - pipenv --python /usr/bin/python3
      - pipenv sync
    script:
      - pipenv run pytest tests/BackTestSystem
      - pipenv run pytest tests/Data
    tags:
        - docker
    only:
        refs:
          - schedules
          - merge_request
```