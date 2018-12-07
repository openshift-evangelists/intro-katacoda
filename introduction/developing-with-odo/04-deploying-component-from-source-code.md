With the `backend` component running and connected to persistent storage, we are ready to bring up the frontend component and connect it to the backend. Once again, source code for the component is already available in the command line environment. Change directories to the `frontend` directory.

`cd ~/frontend`{{execute}}

Listing the contents of this directory shows that `frontend` is a Node.js application.

`ls`{{execute}}

Since `frontend` is written in an interpreted language, there is no build step analogous to the maven build we performed for the `backend` component. We can proceed directly to specifying the `nodejs` environment from the cluster's software catalog.

We give this Node.js component the name `frontend`.

`odo create nodejs frontend`{{execute}}

`odo` will update you on the progress of creating the component, and you should see output similar to this:

```
 ✓   Checking component
 ✓   Checking component version
 ✓   Creating component frontend
 OK  Component 'frontend' was created and port 8080/TCP was opened
 OK  Component 'frontend' is now set as active component
To push source code to the component run 'odo push'
```

When we created the backend component, we viewed the logs via the terminal. You can also follow the status of your container creation in the web console. Click the Dashboard tab and make sure you're in the project named "myproject". Click **Overview** in the left navigation to go to the Overview section, where you should see the following:

![OKD Web Console](../../assets/introduction/developing-with-odo/frontend-console.png)

Once the deployment finishes, you'll see the pod become available. Now let's go back to the terminal so we can push our code. 

With the component named and created, we can `push` Node.js source code from the current directory, `frontend`.

`odo push`{{execute}}

You should see output similar to this:

```
Pushing changes to component: frontend
 ✓   Waiting for pod to start
 ✓   Copying files to pod
 ✓   Building component
 OK  Changes successfully pushed to component: frontend
```
