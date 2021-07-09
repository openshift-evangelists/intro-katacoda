## Objective
The objective of this lesson is to install the Apicurio schema registry as a Docker container.

## Steps

**Step 1:** Download the Docker image

`docker pull apicurio/apicurio-registry-mem:1.3.2.Final`{{execute}}

**Step 2:** Create the Docker container for Apicurio

`docker run -d -p 8080:8080 apicurio/apicurio-registry-mem:1.3.2.Final`{{execute}}

**Step 3:** Confirm that the Apicurio schema registry is up and running by making a `curl` call against it.

`curl localhost:8080/api/artifacts`{{execute}}

You'll get a response as follows because no schemas have been added to the schema registry:

`[]`

**BEWARE:** Sometimes it can take a minute or two for Apicurio to initialize in the Katacoda VM. Thus, you might have to click the `curl` command shown above in Step 3 a few times to get the expected response.

---

***Next: Adding schemas to the registry***
