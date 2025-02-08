import { CreateGoodsIssueDto } from './dto/create-goods-issue.dto';
import { UpdateGoodsIssueDto } from './dto/update-goods-issue.dto';
export declare class GoodsIssueService {
    create(createGoodsIssueDto: CreateGoodsIssueDto): string;
    findAll(): string;
    findOne(id: number): string;
    update(id: number, updateGoodsIssueDto: UpdateGoodsIssueDto): string;
    remove(id: number): string;
}
