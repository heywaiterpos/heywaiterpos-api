import { GoodsReceiptService } from "./goods-receipt.service";
import { CreateGoodsReceiptDto } from "./dto/create-goods-receipt.dto";
import { UpdateGoodsReceiptDto } from "./dto/update-goods-receipt.dto";
export declare class GoodsReceiptController {
    private readonly goodsReceiptService;
    constructor(goodsReceiptService: GoodsReceiptService);
    create(createGoodsReceiptDto: CreateGoodsReceiptDto): string;
    findAll(): string;
    findOne(id: string): string;
    update(id: string, updateGoodsReceiptDto: UpdateGoodsReceiptDto): string;
    remove(id: string): string;
}
