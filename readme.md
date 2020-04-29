# Introduction  

This is a project to simplify [Python](https://www.python.org/) and [Flask](https://flask.palletsprojects.com/) Development by using [Docker](https://www.docker.com/) in a decoupled cross environment for Small up to Large Teams.  
Python is a high level programming language, with easy syntax for fast development projects.  
Flask is a well known Web [Framework](https://en.wikipedia.org/wiki/Software_framework) for Python Web Development.  
Docker is a container technology that allows developer use abstractions in the `Operational System`, making it possible to ship and share your code across several operational systems, including cloud platforms.  
In this project you'll learn how to configure Docker, setup a container and start developing in your machine with debugging capabilities to make it easier to develop your Python Web projects.

## 1. Preparing Your Environment

### 1.1 Development Environment  
In this project I will cover Visual Studio Code, as it's my tool of choice because it's lightweight and can be used in any environment.  
In this project we will also use additional VS Code extensions to be able to edit additional files


#### 1.1.1 Git For Windows  
As a developer, I suppose you are familiar with [git](https://git-scm.com/), a Version Control System that allows you keep track of files that you change your source code.  
I suggest you to install [Git For Windows](https://git-scm.com/download/win) and configure it to be used via [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7). In short terms, Powershell is a command line tool that allows you interact with the Windows system efficiently. I suggest you to configure `git` to run under `powershell` as described in the official [`git` home page](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-PowerShell).

#### 1.1.2 Visual Studio Code  
An Integrated Development Environment is purely a matter of choice for any developer. I like [Visual Studio Code](https://code.visualstudio.com) because it's lightweight and very extensible, therefore I suggest you to use this project with VS Code.  
Keep in mind that this repository is pre-configured to use VS Code extensions, try to get familiar with them in order to improve the way you use it more efficiently. The [Visual Studio Code Market Place](https://marketplace.visualstudio.com/vscode) is full of tools that you might like, but in this project we will focus on just a few of them, for example:

1. Install [Python extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-python.python)  
2. Install [Docker Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

### 1.2. Oracle Virtual Box  
`NOTE: You can use any Docker version for any environment to develop this project.  `  

My choice was to use Docker Toolbox, since I'm a Windows and Virtual Box user.  
If you already have an (Oracle Virtual Box)[https://www.virtualbox.org] installed, you can skip installing it, otherwise.  
1. Go to (Oracle Virtual Box Downloads Page)[https://www.virtualbox.org/wiki/Downloads]  
2. Download VirtualBox 6.1.6 platform packages > Windows hosts  
   `NOTE: You can download OS X if you use mac or check Linux distributions in case you are a Linux user`  

Install [Docker Toolbox](https://github.com/docker/toolbox/releases)  
3. You can fully skip downloading Oracle Virtual Box, because Docker Toolbox installs it by default. I prefer to install each component individually because I have several virtual machines in my environment.  


### 1.3 Docker Toolbox  
Docker Toolbox is a Legacy version of Docker for Mac and Old Windows versions, that can also be used by developers that doesn't have Microsoft Hyper-V installed.  
After installing Docker Toolbox, a shortcut will be available in your desktop, 

1. Search for `Docker Quickstart Terminal`, execute it and wait until it finishes setting up your [docker-machine](https://docs.docker.com/machine/overview/).  

Once the docker machine is ready, you are now able to interact with your containers.

## 2. Clone this Repository  
This project is using predefined tools, defined in the `Section 1.1` of this `readme`, make sure you have all you need before following this section.  

Before cloning this repository, understand that Docker Toolbox is a Sandbox container environment with a few restrictions to read and write files, therefore it's important to note that it won't be able to read/write files outside your `$home` directory without overriding it's permissions.

`
NOTE: $home is a Windows Environment Variable that is mapped to the CurrentUser folder.  
It's also available on the windows explorer as %HOMEPATH%.
`  

`
IMPORTANT: If you cloned this repository outside your %HOMEPATH%, make sure you move it there. I sugest you create the folder like the following:   
`
```
$home\git\pythonweb
```

Open Powershell it by typing `Windows Key + R` and type `powershell`. By default it'll open in your `$home` directory. If you are not in your home directory, just type in the powershell console: 

```
cd $home
```

Now you are all set to start cloning this repository. Just type the following command:

```
git clone https://github.com/moises-pgoncalves/pythonweb.git
```

## 3. Understanding the Project files.

### 3.1. Dockerfile  
A project that is supposed to run in docker may contain this file by default. It's required to build and load a docker container to execute the project in the docker-machine.  
Our project is based on the [Python 3.7](https://hub.docker.com/layers/python/library/python/3.7-alpine/images/sha256-d6478625c11b17c8744efa9602a5626f51933dc4718329039855ff522083884c?context=explore).  
The project also contains a [docker-compose](https://docs.docker.com/compose/) file.

### 3.2. docker-compose.yml  
This file contains script logic to boot up the docker container after it's built. In this file you can configure the ports, the application execution, networking, and environment variables.


## 4. Wiring up the container 
Now that you understand the base concept of the project, it's time to load up the container and start developing.  
Start the docker-machine by executing the shortcut `Docker Quickstart Terminal` (it should be available in your desktop).

### 4.1. Building the container  
You can go directly to the project folder via powershell, or you can `Shift + R. Click` the project folder, and choose `Open PowerShell window here`.

Then call docker-compose builder, in the Powershell type:

```
docker-compose build
```

The container is now built, but you can't start it directly, since you still miss the project files. In order to fix that, execute the following command in the powershell console:

```
docker-compose up -d
```

`
NOTE: if you run the docker in the daemon mode, you need to showdown it using the following command.  
`

```
docker-compose down
```

This command will allow the docker container run in a daemon, without interruption for the user.  
If you want to see the log outputs from the docker container, you can run the command without the `-d` parameter.

```
docker-compose up
```

## 5. Appendix  
If you want to cleanup docker images and containers

CAUTION: this will flush everything
### 5.1. stop all containers
```
docker stop $(docker ps -a -q)
```
### 5.2. remove all containers
```
docker rm $(docker ps -a -q)
```

### 5.3. remove all images

```
docker rmi -f $(docker images -a -q)
```