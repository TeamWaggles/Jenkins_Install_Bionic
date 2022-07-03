# Jenkins install on Ubuntu Bionic

## Objective:

Automated installation and configuration of Jenkins using a Bash script on a fresh vagrant box with Ubuntu 16.04 LTS (Xenial).

## Requirements for Technical Assessment:
* (a) The solution must run on a clean installation of the chosen operating system without errors.
* (b) Jenkins and its prerequisites must be installed without a manual intervention.
* (c) Jenkins must be configured to serve requests over port 8000. (NOTE: No port forwarding)
* (d) Subsequent applications of the solution should not cause failures or repeat redundant configuration tasks.

## Prerequisites and Assumptions

### Configuration and software prerequisites

* Use of preconfigured box via Vagrant: https://app.vagrantup.com/ubuntu/boxes/bionic64
* Use of clean Ubuntu 16.04 image for virtual box VM created via Vagrant
* Vagrant version 2.2.3
* VirtualBox version 5.1.22 r115126 (Qt5.6.2)
* Java 8 will be installed prior to Jenkins being installed
* Jenkins will be available on port 8000 during installation
* VM will have a virtualbox host-only interface with IP address of 35.25.35.125 to test host access to Jenkins within VM
* Vagrantfile will be used to provision the VM within Virtualbox
* This project was tested upon MAC OS X 10.14.3, also using iTerm2, Build 3.2.7. This installation  would work with Linux. Not tested on any other Linux distro or on Windows.
* The testing script was written in bash for Linux.
* Subsequent executions from within the VM using "vagrant provision" will re-run the script more quickly than the original "Vagrant up"

### GitHub repository

https://GitHub.com/TeamWaggles/Jenkins_Install_Bionic

This repo will contain all files for this project; Vagrantfile, jenkins.sh and README. These files should all be placed in the same local directory upon download.

### vagrant configuration

The Vagrantfile uses a Ubuntu 16.04 LTS box from Vagrant 

The Vagrantfile will configure the VM as follows:
* (1) defines box to add
* (2) Configures a private network with ip of 35.25.35.125 (allows use of host browser to validate Jenkins connectivity)
* (3) Allocates just 1536MB of memory to the VM (host limitation on test environment)
* (4) Configures the shell provisioner to run the jenkins.sh bash script


### Testing Directions

Clone the referenced GitHub repository into a new directory.

Execute the provided Vagrant file. The Vagrant file will then execute the jenkins.sh. The installation process takes a few minutes.

* (a) Install Jenkins key via apt-key add, if necessary, when Jenkins keys are not present
* (b) Create the apt sources file for Jenkins, if not present
* (c) Perform an apt-get update
* (d) Install the latest jenkins package, if necessary.
* (e) Modify the Jenkins port to 8000 from 8080, as required
* (f) Restarts Jenkins service
* (g) Run "vagrant ssh" at the command line 
* (h) Ensure that Jenkins service is running on the VM
* (i) Run "ps -ef | grep Jenkins" within the VM to see that Jenkins services are running and that port 8000 is used


## Questions

### 1) Describe the most difficult hurdle you had to overcome in implementing your solution 

Building the logic to configure the port to 8000 from 8080. I knew I needed to use sed, however finding the correct syntax took some trial and error to finally get it right. It's one of those fixes that is not soon forgotten.


### 2) A brief paragraph explaining the steps required to apply your solution. Please explicitly state all assumptions.

- Ideally, this solution should be run on a MacBook Pro or in a Linux Ubuntu environment.
- Virtual Box 5.x and higher should be adequate to run Vagrant
- Place the cloned GitHub repo into a new directory on your Mac, or Linux environment.
- Start your terminal program and navigate to the folder with the cloned repo, you should see Vagrantfile
- At the command line run "Vagrant up"
- The process should take approximately 3 minutes to run
- When the process completes you'll be provided the Jenkins Administrator password 
- Open a browser and navigate to 35.25.35.125:8000
- You will then have a screen where you are prompted to input Administrator credentials
- You can input the password to continue configuring Jenkins, if you so choose



### 3) Where did you go to find information to help you 

Without a doubt, Google was my friend right off the bat, what I found particularly helpful were the Jenkins installation instructions, which provided high level information on installation via automation. This has been an incredible learning experience. I knew that a Bash script would be the way the go and to have the Vagrantfile invoke that script.

I used the documentation found on www.vagrantup.com and jenkins.io. I researched Stackoverflow to find the logic to pull the Administrator out and echo the output at the end of the installation.




### 4) Briefly explain what automation means to you, and why it is important to an organization's infrastructure design strategy 

Automation provides time saving at a high level, and that in and of itself is significant. However, to be able to deploy applications, infrastructure, users, etc. for developers who need those resources on an on demand basis is truly game changing. The cost savings of having systems up and running on cloud infrastructures, or on premise, for specific applications/reasons would be a boon to most any organization.
