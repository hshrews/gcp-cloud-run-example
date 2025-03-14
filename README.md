# Preact App for Google Cloud Run

This repository gives you a sample code and instruction to deploy a react application to Google Cloud run.

Prerequisite

* Must have the docker desktop app in your machine.
* Must have the node version installed in your machine.

## Getting Started

* `npm run dev`: Starts a dev server at http://localhost:5173/

* `npm run build`: Builds for production, emitting to `dist/`

* `npm run preview`: Starts a server at http://localhost:4173/ to test production build locally

## Building in Docker

Docker is a container platform that allows you to build, test, and deploy applications quickly.
A developer defines all the applications and its dependencies in a Dockerfile which is then used to build Docker images that defines a Docker container. Doing this ensures that your application will run in any environment.

### What is a Container?

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

Note: You can clone this project and follow the below commands

### Build the Application for Production

```bash
docker build -t cloud-run-app .
```

### Run the Production Application

```bash
docker run -p 80:80 cloud-run-app
```

After successfully building the docker app, open docker desktop to verify whether the app is running.

## Steps to deploy the project to your google cloud run

Before doing the below steps, make sure that you have gcloud installed in your machine and the default project is selected using the gcloud command before you are deploying.

```bash
gcloud services enable artifactregistry.googleapis.com

gcloud artifacts repositories create {repo-name} --repository-format=docker --location=us-central1 --description="created repo"

gcloud auth configure-docker us-central1-docker.pkg.dev

docker tag {local-image-name} us-central1-docker.pkg.dev/{project-name}/{repo-name}/{gcp-image-name}

docker push us-central1-docker.pkg.dev/{project-name}/{repo-name}/{gcp-image-name}
```

## References

* [Google Cloud Run: What, Why and How?](https://medium.com/@midhunbalan.dev/google-cloud-run-what-why-and-how-806e048df811)
* [How to Dockerize a React App: A Step-by-Step Guide for Developers](https://www.docker.com/blog/how-to-dockerize-react-app/)