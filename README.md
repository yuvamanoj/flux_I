# MSS Flux GitOps

This repository holds the GitOps Flux configuration of our MSS deployments on OpenShift & Kubernetes.

## Contents

- [Structure](#structure)
- [Examples](#examples)
- [Troubleshooting](#troubleshooting)

## Structure

This repository is organized by environments.

```bash
└── inventories
    └── environments
        ├── inf-atl-stg-k8s-xpp
        ├── inf-dal09-dev-k8s-xpp
        ├── inf-dal09-dev-ocp-example
        └── inf-dal09-dev-ocp-xpp
```

Our naming convention for environments is as follows:

```sh
                    ┌─── one of 'k8s' (Kubernetes) or 'ocp' (OpenShift)
                    │
inf-environment-platform-namespace
         │                   └─── arbitrary namespace name within the platform
         │
         └─── one of 'atl-stg', 'dal09-dev', 'atl-prd'
```



## Examples

### 1. How to configure your application to be auto-deployed to dal09-dev OpenShift

* Prerequisites
  * Your application has been published as a Docker image and you have an available tag to reference
  * Your application Helm chart is available in your application's GitHub repository
* Create a fork or branch of this repo
  * Branch name should start with JIRA story prefix (XPS-*)
* In your fork or branch
  * Go to `inventories/environments/inf-dal09-dev-ocp-xpp` (`inventories/environments/inf-dal09-dev-ocp-example` if working an example)
  * Copy `helm-release.yml.tpl` to `{application_name}.yml`
  * Edit the new file
  * Replace `TEMPLATE_APP_NAME` with your application name
  * Replace `TEMPLATE_VALID_IMAGE_TAG` with a valid image tag such as 0.1.0-integration.ab4g9fc1
  * Replace `TEMPLATE_VALID_CHART_TAG` with a valid chart tag such as 1.0.0-integration (versioned separately from application)
  * Commit and push the changes
* Submit a pull request to the `master` branch of this repository
* Merge the pull request yourself

### 2. How to deploy a feature branch of `cs-alert-worker` to STG
This example walks you through the deployment of `XPS-45586` branch of `cs-alert-worker` on `inf-atl-stg-k8s-xpp` environment.

1. Update the [cs-alert-worker.yml](inventories/environments/inf-atl-stg-k8s-xpp/mdr/cs-alert-worker.yml) file:

      Replace the docker image tag name glob (typically your branch name):
    
	```diff
	-    filter.fluxcd.io/chart-image: glob:*-master.*
	+    filter.fluxcd.io/chart-image: glob:*-XPS-45586.*
	```
	
	Replace the branch name in chart reference pointer:
	```diff
  	chart:
    	git: git@github.ibm.com:managed-security/cs-alert-worker
	-   ref: master
	+   ref: XPS-45586
	```
    
	Replace the `image.tag` to the one from *Publish* step from your Jenkins pipeline.
	```diff
	image:
	    repository: mss-docker.artifactory.swg-devops.com/cs-alert-worker
   	-   tag: 0.0.1-master.ba44fd12
	+   tag: 0.0.1-xps45586.c4ea0fb9
	```
    
2. Submit a pull request to `master` branch of this repository.
3. Ask someone from your squad to review & merge your pull request.

You can find the commit this example is based on here: [94e8850d](https://github.ibm.com/managed-security/gitops-flux/commit/94e8850d420de0602bb97cf86a3a8b9c87fe55bb)

## Troubleshooting

### How to validate your application deployment on dal09-dev OCP
### How to validate your application deployment on dal09-dev K8
### How to troubleshoot application deployments



