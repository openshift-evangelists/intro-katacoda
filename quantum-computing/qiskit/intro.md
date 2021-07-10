# What will you learn

This lab will allow you to test how you can integrate quantum workloads in OpenShift. It provides a development environment to implement quantum algorithms and runs them on IBM quantum computers or simulators. The scenarios will introduce two operators namely, OpenShift Qiskit operator and OpenShift IBM quantum operator.

## Qiskit

Qiskit [quiss-kit] is an open source SDK for working with quantum computers at the level of pulses, circuits and algorithms.

## IBM Quantum Experience

IBM Quantum Experience is quantum on the cloud. With IBM Quantum Experience you can

* put quantum to work by running experiments on IBM Q systems and simulators available to the public and IBM Q Network
* develop, deploy and explore quantum applications in areas such as chemistry, optimization, finance, and AI
* stay informed and contribute to the future of quantum. Be part of the largest quantum community

## OpenShift Qiskit Operator

Operator sets up QiskitPlayground for implementing quantum circuits.

QiskitPlayground is a [Jupyter Notebook](https://jupyter.org/) with the qiskit libraries enabled for implementing quantum circuits. It comes with pre installed python packages for visualising results. QiskitPlayground can run the quantum circuits on simulator or on real quantum machines using [IBMQ Account](https://quantum-computing.ibm.com/).

To run on real quantum backend, QiskitPlayground reads the IBM Q account API token from a secret file mounted on the QiskitPlayground pod.

## OpenShift IBM Quantum Operator

OpenShift IBM quantum operator creates a flexible serving system for quantum circuits implemented in Qiskit. You can submit quantum workloads implemented in Qiskit which are executed on IBM Quantum Experience. Workloads are executed as pods, orchestrated and managed by Kube APIs.

## Concepts

* Jupyter Notebook
* Qiskit

## Requirement

You will need to create an account [here](https://quantum-computing.ibm.com/) once the account has been created. Go to the [account menu](https://quantum-computing.ibm.com/account) and copy the token as it will be used during installation.
