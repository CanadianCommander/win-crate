# Developing Remotely from your Linux Desktop

Developing remotely from your linux desktop is a great way to develop windows applications on a linux workstation. To do this we will leverage
the `Remote Development` extension in vscode. This extension allows you to connect to a `vscode` server running in your windows container 
using your local vscode instance. Giving you an almost native development experience. Combine this with the filesystem passthrough and you can 
develop on your host machine and run the application in the container.

### Requirements
- vscode 

### Getting Started

1. Open vscode on your linux desktop and install the `Remote Development` extension.
2. Start the windows container with the `run.sh` script.
3. In your windows container install `vscode` If you like, you can use the `dotnet-dev-setup.ps1` script to install all the tools you will need for dotnet development, including `vscode`. You can find it on the CD drive `F:`. 
4. Open vscode in the windows container. Click the account icon in the bottom left and select, "Remote Tunnel Access". 
When asked, select run at startup. 
5. Now on your linux desktop open vscode and click the green `><` icon in the bottom left. Select the same account you used to create 
the tunnel in the windows container. You should now have an option to connect to the windows container! 
6. Start hacking, you hacker you 😎