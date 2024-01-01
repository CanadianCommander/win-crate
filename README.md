# Windows in a Crate

Windows VM in a nice little docker container. With windows in a container (VM) you can run windows applications on any OS that supports docker. This is a great way to run windows applications on a mac or linux machine. There is also a filesystem passthrough that allows you to share files with the windows container. This way you can develop on your host machine and run the application in the container. For example developing a windows application on a linux workstation.

# Requirements
- [Docker](https://docs.docker.com/get-docker/) 

# Usage

### Getting a windows ISO 
Unfortunately you will need to provide your own windows ISO, because Microsoft is a meany!
You can download a windows ISO [here ](https://www.microsoft.com/en-us/software-download/windows11).

place the ISO in the `vm/iso/` directory with the name `windows.iso` (as shown by the placeholder file)

### Setup SSH Key (optional)
If you want to ssh into the container without using a password you can add your public key to the `vm/ssh/` directory with the name `rsa.key.pub` (as shown by the placeholder file).

### Run
Now you are ready to start your windows container. You can use the run command to start the container. 
The run command is very simple. It only takes a list of directories to mount into windows. Each directory 
will show up as a drive in Windows.
```bash 
./run.sh /home/user/mymount/point/ /home/user/another/mount/point/ .... 
```
