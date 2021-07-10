#!/bin/bash
echo "Cloning git repository"

git clone https://github.com/qiskit-community/openshift-quantum-operators.git openshift-quantum-operators &> /dev/null
cd openshift-quantum-operators/ &> /dev/null

echo "Git clone complete and OpenShift Ready ...."

export PS1="$ "
stty echo
