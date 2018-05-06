# Mini Project 

Utilizing Terraform infrastructure as code
to provision new AWS resources and configure a web server.

## Getting Started

These instructions will outline how to provision an AWS EC2 instance running a webserver (nginx) for development and testing purposes.  The Security Group will allow port 80 HTTP and port 22 SSH access from everywhere.  If this were a production server SSH access would only be allowed from a Bastion Host and access to the Bastion Host access would be restricted by IP.  

### Resulting Environment

The provisioned server will have the following:  

NGINX
Chef-solo
  Chef-solo will be installed to enable any customer cookbooks to be run.  The assumption here is that many Stelligent       customers will not allow unfettered access the their network and servers.  If the customer uses Chef then their cookbooks could be used to provision servers to the customer specifications.
Git will be installed
  The script script.sh will be executed as part of the provisioning.  This will install nginx and use sed to modify the default nginx webpage to dislplay the requested words: “Automation for the People”  
  A second script script1.sh will be executed that will install various software including chefdk and chef-solo

### Prerequisites

Terraform installed on a local machine and an AWS account for deployment

Clone the git repo
```
git clone https://github.com/sloanm/aws-webserver-mini-project.git
```

Should you wish to ssh into the webserver after provisioning create ssh keys.
Create ssh keys in the mini_project directory 
```
#ssh-keygen -f sshkeys
```


### Installing

```
terraform init
```
run terraform plan to save the state
```
terraform plan -out outfile
```
Apply the changes to AWS
```
terraform apply outfile
```

Obtain the public IP address and paste into a browser to view the desired index.html page

```
until finished
```
copy the public ip address from AWS into your browser to view the index.html page
