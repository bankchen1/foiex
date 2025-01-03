const swaggerAutogen = require('swagger-autogen')();

const doc = {
  info: {
    title: 'Foiex Trading Platform API',
    description: 'API documentation for Foiex Trading Platform',
    version: '1.0.0',
  },
  host: 'localhost:3000',
  basePath: '/api',
  schemes: ['http'],
  securityDefinitions: {
    bearerAuth: {
      type: 'apiKey',
      name: 'Authorization',
      in: 'header',
    },
  },
  definitions: {
    User: {
      id: 'string',
      firstName: 'string',
      lastName: 'string',
      email: 'string',
      nickname: 'string',
      avatar: 'string?',
      is2FAEnabled: 'boolean',
      createdAt: 'number',
      updatedAt: 'number',
    },
    Strategy: {
      id: 'string',
      name: 'string',
      description: 'string',
      creatorId: 'string',
      status: 'string',
      stats: {
        totalReturn: 'number',
        monthlyReturn: 'number',
        maxDrawdown: 'number',
        winRate: 'number',
        followers: 'number',
        runningDays: 'number',
      },
      createdAt: 'number',
      updatedAt: 'number',
    },
    FollowConfig: {
      id: 'string',
      userId: 'string',
      strategyId: 'string',
      allocation: 'number',
      maxLoss: 'number',
      leverageEnabled: 'boolean',
      leverage: 'number',
      status: 'string',
      createdAt: 'number',
      updatedAt: 'number',
    },
    Trade: {
      id: 'string',
      strategyId: 'string',
      symbol: 'string',
      side: 'string',
      price: 'string',
      quantity: 'string',
      profit: 'string',
      profitPercent: 'number',
      time: 'number',
    },
    Market: {
      symbol: 'string',
      price: 'string',
      change24h: 'number',
      volume24h: 'string',
      high24h: 'string',
      low24h: 'string',
      lastUpdate: 'number',
    },
  },
};

const outputFile = './swagger-output.json';
const endpointsFiles = ['./src/routes/*.ts'];

swaggerAutogen(outputFile, endpointsFiles, doc);
