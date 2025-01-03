import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { SupabaseService } from '../../shared/supabase/supabase.service';
import { Asset, Transaction, TransactionStatus, TransactionType } from './types/asset.types';
import { CreateTransactionDto, WithdrawDto, DepositDto } from './dto/asset.dto';

@Injectable()
export class AssetService {
  constructor(private readonly supabase: SupabaseService) {}

  async getUserBalance(userId: string, currency: string): Promise<Asset> {
    const { data: asset, error } = await this.supabase.client
      .from('assets')
      .select('*')
      .eq('userId', userId)
      .eq('currency', currency)
      .single();

    if (error) throw new NotFoundException('Asset not found');
    return asset;
  }

  async getUserBalances(userId: string): Promise<Asset[]> {
    const { data: assets, error } = await this.supabase.client
      .from('assets')
      .select('*')
      .eq('userId', userId);

    if (error) throw new Error('Failed to fetch user balances');
    return assets;
  }

  async createDeposit(userId: string, depositDto: DepositDto): Promise<Transaction> {
    const { data: transaction, error } = await this.supabase.client
      .from('transactions')
      .insert([{
        userId,
        currency: depositDto.currency,
        amount: depositDto.amount,
        type: TransactionType.DEPOSIT,
        status: TransactionStatus.PENDING,
        txHash: depositDto.txHash,
      }])
      .select()
      .single();

    if (error) throw new Error('Failed to create deposit');
    return transaction;
  }

  async createWithdrawal(userId: string, withdrawDto: WithdrawDto): Promise<Transaction> {
    // Check if user has sufficient balance
    const asset = await this.getUserBalance(userId, withdrawDto.currency);
    if (asset.balance < withdrawDto.amount) {
      throw new BadRequestException('Insufficient balance');
    }

    const { data: transaction, error } = await this.supabase.client
      .from('transactions')
      .insert([{
        userId,
        currency: withdrawDto.currency,
        amount: withdrawDto.amount,
        type: TransactionType.WITHDRAWAL,
        status: TransactionStatus.PENDING,
      }])
      .select()
      .single();

    if (error) throw new Error('Failed to create withdrawal');
    return transaction;
  }

  async getTransactionHistory(userId: string): Promise<Transaction[]> {
    const { data: transactions, error } = await this.supabase.client
      .from('transactions')
      .select('*')
      .eq('userId', userId)
      .order('createdAt', { ascending: false });

    if (error) throw new Error('Failed to fetch transaction history');
    return transactions;
  }

  async updateTransactionStatus(
    transactionId: string,
    status: TransactionStatus,
  ): Promise<Transaction> {
    const { data: transaction, error } = await this.supabase.client
      .from('transactions')
      .update({ status })
      .eq('id', transactionId)
      .select()
      .single();

    if (error) throw new Error('Failed to update transaction status');
    return transaction;
  }
}
