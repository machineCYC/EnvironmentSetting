# Debug c code running with python

In this folder we provide an example to run the vscode debug mode with python plus c code

There are two files in vscode folder, one is launch.json, another is task.json
    - launch.json: run the python file with c code debug setting
    - task.json: setting pre step before excute the debug mode, and there is a Build C Library step in the file, this step is to build the c code

**One thing need to mention here is the break point only can setup in the c code**, it will not stop get the python code when you setup the break point in python code.

After running the debug mode, it will generate the libexample.so file, this is the binary file for the c code
