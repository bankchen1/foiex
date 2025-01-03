import { Module } from '@nestjs/common';
import { TradeController } from './trade.controller';
import { TradeService } from './trade.service';
import { OrderMatchingEngine } from './engines/order-matching.engine';
import { AssetModule } from '../asset/asset.module';

@Module({
  imports: [AssetModule],
  controllers: [TradeController],
  providers: [TradeService, OrderMatchingEngine],
  exports: [TradeService],
})
export class TradeModule {}
