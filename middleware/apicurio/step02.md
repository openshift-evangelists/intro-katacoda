## Objective

The objective of this lesson is to add schemas to the registry using the Apicurio API.

## What you'll be doing

In this lesson you are going to upload schemas to the Apicurio schema registry via the Apicurio API. Also, you're going to use the Apicurio API to add metadata about each schema. The schemas you're going to upload are in files that were automatically added to the Katacoda interactive learning enviornment when the Katacoda virtual machine started for this session.


## Adding Schemas
In the following steps you're going to add an [OpenApi](https://www.openapis.org/) schema, two [gRPC](https://grpc.io/)/[Protocol Buffers](https://developers.google.com/protocol-buffers/) schemas, and a schema in [JSON Schema](https://json-schema.org/) format.

### Add an OpenApi Schema

**Step 1:** Add a schema in [OpenApi](https://www.openapis.org/) format and assign the data in the response to the environment variable `RESPONSE`.

`RESPONSE=$(curl -s -X POST localhost:8080/api/artifacts -H "Content-Type: application/json" -H "X-Registry-ArtifactType: OPENAPI" --data-binary "@airport-codes.json") && echo $RESPONSE | json_pp -json_opt pretty,canonical`{{execute}}

You'll get output similar to the following:

```
{
   "createdOn" : 1614271164921,
   "description" : "A super great RESTful API that allows developers to lookup the codes for all the major international airports. Also, the API allows adminstrators to add a new airport code as needed.",
   "globalId" : 1,
   "id" : "68212a0e-6651-44b8-a033-50c82e6b8632",
   "modifiedOn" : 1614271164921,
   "name" : "Airport Codes Lookup API",
   "state" : "ENABLED",
   "type" : "OPENAPI",
   "version" : 1
}

```

Now add a label as metadata for the uploaded schema.

**Step 2:** Get the ID of the schema as issued by the schema registry and assign it to the environment variable `RESPONSE_ID`.

`RESPONSE_ID=$(echo $RESPONSE | jq '.id' | sed -e 's/^"//' -e 's/"$//') && echo $RESPONSE_ID`{{execute}}

You'll get output similar to the following. (Your `id` value will differ according to your Katacoda session.)

`4c4cb7ed-dc8f-4497-b5c7-9ee4f1507fad`

**Step 3:** Use the `curl` command to add the label `transportation` to the schema entry.

`curl -i -X PUT localhost:8080/api/artifacts/$RESPONSE_ID/meta -H "Content-Type: application/json" --data '{"labels": ["transportation"] }'`{{execute}}

You'll get a response similar to the following:

```
HTTP/1.1 204 No Content
Date: Thu, 25 Feb 2021 18:15:50 GMT
Expires: Wed, 24 Feb 2021 18:15:50 GMT
Pragma: no-cache
Cache-control: no-cache, no-store, must-revalidate
```

### Add a Protocol Buffers Schema

**Step 1:** Add a simple schema in [Protocol Buffers](https://developers.google.com/protocol-buffers/) format and assign the data in the response to the environment variable `RESPONSE`.

`RESPONSE=$(curl -s -X POST localhost:8080/api/artifacts -H "Content-Type: application/x-protobuf" -H "X-Registry-ArtifactType: PROTOBUF" --data-binary "@simple.proto") && echo $RESPONSE`{{execute}}

You'll get output similar to the following:

```
{"createdOn":1614277541722,"modifiedOn":1614277541722,"id":"a528691e-e318-4397-a958-93b3b3369f9b","version":1,"type":"PROTOBUF","globalId":2,"state":"ENABLED"}
```

**Step 2:** Get the ID of the schema as issued by the schema registry and assign it to the environment variable `RESPONSE_ID`.

`RESPONSE_ID=$(echo $RESPONSE | jq '.id' | sed -e 's/^"//' -e 's/"$//') && echo $RESPONSE_ID`{{execute}}

You'll get output similar to the following. (Your `id` value will differ according to your Katacoda session.)

`e837f91e-3cab-4bea-914d-0694fb48d5af`

**Step 3:** Name the schema entry in Apicurio, `Simple Schema` using `curl` against the Apicurio API.

`curl -i -X PUT localhost:8080/api/artifacts/$RESPONSE_ID/meta -H "Content-Type: application/json" --data '{"name": "Simple Schema" }'`{{execute}}

You'll get a response similar to the following:

```
HTTP/1.1 204 No Content
Date: Thu, 25 Feb 2021 18:18:36 GMT
Expires: Wed, 24 Feb 2021 18:18:36 GMT
Pragma: no-cache
Cache-control: no-cache, no-store, must-revalidate
```
### Add an Advanced Protocol Buffers Schema

**Step 1:** Add a more advanced schema in [Protocol Buffers](https://developers.google.com/protocol-buffers/) format and assign the data in the response to the environment variable `RESPONSE`.

`RESPONSE=$(curl -s -X POST localhost:8080/api/artifacts -H "Content-Type: application/x-protobuf" -H "X-Registry-ArtifactType: PROTOBUF" --data-binary "@seatsaver.proto") && echo $RESPONSE`{{execute}}

You'll get output similar to the following:

```
{"createdOn":1614277658840,"modifiedOn":1614277658840,"id":"7ca49a5f-7083-49f0-911f-f6be060fd90c","version":1,"type":"PROTOBUF","globalId":3,"state":"ENABLED"}

```

**Step 2:** Get the ID of the schema as issued by the schema registry and assign it to the environment variable `RESPONSE_ID`.

`RESPONSE_ID=$(echo $RESPONSE | jq '.id' | sed -e 's/^"//' -e 's/"$//') && echo $RESPONSE_ID`{{execute}}

You'll get output similar to the following. (Your `id` value will differ according to your Katacoda session.)

`7ca49a5f-7083-49f0-911f-f6be060fd90c`

**Step 3:** Set the Protocol Buffer schema's Name to `Seat Saver` in Apicurio using `curl` against the Apicurio API.

`curl -i -X PUT localhost:8080/api/artifacts/$RESPONSE_ID/meta -H "Content-Type: application/json" --data '{"name": "Seat Saver" }'`{{execute}}

You'll get a response similar to the following:

```
HTTP/1.1 204 No Content
Date: Thu, 25 Feb 2021 18:28:36 GMT
Expires: Wed, 24 Feb 2021 18:28:36 GMT
Pragma: no-cache
Cache-control: no-cache, no-store, must-revalidate
```

### Add a JSON Schema

**Step 1:** Add a schema in [JSON Schema](https://json-schema.org/) format and assign the data in the response to the environment variable `RESPONSE`.

`RESPONSE=$(curl -s -X POST localhost:8080/api/artifacts -H "Content-Type: application/json" -H "X-Registry-ArtifactType: JSON" --data-binary "@simple.json") && echo $RESPONSE`{{execute}}

You'll get output similar to the following:

```
{"name":"Big Bob's Thinking Tools","description":"A product from Big Bob's Thinking Tools catalog","createdOn":1614277836940,"modifiedOn":1614277836940,"id":"2411dd45-931a-4706-8cdf-ea3fe3fb56e3","version":1,"type":"JSON","globalId":4,"state":"ENABLED"}
```
**Step 2:** Get the ID of the schema as issued by the schema registry and assign it to the environment variable `RESPONSE_ID`.

`RESPONSE_ID=$(echo $RESPONSE | jq '.id' | sed -e 's/^"//' -e 's/"$//') && echo $RESPONSE_ID`{{execute}}

You'll get output similar to the following. (Your `id` value will differ according to your Katacoda session.)

`2411dd45-931a-4706-8cdf-ea3fe3fb56e3`

**Step 3:** Add the labels `tool` and `utility` to the schema entry in Apicurio.

`curl -i -X PUT localhost:8080/api/artifacts/$RESPONSE_ID/meta -H "Content-Type: application/json" --data '{"labels": ["tool", "utility"] }'`{{execute}}

You'll get a response similar to the following:

```
HTTP/1.1 204 No Content
Date: Thu, 04 Mar 2021 16:52:50 GMT
Expires: Wed, 03 Mar 2021 16:52:50 GMT
Pragma: no-cache
Cache-control: no-cache, no-store, must-revalidate
```


---
***Next: Using the Apicurio web interface***
