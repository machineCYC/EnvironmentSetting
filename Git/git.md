# git 指令紀錄

- git describe 命令
    - 描述目前 commit id 與 tag 關係
        ```
        git describe --tags
        ```

        - **tag 在當下 commit id**，只顯示 tag 名稱

        - **tag 在當下 commit id 之前**，tag_name-2-g026498b
            - tag_name: commit id 最近 tag 名稱
            - 2: commit id 最近 tag 名稱之後還有多少個 commit
            - g026498b: g 是只 git，026498b 只當前 commit id
    - 描述目前 branch 最新的 tag 名稱
        ```
        git describe --tags --abbrev=0
        ```

- git tag v.**主版號**.**次版號**.**修訂號**
    - 主版號：當你做了不相容的 API 修改
    - 次版號：當你做了向下相容的功能性新增
    - 修訂號：當你做了向下相容的問題修正
    - example: git tag v.1.0.0