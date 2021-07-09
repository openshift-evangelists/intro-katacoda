## Objective

The objectives of this scenario are to familiarize you with the concept of a schema registry and to get experience using one.

In this scenario we'll use the schema registry published by [Apricurio](https://www.apicur.io/registry/).


## What you need to know to start

In order to get full benefit from taking this scenario it helps to have a basic understanding of the usefulness of a schema registry and the pupose it serves when managing data in a distributed architecture.

Essentially a schema registry is a single source of truth for defining data schemas. Developers store schemas that describe the various data structures used by their services and APIs in a schema registry. Consumers query the schema registry to discover the schema(s) of the data that is to be submitted to and will be emitted from the given service or API.

![using a schema registry](apicurio/assets/schema-registry.png)

Server side developers and machine intelligence can use a schema registry to validate data coming into a service. Client side consumers can use a schema registry to ensure that data being submitted to a target conforms to the structure and types expected by the given service.


## Contents

This scenario is divided into the following lessons.

* **Lesson 1** - Install Apicurio under Docker
* **Lesson 2** - Add schemas to the registry
* **Lesson 3** - Use the Apicurio web interface
* **Lesson 4** - Work with the Apicurio API at the command line

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](kind-intro/assets/command.png)

just click on it and the command will execute in the interactive terminal window.

Click the START SCENARIO button to start.
