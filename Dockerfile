# Base Image
FROM node:18

# Create app directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app code
COPY . .

# Expose port (should match your .env)
EXPOSE 4001

# Command to run the app
CMD ["npm", "start"]
