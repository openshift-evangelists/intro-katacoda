## Objective
The objective of this lesson is to use the Apicurio API to perform various searches for schemas stored in the schema registry.

## What you'll be doing

In this lesson you will conduct the following searches

* Get a list of the IDs of all artifacts stored in the schema registry
* Get the first schema from the list of artifact IDs
* Get all the schemas or schema descriptions that have the term `Bob`
* Get all the Protocol Buffer schemas


## Steps

**Step 1:** Get a list of IDs of all the artifacts stored in the schema registry. Format the output as JSON.

`SCHEMAS=$(curl -s localhost:8080/api/artifacts) && echo $SCHEMAS`{{execute}}

`["0cee3836-5a0a-47f4-a647-baedf6246f25","10b69421-0a31-4f8c-ac99-87173bf09a63","e36f1780-b4e1-4663-8848-67743d99a457","9abed1f6-366c-4186-872f-c442079ea9ae"]`

**Step 2:** Get the schema associated with the first artifact ID.


`SCHEMA_ID=$(echo $SCHEMAS | jq '.[0]' | sed -e 's/^"//' -e 's/"$//') && echo $SCHEMA_ID`{{execute}}

You'll get output similar to the following:

`ce60dcd4-9063-4685-b8cc-7a259da78f17`

`curl -s localhost:8080/api/artifacts/$SCHEMA_ID`{{execute}}

The output you get will be determined by the type of schema retrieved. For example, you might get back one of the PROTOBUF schemas. In that case your response will look like the following:

```
syntax = "proto3";

package simplegrpc;

/* Describes an array of floats to be processed */
message Request {
    repeated double numbers = 1;
}

/* Describes the result of processing */
message Response {
    double result = 1;
}

/* Describes the request for a repeated value
 value, the string to repeat
 limit, the number of times to repeat
 */
message RepeatRequest {
    string value = 1;
    int32 limit = 2;
}

/* Describes the response for a repeated value
 value, the repeated string
 limit, the ordinal position in the response stream
 */
message RepeatResponse {
    string value = 1;
    int32 counter = 2;
}

/* Describes the response from a Ping call
 */
message PingResponse {
    string result = 1;
}

/* Describes the request to a Ping call
 */
message PingRequest {
    string data = 1;
}

service SimpleService {
    rpc Add (Request) returns (Response) {
    }

    rpc Subtract (Request) returns (Response) {
    }

    rpc Multiply (Request) returns (Response) {
    }

    rpc Divide (Request) returns (Response) {
    }

    rpc Repeat (RepeatRequest) returns (stream RepeatResponse) {
    }

    rpc Ping (PingRequest) returns (PingResponse) {
    }

    rpc Pings (PingRequest) returns (repeated PingResponse) {
    }
}
```


**Step 3:** Search the registry for artifacts that contain the term `Bob` and return the results in JSON format.

`curl -s localhost:8080/api/search/artifacts?search=Bob | json_pp -json_opt pretty,canonical`{{execute}}

You'll get results similar to the following:

```
{
   "artifacts" : [
      {
         "createdOn" : 1614227597726,
         "description" : "A product from Big Bob's Thinking Tools catalog",
         "id" : "ff96e3e3-8afc-4e26-b154-9a53895acbae",
         "modifiedOn" : 1614227597726,
         "name" : "Big Bob's Thinking Tools",
         "state" : "ENABLED",
         "type" : "JSON"
      }
   ],
   "count" : 1
}

```



**Step 4:** Search the schema registry for schemas of type, `PROTOBUF`


`curl -s localhost:8080/api/search/artifacts?search=PROTOBUF | json_pp -json_opt pretty,canonical`{{execute}}

You'll get results similar to the following:

```
{
   "artifacts" : [
      {
         "createdOn" : 1614278635241,
         "id" : "01c40a46-cfff-4ce5-a315-72197a81afac",
         "modifiedOn" : 1614278635241,
         "name" : "Seat Saver",
         "state" : "ENABLED",
         "type" : "PROTOBUF"
      },
      {
         "createdOn" : 1614278620827,
         "id" : "ce60dcd4-9063-4685-b8cc-7a259da78f17",
         "modifiedOn" : 1614278620827,
         "name" : "Simple Schema",
         "state" : "ENABLED",
         "type" : "PROTOBUF"
      }
   ],
   "count" : 2
}


```

---

***Congratulations! You've finished the secnario.***
