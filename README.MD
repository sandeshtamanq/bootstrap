# Node.js Project Starter

This repository provides a Node.js project boilerplate set up using TypeScript. It includes a ready-to-use project structure, essential dependencies, and scripts for development and production builds.

## Features

- **TypeScript** for type safety.
- **Express.js** for building web applications.
- **Environment configuration** using `.env` files.
- **Pre-configured project structure** for scalability.
- **Helpful utilities** like `eslint` and `prettier` for code formatting and linting.
- **Hot-reloading** with `nodemon` for development.

## Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v18 or later recommended)
- [npm](https://www.npmjs.com/) (comes with Node.js)

## Getting Started

Follow the steps below to bootstrap your project:

### 1. Clone or Download the Script

Download or clone the repository containing the `bootstrap.sh` script. Ensure the script has execute permissions:

```bash
chmod +x bootstrap.sh
```

### 2. Run the Script

Run the script with the desired project name:

```bash
./bootstrap.sh <project-name>
```

Replace `<project-name>` with the name of your project.

### 3. Navigate to Your Project

Move into the newly created project directory:

```bash
cd <project-name>
```

### 4. Install Dependencies

All necessary dependencies are installed during the script execution. However, if needed, you can reinstall them manually:

```bash
npm install
```

## Project Structure

The project follows a modular and scalable structure:

```
<project-name>/
├── src/
│   ├── app.ts        # Application setup
│   ├── server.ts     # Entry point of the server
│   ├── controllers/  # Controllers for handling requests
│   ├── middlewares/  # Custom middleware
│   ├── models/       # Data models
│   ├── routes/       # Route definitions
│   ├── services/     # Business logic
│   ├── utils/        # Utility functions
│   ├── config/       # Configuration files
│   └── types/        # TypeScript type definitions
├── tests/
│   ├── unit/         # Unit tests
│   └── integration/  # Integration tests
├── dist/             # Compiled JavaScript files (after build)
├── .env              # Environment variables
├── tsconfig.json     # TypeScript configuration
├── package.json      # Project metadata and scripts
└── README.md         # Project documentation
```

## Environment Variables

The `.env` file is used to manage environment-specific variables. Example:

```
PORT=3000
NODE_ENV=development
```

## Scripts

The following npm scripts are pre-configured:

- **`npm run dev`**: Start the application in development mode using `ts-node`.
- **`npm run build`**: Compile TypeScript to JavaScript.
- **`npm start`**: Run the compiled JavaScript application.

## Running the Application

### Development Mode

To start the server in development mode with hot-reloading:

```bash
npm run dev
```

The server will be available at [http://localhost:3000](http://localhost:3000).

### Production Mode

Build the application:

```bash
npm run build
```

Start the compiled application:

```bash
npm start
```

## Linting and Formatting

This project uses `eslint` and `prettier` for consistent code quality. Run the following commands:

- **Lint the code**:

  ```bash
  npx eslint .
  ```

- **Format the code**:

  ```bash
  npx prettier --write .
  ```

## License

This project is open-source and available under the [MIT License](LICENSE).
