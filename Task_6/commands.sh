#!/bin/bash

# creating the users and group
sudo useradd -m alice
sudo useradd -m bob
sudo groupadd project_group

# adding the users to the group
sudo usermod -aG project_group alice
sudo usermod -aG project_group bob

#compress the files directory
zip -r files.zip files

#chande the owner and group
sudo chown alice:project_group files.zip

#change the permissions
chmod 540 files.zip
