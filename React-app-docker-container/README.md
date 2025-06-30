# DevOps Fullstack Application

A modern fullstack application built with React, Node.js, and Docker, designed for DevOps deployment on EC2.

## 🚀 Features

- **Frontend**: React 18 with React Router and modern CSS
- **Backend**: Node.js with Express, modular architecture
- **DevOps**: Docker containers, ready for EC2 deployment
- **Security**: Helmet middleware, CORS configuration
- **Monitoring**: Health check endpoints, logging
- **Responsive**: Mobile-friendly design

## 📁 Project Structure

```
React-app-docker-container/
├── frontend/                 # React application
│   ├── src/
│   │   ├── components/      # Reusable components
│   │   ├── pages/          # Page components
│   │   ├── styles/         # CSS files
│   │   └── services/       # API services
│   ├── Dockerfile          # Frontend container
│   └── nginx.conf          # Nginx configuration
├── backend/                 # Node.js API
│   ├── routes/             # API routes
│   ├── controllers/        # Route controllers
│   ├── middlewares/        # Custom middleware
│   ├── config/             # Configuration files
│   └── Dockerfile          # Backend container
├── docker-compose.yml      # Container orchestration
└── README.md              # This file
```

## 🛠️ Technology Stack

### Frontend
- React 18
- React Router DOM
- Axios
- Modern CSS with responsive design

### Backend
- Node.js
- Express.js
- Morgan (logging)
- Helmet (security)
- CORS middleware

### DevOps
- Docker
- Docker Compose
- Nginx (production server)
- Health checks

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose
- Node.js (for local development)

### Local Development

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd React-app-docker-container
   ```

2. **Start with Docker Compose**
   ```bash
   docker-compose up --build
   ```

3. **Access the application**
   - Frontend: http://localhost
   - Backend API: http://localhost:5000
   - Health Check: http://localhost:5000/api/health

### Development Mode

1. **Start Backend**
   ```bash
   cd backend
   npm install
   npm start
   ```

2. **Start Frontend**
   ```bash
   cd frontend
   npm install
   npm start
   ```

## 📊 API Endpoints

- `GET /` - Root endpoint with app info
- `GET /api/health` - Health check endpoint
- `GET /*` - 404 handler

## 🐳 Docker Commands

### Build and Run
```bash
# Build all services
docker-compose build

# Start all services
docker-compose up

# Run in background
docker-compose up -d

# Stop all services
docker-compose down
```

### Individual Services
```bash
# Build frontend only
docker-compose build frontend

# Build backend only
docker-compose build backend

# View logs
docker-compose logs -f backend
docker-compose logs -f frontend
```

## 🌐 Deployment to EC2

### Prerequisites
- EC2 instance with Docker installed
- Security groups configured for ports 80 and 5000

### Deployment Steps

1. **SSH into your EC2 instance**
   ```bash
   ssh -i your-key.pem ubuntu@your-ec2-ip
   ```

2. **Clone and deploy**
   ```bash
   git clone <repository-url>
   cd React-app-docker-container
   docker-compose up -d --build
   ```

3. **Verify deployment**
   ```bash
   docker-compose ps
   curl http://localhost/api/health
   ```

### Environment Variables

Create `.env` files for production:

**Backend (.env)**
```env
NODE_ENV=production
PORT=5000
CORS_ORIGIN=http://your-domain.com
```

## 🔧 Configuration

### Frontend Configuration
- Update API endpoints in `src/services/`
- Modify nginx configuration in `nginx.conf`
- Customize styles in `src/styles/`

### Backend Configuration
- Environment variables in `config/default.js`
- Add new routes in `routes/`
- Implement controllers in `controllers/`

## 📝 Adding Database

When you're ready to add a database:

1. **Add database service to docker-compose.yml**
2. **Install database driver in backend**
3. **Create database models and migrations**
4. **Update environment variables**

## 🔍 Monitoring

- **Health Checks**: `/api/health` endpoint
- **Logs**: `docker-compose logs -f`
- **Container Status**: `docker-compose ps`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with Docker
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For issues and questions:
- Check the logs: `docker-compose logs`
- Verify health status: `curl http://localhost:5000/api/health`
- Ensure ports are available: `netstat -tulpn | grep :80` 