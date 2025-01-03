# Cryptocurrency Exchange Platform

A robust and scalable cryptocurrency exchange platform built with NestJS.

## Features

- Real-time market data using WebSocket
- User authentication with JWT and 2FA
- Order book management
- Asset management (deposits/withdrawals)
- Trading engine
- KYC/AML integration
- Admin panel

## Tech Stack

- **Backend**: NestJS, TypeORM, PostgreSQL, Redis
- **Real-time Communication**: Socket.IO
- **API Documentation**: Swagger
- **Authentication**: JWT, Google Authenticator
- **Third-party Services**: Binance API, SendGrid, Twilio

## Prerequisites

- Node.js (v16 or higher)
- PostgreSQL
- Redis
- Docker (optional)

## Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```
3. Copy `.env.example` to `.env` and update the values
4. Start PostgreSQL and Redis
5. Run migrations:
   ```bash
   npm run typeorm:run-migrations
   ```

## Running the Application

### Development
```bash
npm run start:dev
```

### Production
```bash
npm run build
npm run start:prod
```

## API Documentation

Once the application is running, visit `/api-docs` for the Swagger documentation.

## Testing

```bash
# Unit tests
npm run test

# e2e tests
npm run test:e2e

# Test coverage
npm run test:cov
```

## Architecture

The application follows a modular architecture with the following main components:

- **Market Module**: Handles market data and WebSocket connections
- **Auth Module**: Manages user authentication and authorization
- **User Module**: User management and profiles
- **Asset Module**: Handles user assets and transactions
- **Trade Module**: Order matching and execution

## Security Features

- JWT-based authentication
- Rate limiting
- Input validation
- SQL injection protection
- XSS protection
- CORS configuration
- 2FA support

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License.
