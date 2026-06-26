# MEAN Stack Capstone Application

## Project Overview
This project involves containerizing and deploying a full-stack MEAN (MongoDB, Express, Angular, Node.js) application with a fully automated CI/CD pipeline.

## Tech Stack & Architecture
- **Frontend:** Angular 15 (Multi-stage Docker build)
- **Backend:** Node.js & Express (Multi-stage Docker build)
- **Database:** MongoDB (Containerized)
- **Proxy:** Nginx (Reverse Proxy)

## Architecture Diagram
[User Request] -> [Nginx (Port 80)] -> [Frontend (Static Files)]
                                     -> [Backend (Port 8080)] -> [MongoDB (Port 27017)]


## Installation & Local Setup
1. **Clone the repository**
   ```bash
   git clone [https://github.com/dakshsawhneyy/Capstone_Project_1.git](https://github.com/dakshsawhneyy/Capstone_Project_1.git)
   cd Capstone_Project_1
   
   # Install Required Dependencies
   ./setup.sh

   # Docker Compose up
   docker compose up -d 
   ```