# Bookstore MVC Application

This is a Spring Boot MVC application with JSP support. It is containerized using Docker and deployed automatically using Jenkins CI/CD pipeline.

---

## Project Structure

- `src/main/java` – Java source files (Controllers, Services, Models)
- `src/main/webapp` – JSP views
- `pom.xml` – Maven configuration
- `Dockerfile` – Docker container setup
- `Jenkinsfile` – Jenkins pipeline automation

---

## Features

- Built with Spring Boot 3 and Java 17
- Uses JSP for the view layer
- JUnit tests for controllers, services, and models
- Automated CI/CD with Jenkins:
  - Code checkout
  - Maven build and test
  - Docker image creation
  - Image push to Docker Hub
  - Deployment to server on port `8088`

---

## Docker

To build the Docker image manually:

```bash
docker build -t husain7/bookstore:latest .
