virtualenv --python=python3.6 --no-site-packages env3.6
touch ./env3.6/lib/python3.6/site-packages/a.pth
echo $PWD >> ./env3.6/lib/python3.6/site-packages/a.pth
echo $PWD/**project_path** >> ./env3.6/lib/python3.6/site-packages/a.pth
source env3.6/bin/activate
pip3 install -r requirements.txt
