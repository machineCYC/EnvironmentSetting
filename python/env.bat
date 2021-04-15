virtualenv --python=python3.6 --no-site-packages env3.6
fsutil file createnew .\env3.6\lib\site-packages\a.pth 0
echo %CD% >> .\env3.6\lib\site-packages\a.pth
echo %CD%\**project_path** >> .\env3.6\lib\site-packages\a.pth
call env3.6\Scripts\activate
pip3 install -r requirements.txt
