This folder record all of the problem I've suffered. Some of it has an answer, but I still can not understand. Others do not have a solution yet.


## Linux

1. Quesitons: :Can't find time zone database. Please use parameter tzdb to set the root directory of time zone database.

    Ans: sudo apt install tzdata, https://serverfault.com/questions/1093755/how-can-i-acquire-the-timezone-information-about-when-a-timezone-change-occurs

## WSL

1. Quesitons: can not fetch gitlab repo, ssh: Could not resolve hostname gitlab.com: Temporary failure in name resolution

    Ans: Add google DNS address IP into /etc/resolv.conf https://codetryout.com/github-temporary-failure-in-name-resolution/

## VSCODE

1. Question: Break point fails with concurrent.futures.ProcessPoolExecutor in vscode python

    Ans: Not yet supported in vscode. Ans from microsoft https://github.com/Microsoft/ptvsd/issues/1162