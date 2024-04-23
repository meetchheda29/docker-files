# docker-files
This is the repository for storing all the dockerfiles for the three tire application

There are 2 docker files and one Yaml file.In a typical setup where you have a frontend built with React and a backend built with Node.js, using Docker and Docker Compose can streamline the development and deployment process

**The REACT Dockerfile**:-
Dockerfile: This file contains instructions to build a Docker image for your React frontend. It specifies the base image (usually a Node.js image), sets up the working directory, installs dependencies, copies the frontend code into the container, and builds the production-ready assets. 

FROM node:16-alpine: Specifies the base image to use, which is Node.js version 16 on Alpine Linux. This provides the environment needed to run Node.js applications.
WORKDIR /app: Sets the working directory inside the container to /app. This is where subsequent commands will be executed.
COPY package*.json ./: Copies the package.json and package-lock.json files from the host into the container's working directory. These files contain information about the project's dependencies.
RUN npm install: Installs the dependencies specified in the package.json file using npm (Node Package Manager).
COPY . .: Copies the rest of the application code from the host into the container's working directory. This includes all files and directories in the project.
RUN npm run build: Builds the React application. This command is typically used to compile JSX, bundle JavaScript files, and generate production-ready assets.
EXPOSE 3000: Informs Docker that the container will listen on port 3000 at runtime. This doesn't actually publish the port; it's just a way to document which ports are intended to be published.
CMD ["npm", "start"]: Specifies the command to run when the container starts. In this case, it starts the Node.js server using npm start, assuming that your package.json file includes a start script.

**The NODE Dockerfile**:-
Similar to the frontend Dockerfile, the backend Dockerfile contains instructions to build a Docker image for your Node.js backend. It specifies the base image (again, usually a Node.js image), sets up the working directory, installs dependencies (if any), copies the backend code into the container, and specifies the command to start the backend server.

FROM node:latest: Specifies the base image as the latest version of Node.js available on Docker Hub. This provides the necessary Node.js runtime environment to run Node.js applications.
WORKDIR /app: Sets the working directory inside the container to /app. Subsequent commands will be executed relative to this directory.
COPY package*.json app.js ./: Copies the package.json and app.js files from the host into the container's /app directory. These files are needed for installing dependencies and running the Node.js application.
COPY . .: Copies the rest of the application files from the host into the container's /app directory. This includes all files and directories in the project.
EXPOSE 5000: Informs Docker that the container will listen on port 5000 at runtime. This doesn't actually publish the port but documents which ports are intended to be published.
CMD ["node", "app.js"]: Specifies the command to run when the container starts. In this case, it starts the Node.js application by running the app.js file using the node command. 

**The Compose.yaml File**:-
docker-compose.yaml: This file defines the services (containers) that make up your application and how they interact with each other.

Frontend:
Image: 21bcp258front
Exposed port: 3000 (mapped to host port 3000)
Represents the frontend service of the application.
Backend:
Image: meetchheda29/21bcp258
Exposed port: 3001 (mapped to host port 3001)
Depends on: mongodb service
Environment variable:
MONGO_URI: Connection URI for MongoDB
Represents the backend service of the application.
MongoDB:
Image: mongo
Exposed port: 27017 (mapped to host port 27017)
Environment variables:
MONGO_INITDB_DATABASE: Default database name
MONGO_INITDB_ROOT_USERNAME: Root username for MongoDB
MONGO_INITDB_ROOT_PASSWORD: Root password for MongoDB
Represents the MongoDB service used by the backend.
