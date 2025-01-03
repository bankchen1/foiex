import { IsString, IsNumber, IsEnum, Min } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';
import { TransactionType } from '../types/asset.types';

export class CreateTransactionDto {
  @ApiProperty()
  @IsString()
  currency: string;

  @ApiProperty()
  @IsNumber()
  @Min(0)
  amount: number;

  @ApiProperty({ enum: TransactionType })
  @IsEnum(TransactionType)
  type: TransactionType;
}

export class WithdrawDto extends CreateTransactionDto {
  @ApiProperty()
  @IsString()
  address: string;
}

export class DepositDto extends CreateTransactionDto {
  @ApiProperty()
  @IsString()
  txHash: string;
}
