import { GoodsIssueService } from "./goods-issue.service";
import { CreateGoodsIssueDto } from "./dto/create-goods-issue.dto";
import { UpdateGoodsIssueDto } from "./dto/update-goods-issue.dto";
export declare class GoodsIssueController {
    private readonly goodsIssueService;
    constructor(goodsIssueService: GoodsIssueService);
    create(createGoodsIssueDto: CreateGoodsIssueDto): string;
    findAll(): string;
    findOne(id: string): string;
    update(id: string, updateGoodsIssueDto: UpdateGoodsIssueDto): string;
    remove(id: string): string;
}
