# Use the official Node.js 14 image as a build environment
FROM node:14 AS build

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build TypeScript code
RUN npm run build

# Use a smaller Node.js image for production
FROM node:14-slim

# Set the working directory
WORKDIR /usr/src/app

# Copy built files from the previous stage
COPY --from=build /usr/src/app/dist ./dist
COPY package*.json ./

# Install only production dependencies
RUN npm install

# Expose port 3000
EXPOSE 3000

# Define the command to run your app
CMD [ "node", "./dist/index.js" ]
