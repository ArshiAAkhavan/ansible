Kafka cluster
=========

this is a playbook for deploying a kafka cluster

Requirements
------------

this playbook by default installs(if neccessery) and configure the firewall so that only nodes can communicate to one another(you can disable it by setting the 'allow_firewall_config' to false)

this playbook works base on ssh protocol so enabled ssh cominucation is required

so if the ssh is set on diffrent port and you dont have any firewall installed on your servers and you wish the play book to configure it for you, please install the firewall yourself and add your ssh port to the firewall

Playbook Variables
--------------

there are three key variable set that needs to be set in this playe book

1) kafka-hosts.txt wich contains the informations about Brokers IP_adress, Zookeeper nodes, and the joining nodes

p.s:  note that the ansible is going to run only on joining nodes and uses the Brokers and Zookeepers group as additional data for configurating and ...

2) roles/config/vars/main.yml witch contains the cluster information such as cluster zookeeper data directory , brokers data directory ...

3) roles/prerequisites/vars/main.yml witch contains switches and essential data for things that needs to be done before we start deploying the cluster

Dependencies
------------

no special dependencies is required for this playbook

note that this playbook only deploys the cluster on Debian and RHEL based systems

How To Use
----------------

just simply run the command below on an ansible-system
```
ansible-playbook -i kafka-hosts.txt kafka.yml --extra-vars='{"apply_prerequisites":"true" ,  "allow_install":"true" , "allow_config":"true" , "allow_run":"true"}'

```
where each variable passad by --extra-vars disables a role if not set to true

Author Information
------------------

e-mail: letmemakenewone@gmail.com

github: ArshiAAkhavan
