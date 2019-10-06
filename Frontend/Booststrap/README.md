# Booststrap

## django 套用模板 Setup sop

1. 下載 [Booststrap template]() 至電腦任何地方

2. 設定 django setting.py 的 TEMPLATES 中 DIRS 的部分 (template 路徑)

    ```
    TEMPLATES = [
        {
            'BACKEND': 'django.template.backends.django.DjangoTemplates',
            'DIRS': ['your_path_to_template'], # Revised it.
            'APP_DIRS': True,
            'OPTIONS': {
                'context_processors': [
                    'django.template.context_processors.debug',
                    'django.template.context_processors.request',
                    'django.contrib.auth.context_processors.auth',
                    'django.contrib.messages.context_processors.messages',
                ],
            },
        },
    ]
    ```

3. 在 django settings.py 增加 STATICFILES_DIRS 部分 (static 路徑)

    ```
    STATIC_URL = '/static/'
    STATICFILES_DIRS = (
        '/your_path_to_static/', # Revised it.
    )
    ```

4. 在專案下面新增 static 和 templates 資料夾

    ```
    Project name
    └─── Project name
    |      settings.py
    |      urls.py
    |      wsgi.py
    |
    └─── app
    |      migrations
    |      templates     <- add this
    |      admin.py
    |      apps.py
    |      views.py
    |      ...
    |
    └─── ...
    └─── static    <- add this
    └─── manage.py
    ```

5. 把下載的 Booststrap  file 中非 html 檔案和資歷夾複製到 static 資料夾 (css, js, ing, scss...)

6. 把下載的 Booststrap file 中所有 html file 複製到 templates 資料夾

7. 修改 html 內容路徑 (css 路徑之類的)

    ```
    <!-- Custom fonts for this template-->
    <link href="/static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/static/css/sb-admin-2.min.css" rel="stylesheet">
    ```
8. 修改專案 urls.py，讓 html 跟 url 對上

9. 修改 views.py，讓 html 跟 url 對上

10. 大功告成

## Reference

- [在 Django 專案中使用 Bootstrap template](http://zhua0404.blogspot.com/2017/12/djangobootstrap-template.html)