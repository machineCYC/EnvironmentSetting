

- build the cpython module
    - cd to cpython_module folder
    - two methods
        - g++ -O3 -Wall -shared -std=c++11 -fPIC $(python3.10-config --cflags) fibonacci_module.cpp -o fibonacci_module$(python3.10-config --extension-suffix)
        - python3 setup.py build
    - install module
        - python setup.py install