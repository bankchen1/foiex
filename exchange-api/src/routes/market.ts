import express from 'express';
import { MarketController } from '../controllers/market';

const router = express.Router();
const marketController = new MarketController();

/**
 * @swagger
 * /markets:
 *   get:
 *     tags: [Markets]
 *     summary: Get all market data
 *     responses:
 *       200:
 *         description: List of market data
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/definitions/Market'
 */
router.get('/', marketController.getMarkets);

/**
 * @swagger
 * /markets/{symbol}:
 *   get:
 *     tags: [Markets]
 *     summary: Get market data for a specific symbol
 *     parameters:
 *       - in: path
 *         name: symbol
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Market data for the symbol
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/definitions/Market'
 *       404:
 *         description: Symbol not found
 */
router.get('/:symbol', marketController.getMarket);

/**
 * @swagger
 * /markets/{symbol}/klines:
 *   get:
 *     tags: [Markets]
 *     summary: Get kline data for a symbol
 *     parameters:
 *       - in: path
 *         name: symbol
 *         required: true
 *         schema:
 *           type: string
 *       - in: query
 *         name: interval
 *         schema:
 *           type: string
 *           enum: [1m, 5m, 15m, 30m, 1h, 4h, 1d, 1w]
 *       - in: query
 *         name: limit
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Kline data for the symbol
 *       404:
 *         description: Symbol not found
 */
router.get('/:symbol/klines', marketController.getKlines);

export default router;
