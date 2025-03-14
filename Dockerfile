ARG NODE_VERSION="18-alpine"
ARG NGINX_VERSION="stable-alpine"


## BUILD STAGE ##

# Use the latest LTS version of Node.js
FROM node:${NODE_VERSION} AS build
# Set the working directory inside the container
WORKDIR /app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the rest of your application files
COPY . .
# Builds the optimized production files
RUN npm run build


## PRODUCTION STAGE ##

# Uses Nginx to serve static files
FROM nginx:${NGINX_VERSION} AS production
# Copies the build output from the previous stage
COPY --from=build /app/dist /usr/share/nginx/html
# Exposes port 80 to run the application
EXPOSE 80
# Runs Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
