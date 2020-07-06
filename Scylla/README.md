Scylla cluster
=========

this is a playbook for deploying a Scylla cluster

Requirements
------------

this playbook works base on ssh protocol so enabled ssh cominucation is required
this playbook by default installs(if neccessery) and configure the firewall so that only nodes can communicate to one another(you can disable it by setting the 'allow_firewall_config' to false)

so if the ssh is set on diffrent port and you dont have any firewall installed on your servers and you wish the play book to configure it for you, please install the firewall yourself and add your ssh port to the firewall

Playbook Variables
--------------

there are two key variable set that needs to be set in this playe book

1) scylla-hosts.txt wich contains the informations about nodes IP_address, dataCenter, rack, and the seed nodes 

2) roles/config/vars/main.yml witch contains the cluster information such as cluster name and ...

Dependencies
------------

no special dependencies is required for this playbook

note that this playbook only deploys the cluster on Debian and RHEL based systems

How To Use
----------------

just simply run the command below on an ansible-system
```
ansible-playbook -i Scylla-hosts.txt Scylla.yml --extra-vars='{"allow_firewall_config":"true" , "allow_clean_up":"true" , "allow_install":"true" , "allow_config":"true" , "allow_run":"true"}' 
```
where each variable passad by --extra-vars disables a role if not set to false

Author Information
------------------

e-mail: a_akhavan@outlook.com

github: ArshiAAkhavan
