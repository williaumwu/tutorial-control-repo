# tutorial-control-repo

Elasticdev.io control repo for the tutorial

This is control repo used for Elasticdev.io's tutorial.  It is repo used to control the continuous delivery for a sample flask application.  For details on the anatomy of the repo: http://www.elasticdev.io/docs/configuration/anatomy-of-the-control-repo/

The control repo consists of an elasticdev folder that contain:

    - elasticdev/elasticdev.yml  - controls the infrastructure, build, and deploy for a particular project

    - elasticdev/access/ssh_keys - the folder that contain the ssh public keys of users who have access to build and deploy containers.  use one file per key.

    - elasticdev/configs/build - the folder that contains the templates (e.g. Dockerfile.ja2) and files used for testing and building the code in containers

    - elasticdev/configs/deploy - the folder that contains the templates and files for deploying to a Dockerhost or a Kubernetes

    - elasticdev/scripts - scripts used in the project for continuous delivery.

# WHAT YOU NEED

1) GitHub Account 
2) AWS Access key and secret key

3) Dockerhub account
4) Dockerhub destination @ https://hub.docker.com/r/<username>/flask-sample

   or 

   simply an empty docker registry/repo named "flask-sample"

# PLEASE CHANGE

1) Add Public ssh key (access/ssh_keys)

   e.g. johndoe
   
   cp -rp /home/johndoe/.ssh/id_rsa.pub elasticdev/access/ssh_keys/johndoe.pub
   
2) Change username in elasticdev/elasticdev.yml
   
   - insert your github username where it has \<username\>\ in the file
   - insert your dockerhub username where it has \<docker_username\>\ in the file
   - insert your AWS region that you onboarding where it has \<region\>\ in the file

# EXPLANATION

  relevant files:

     -  elasticdev/configs/build/Dockerfile - The Dockerfile used to build the docker container 
                                               for the flask-sample
       
     -  elasticdev/configs/deploy/Dockerfile.ja2 - The Dockerfile template used to create the 
                                                    deploy container for the flask-sample
     
     -  elasticdev/configs/deploy/docker-compose.yml.ja2 - The docker-compose used to the 
                                                            properly deploy the flask-sample application
     
     -  elasticdev/elasticdev.yml - the main control file used for ElasticDev
     
     -  elasticdev/access/ssh_keys - ssh keys that will allow you access to 
                                     the build and deploy containers
       
     -  elasticdev/scripts - the directory for miscellaneous scripts that can be used by 
                              build and deploy 
     
     -  elasticdev/scripts/install_mysql.sh - the script used to install mysql client tools for the 
                                               deploy container
     
     -  elasticdev/scripts/createdb.sh - the script used to create the flask-sample database in MySQL
     
     -  elasticdev/scripts/create_schema.sh - the script used to create the flask-sample schema in 
                                               the flask-sample database in MySQL
     
     -  elasticdev/scripts/seed.sql - the seed sql statement used by create_schema.sh`
