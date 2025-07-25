# Docker Containerization Project – YOLO E-Commerce Platform

This document provides a detailed explanation of the choices and configurations made while containerizing and orchestrating the YOLO E-Commerce platform using Docker and Docker Compose.

---

## 1. Base Image Selection

### 🟦 Backend (Node.js API)
- **Image:** `node:14-alpine`
- **Reason:** A minimal, secure, and efficient base image suitable for production. It reduces image size significantly while maintaining compatibility with Express.js.

### 🟦 Frontend (React client)
- **Image (Build stage):** `node:14-alpine`
- **Image (Runtime):** `nginx:alpine`
- **Reason:** A multi-stage build allows us to separate build logic from serving logic, resulting in a much smaller production image served efficiently by Nginx.

---

## 2. Dockerfile Directives

### 🧱 Backend Dockerfile
- Used `npm install --production` to only install runtime dependencies.
- `EXPOSE 5000` declared for the backend API server.
- Used `CMD ["node", "server.js"]` for clarity and simplicity.

### 🧱 Frontend Dockerfile
- Multi-stage build to compile React using Node, and serve it using Nginx.
- `COPY --from=build /app/build /usr/share/nginx/html` used to copy static assets.
- `EXPOSE 80` exposes Nginx's default port.

---

## 3. Docker Compose Networking

- A **custom bridge network** named `app-net` is defined.
- This allows inter-container communication using service names (e.g., `backend` can reach `mongo` via `mongo:27017`).
- The network is defined under the `networks:` section and attached to each service.

```yaml
networks:
  app-net:
    driver: bridge
