yum remove -y abrt

yum install -y epel-release

curl -o /etc/yum.repos.d/scylla.repo -L http://repositories.scylladb.com/scylla/repo/ebf6cb4a-f429-4ce3-8f57-ed7f7d76cffc/centos/scylladb-3.3.repo

yum install -y  scylla

sudo scylla_setup

sudo systemctl start scylla-server
