import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MarketModule } from './modules/market/market.module';
import { AuthModule } from './modules/auth/auth.module';
import { UserModule } from './modules/user/user.module';
import { AssetModule } from './modules/asset/asset.module';
import { TradeModule } from './modules/trade/trade.module';
import { SupabaseModule } from './shared/supabase/supabase.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    SupabaseModule,
    MarketModule,
    AuthModule,
    UserModule,
    AssetModule,
    TradeModule,
  ],
})
export class AppModule {}