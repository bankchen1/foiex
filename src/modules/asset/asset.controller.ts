import { Controller, Get, Post, Body, UseGuards, Req } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { AssetService } from './asset.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { CreateTransactionDto, WithdrawDto, DepositDto } from './dto/asset.dto';

@ApiTags('assets')
@Controller('assets')
@UseGuards(JwtAuthGuard)
export class AssetController {
  constructor(private readonly assetService: AssetService) {}

  @Get('balances')
  @ApiOperation({ summary: 'Get user balances' })
  @ApiResponse({ status: 200, description: 'Returns user balances' })
  async getUserBalances(@Req() req) {
    return this.assetService.getUserBalances(req.user.id);
  }

  @Post('deposit')
  @ApiOperation({ summary: 'Create deposit' })
  @ApiResponse({ status: 201, description: 'Deposit created successfully' })
  async createDeposit(@Req() req, @Body() depositDto: DepositDto) {
    return this.assetService.createDeposit(req.user.id, depositDto);
  }

  @Post('withdraw')
  @ApiOperation({ summary: 'Create withdrawal' })
  @ApiResponse({ status: 201, description: 'Withdrawal created successfully' })
  async createWithdrawal(@Req() req, @Body() withdrawDto: WithdrawDto) {
    return this.assetService.createWithdrawal(req.user.id, withdrawDto);
  }

  @Get('transactions')
  @ApiOperation({ summary: 'Get transaction history' })
  @ApiResponse({ status: 200, description: 'Returns transaction history' })
  async getTransactionHistory(@Req() req) {
    return this.assetService.getTransactionHistory(req.user.id);
  }
}
