# Build phase

FROM node:alpine as builder
WORKDIR  '/app'
COPY package.json .
RUN npm install
# Straight copy
COPY . . 
RUN npm run build

# Run Phase
FROM nginx
# Copy over something from builder phase
COPY --from=builder /app/build /usr/share/nginx/html

# Default command will start up nginx for us:wq



