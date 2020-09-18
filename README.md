# Terraspace Demo: Dependency Graphs

Terraspace project demonstrates how Terraspace is able to build the dependency graph and deploy multiple stacks at once. It creates a bunch of random_pet resources with dependencies on each other.

Learn more:

* [Terraspace Terraform Framework](https://terraspace.cloud/).
* [Deploy Multiple Stacks](https://terraspace.cloud/docs/dependencies/deploy-all/).

## Graphs

To draw the full dependency graph defined by this project's resources:

    terraspace all graph

Produces this:

![](https://img.boltops.com/boltops/repos/terraspace-graph-demo/full-graph.png)

Note: a3 is a stack/node is not parent and has no children.

To draw a targeted subgraphs:

    terraspace all graph a2 b2

Produces this:

![](https://img.boltops.com/boltops/repos/terraspace-graph-demo/subgraph-a2-b2.png)

The green nodes are the targeted stacks.

## Deploy

To deploy all the stacks with their resources:

    terraspace all up

Terraspace provides a preview before deploying:

    $ terraspace all up
    Will run:
       terraspace up a3 # batch 1
       terraspace up c1 # batch 1
       terraspace up c3 # batch 1
       terraspace up e1 # batch 1
       terraspace up b1 # batch 2
       terraspace up b3 # batch 2
       terraspace up d1 # batch 2
       terraspace up a2 # batch 3
       terraspace up c2 # batch 3
       terraspace up b2 # batch 4
       terraspace up a1 # batch 5
    Are you sure? (y/N)

To deploy subgraphs, specify the stacks:

    $ terraspace all up a2 b2
    Building one stack to build all stacks
    Building .terraspace-cache/us-west-2/dev/stacks/c2
    Downloading tfstate files for dependencies defined in tfvars...
    Built in .terraspace-cache/us-west-2/dev/stacks/c2
    Will run:
       terraspace up c1 # batch 1
       terraspace up c3 # batch 1
       terraspace up e1 # batch 1
       terraspace up b3 # batch 2
       terraspace up d1 # batch 2
       terraspace up a2 # batch 3
       terraspace up c2 # batch 3
       terraspace up b2 # batch 4
    Are you sure? (y/N)
