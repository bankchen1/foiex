import { Controller, Get, Post, Body, Param, Delete, UseGuards, Req } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { TradeService } from './trade.service';
import { CreateOrderDto } from './dto/trade.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';

@ApiTags('trades')
@Controller('trades')
@UseGuards(JwtAuthGuard)
export class TradeController {
  constructor(private readonly tradeService: TradeService) {}

  @Post('orders')
  @ApiOperation({ summary: 'Create new order' })
  @ApiResponse({ status: 201, description: 'Order created successfully' })
  async createOrder(@Req() req, @Body() createOrderDto: CreateOrderDto) {
    return this.tradeService.createOrder(req.user.id, createOrderDto);
  }

  @Delete('orders/:id')
  @ApiOperation({ summary: 'Cancel order' })
  @ApiResponse({ status: 200, description: 'Order cancelled successfully' })
  async cancelOrder(@Req() req, @Param('id') orderId: string) {
    return this.tradeService.cancelOrder(req.user.id, orderId);
  }

  @Get('orderbook/:symbol')
  @ApiOperation({ summary: 'Get order book for symbol' })
  @ApiResponse({ status: 200, description: 'Returns order book' })
  async getOrderBook(@Param('symbol') symbol: string) {
    return this.tradeService.getOrderBook(symbol);
  }

  @Get('orders')
  @ApiOperation({ summary: 'Get user orders' })
  @ApiResponse({ status: 200, description: 'Returns user orders' })
  async getUserOrders(@Req() req) {
    return this.tradeService.getUserOrders(req.user.id);
  }

  @Get('history')
  @ApiOperation({ summary: 'Get user trade history' })
  @ApiResponse({ status: 200, description: 'Returns user trade history' })
  async getUserTrades(@Req() req) {
    return this.tradeService.getUserTrades(req.user.id);
  }
}
