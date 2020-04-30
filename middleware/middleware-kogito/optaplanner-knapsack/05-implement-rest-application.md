In the previous step you've implemented the constraints of the application using the `ConstraintStreams` API. We will now create the RESTful resource of our application and take the application for a test-drive.

#KnapsackResource

When we created the initial OptaPlanner Quarkus application using the Quarkus Maven Plugin, we defined the resource class of our RESTful endpoint, being `KnapsackResource`.

We will now implement the skeleton of our `KnapsackSolution` class. To do this, we first have to open the `KnapsackResource.java` file by clicking: `knapsack-optaplanner-quarkus/src/main/java/com/redhat/knapsackoptaplanner/solver/KnapsackResource.java`{{open}}

The `KnapsackResource` class will be implemented as a Kogito JAX-RS service. We will inject an OptaPlanner `SolverManager` instance to manage the `Solver` instances that will solve our problem. `SolverManager` accepts (uninitialized) `PlanningSolutions` (i.e. the problem), and will pass this problem to a managed `Solver` that runs on a separate thread to solve it. The `SolverJob` will run until solving ends, after which we can retrieve the final best solution.

<pre class="file" data-filename="./knapsack-optaplanner-quarkus/src/main/java/com/redhat/knapsackoptaplanner/solver/KnapsackResource.java" data-target="replace">
package com.redhat.knapsackoptaplanner.solver;

import java.util.UUID;
import java.util.concurrent.ExecutionException;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.redhat.knapsackoptaplanner.domain.KnapsackSolution;

import org.optaplanner.core.api.solver.SolverJob;
import org.optaplanner.core.api.solver.SolverManager;


@Path("/knapsack")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class KnapsackResource {

    @Inject
    private SolverManager<KnapsackSolution, UUID> solverManager;

    @POST
    @Path("/solve")
    public KnapsackSolution solve(KnapsackSolution problem) {
        UUID problemId = UUID.randomUUID();
        // Submit the problem to start solving
        SolverJob<KnapsackSolution, UUID> solverJob = solverManager.solve(problemId, problem);
        KnapsackSolution solution;
        try {
            // Wait until the solving ends
            solution = solverJob.getFinalBestSolution();
        } catch (InterruptedException | ExecutionException e) {
            throw new IllegalStateException("Solving failed.", e);
        }
        return solution;
    }
}
</pre>


## Running the Application
Since we still have our application running in Quarkus dev-mode, we can simply access the Swagger-UI of our application by clicking [here](https://[[CLIENT_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/swagger-ui). Hitting this endpoint will force the OptaPlanner Quarkus application to do a hot-reload, and recompile and deploy the changes we made in our application "on-the-fly".

You will see our `/knapsack/solve` RESTful API listed. We can now fire a RESTful request with a knapsack problem to this endpoint. We wil do this from the terminal using cURL:

`curl --location --request POST 'http://localhost:8080/knapsack/solve' \
--header 'Accept: application/json' \
--header 'Content-Type: application/json' \
--header 'Content-Type: text/plain' \
--header 'Cookie: JSESSIONID=0C6C24091A814A4A0431ED5E32CE6B45' \
--data-raw '{
	"knapsack": {
		"maxWeight": 10
	},
	"ingots" : [
		{
			"weight": 4,
			"value": 15
		},
		{
			"weight": 4,
			"value": 15
		},
		{
			"weight": 3,
			"value": 12
		},
		{
			"weight": 3,
			"value": 12
		},
		{
			"weight": 3,
			"value": 12
		},
		{
			"weight": 2,
			"value": 7
		},
		{
			"weight": 2,
			"value": 7
		},
		{
			"weight": 2,
			"value": 7
		},
		{
			"weight": 2,
			"value": 7
		},
		{
			"weight": 2,
			"value": 7
		}
	]
}'`{{execute T2}}


## Congratulations!
You've implemented the RESTful endpoint of the application, hot-reloaded the app using the Quarkus dev-mode and solved a knapsack problem. Well done! In the next step we will deploy this application to OpenShift to run our OptaPlanner solution as a true cloud-native application.