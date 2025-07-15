# Stage 1: Build the Angular project
FROM node:22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the Angular source code
COPY . .

# Build Angular project (default prod)
RUN npm run build -- --configuration production

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/www/*

# Copy built Angular files from builder
COPY --from=builder /app/dist/agent_framework_web/browser /usr/share/nginx/www
COPY --from=builder /app/nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy custom Nginx config if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port and run Nginx
EXPOSE 80 8080
CMD ["nginx", "-g", "daemon off;"]