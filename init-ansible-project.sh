#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]
then
  echo " Error! - Usage: $0 <project-name>  "
  exit 1
fi

mkdir -p $PROJECT_NAME/{inventory,inventory/hosts,playbooks,templates,collections,roles,vars,scripts,tests}

cat <<EOF > $PROJECT_NAME/ansible.cfg
[defaults]
remote_user=automation
host_key_checking=false
inventory=inventory
roles_path=./roles
collections_path=./collections

[privilege_escalation]
become=true
become_ask_pass=false
become_user=root
become_method=true

EOF

echo " '$PROJECT_NAME' created! "
