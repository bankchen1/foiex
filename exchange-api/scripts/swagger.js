const swaggerAutogen = require('swagger-autogen')();

const doc = {
  info: {
    title: 'Foiex API Documentation',
    description: 'API documentation for Foiex trading platform',
    version: '1.0.0',
  },
  host: process.env.API_URL || 'localhost:3000',
  basePath: '/',
  schemes: ['http', 'https'],
  consumes: ['application/json'],
  produces: ['application/json'],
  tags: [
    { name: 'Auth', description: 'Authentication endpoints' },
    { name: 'Market', description: 'Market data endpoints' },
    { name: 'Strategy', description: 'Strategy management endpoints' },
    { name: 'Trade', description: 'Trading related endpoints' },
  ],
  securityDefinitions: {
    bearerAuth: {
      type: 'apiKey',
      name: 'Authorization',
      in: 'header',
    },
  },
};

const outputFile = './swagger-output.json';
const endpointsFiles = ['./src/index.ts'];

swaggerAutogen(outputFile, endpointsFiles, doc);
