# Stage 1: Base image
FROM node:14-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files and install only what's needed
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Expose backend port
EXPOSE 5000

# Start the server
CMD ["node", "server.js"]
