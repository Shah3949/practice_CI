# Use the official Node.js 20 LTS image as the base
FROM node:20-slim

# Create and set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
# This allows Docker to cache installed layers if dependencies haven't changed
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy the rest of your application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Command to run the application
CMD [ "node", "app.js" ]