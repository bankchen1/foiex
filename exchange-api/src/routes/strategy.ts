import express from 'express';
import { StrategyController } from '../controllers/strategy';
import { authMiddleware } from '../middlewares/auth';

const router = express.Router();
const strategyController = new StrategyController();

/**
 * @swagger
 * /strategies:
 *   get:
 *     tags: [Strategies]
 *     summary: Get all strategies
 *     parameters:
 *       - in: query
 *         name: page
 *         schema:
 *           type: integer
 *         description: Page number
 *       - in: query
 *         name: limit
 *         schema:
 *           type: integer
 *         description: Items per page
 *       - in: query
 *         name: sort
 *         schema:
 *           type: string
 *         description: Sort field
 *       - in: query
 *         name: filter
 *         schema:
 *           type: string
 *         description: Filter criteria
 *     responses:
 *       200:
 *         description: List of strategies
 */
router.get('/', strategyController.getStrategies);

/**
 * @swagger
 * /strategies/{id}:
 *   get:
 *     tags: [Strategies]
 *     summary: Get strategy by ID
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Strategy details
 *       404:
 *         description: Strategy not found
 */
router.get('/:id', strategyController.getStrategy);

/**
 * @swagger
 * /strategies/{id}/trades:
 *   get:
 *     tags: [Strategies]
 *     summary: Get strategy trades
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *       - in: query
 *         name: page
 *         schema:
 *           type: integer
 *       - in: query
 *         name: limit
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: List of trades
 *       404:
 *         description: Strategy not found
 */
router.get('/:id/trades', strategyController.getStrategyTrades);

/**
 * @swagger
 * /follow:
 *   post:
 *     tags: [Strategies]
 *     summary: Follow a strategy
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               strategyId:
 *                 type: string
 *               allocation:
 *                 type: number
 *               maxLoss:
 *                 type: number
 *               leverageEnabled:
 *                 type: boolean
 *               leverage:
 *                 type: number
 *     responses:
 *       200:
 *         description: Successfully followed strategy
 *       401:
 *         description: Unauthorized
 */
router.post('/follow', authMiddleware, strategyController.followStrategy);

/**
 * @swagger
 * /follow/{id}:
 *   put:
 *     tags: [Strategies]
 *     summary: Update follow configuration
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/definitions/FollowConfig'
 *     responses:
 *       200:
 *         description: Configuration updated successfully
 *       401:
 *         description: Unauthorized
 */
router.put('/follow/:id', authMiddleware, strategyController.updateFollowConfig);

/**
 * @swagger
 * /follow/{id}/stop:
 *   post:
 *     tags: [Strategies]
 *     summary: Stop following a strategy
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Successfully stopped following
 *       401:
 *         description: Unauthorized
 */
router.post('/follow/:id/stop', authMiddleware, strategyController.stopFollowing);

export default router;
