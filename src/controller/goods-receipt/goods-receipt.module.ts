import { Module } from '@nestjs/common';
import { GoodsReceiptService } from './goods-receipt.service';
import { GoodsReceiptController } from './goods-receipt.controller';

@Module({
  controllers: [GoodsReceiptController],
  providers: [GoodsReceiptService],
})
export class GoodsReceiptModule {}
