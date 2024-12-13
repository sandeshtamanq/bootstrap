#!/bin/bash

# Check for project name
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

# Create and navigate to the project directory
mkdir "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

# Initialize Node.js project
echo "Initializing Node.js project..."
npm init -y

# Install TypeScript and necessary dependencies
echo "Installing TypeScript and dependencies..."
npm install -D typescript ts-node @types/node @types/express nodemon eslint prettier @types/cookie-parser @types/cors
npm install express dotenv cookie-parser cors

# Create tsconfig.json
echo "Creating tsconfig.json..."
cat > tsconfig.json <<EOL
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "CommonJS",
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}

EOL

# Create project structure
echo "Setting up project structure..."
mkdir -p src/{controllers,middlewares,models,routes,services,utils,config,types} tests/{unit,integration}
touch src/{app.ts,server.ts} .env


cat > src/app.ts <<EOL
import express from 'express'
import cors from 'cors'
import cookieParser from 'cookie-parser'

const app = express()

app.use(
  cors({
    origin: 'localhost:4200',
    credentials: true,
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    allowedHeaders: ['Content-Type', 'Authorization'],
    preflightContinue: false,
  }),
)

app.use(cookieParser())

// Middleware to parse JSON
app.use(
  express.json({
    limit: '10mb',
  }),
)

//routes
app.get('/', (req, res) => {
  res.send('Hello, World!')
})

export default app

EOL


cat > src/server.ts <<EOL
import * as dotenv from 'dotenv'
dotenv.config()

import app from './app'

const PORT = process.env.PORT || 3000

function startApp() {
      app.listen(PORT, () => {
        console.log(`Server running on http://localhost:${PORT}`)
      })
}

startApp()

EOL


cat > .env <<EOL
PORT=3000
NODE_ENV=development
EOL

# Add build and start scripts to package.json
echo "Adding build and start scripts to package.json..."
npm pkg set scripts.build="tsc"
npm pkg set scripts.start="node dist/app.js"
npm pkg set scripts.dev="ts-node src/app.ts"

# Final message
echo "Project setup complete!"
echo "Navigate to the project folder ('$PROJECT_NAME') and run the following commands:"
echo "- npm run dev (to start the project in development mode)"
echo "- npm run build (to compile TypeScript to JavaScript)"
echo "- npm start (to run the compiled JavaScript)"
