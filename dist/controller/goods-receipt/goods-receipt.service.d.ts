import { CreateGoodsReceiptDto } from './dto/create-goods-receipt.dto';
import { UpdateGoodsReceiptDto } from './dto/update-goods-receipt.dto';
export declare class GoodsReceiptService {
    create(createGoodsReceiptDto: CreateGoodsReceiptDto): string;
    findAll(): string;
    findOne(id: number): string;
    update(id: number, updateGoodsReceiptDto: UpdateGoodsReceiptDto): string;
    remove(id: number): string;
}
