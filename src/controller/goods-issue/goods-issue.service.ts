import { Injectable } from '@nestjs/common';
import { CreateGoodsIssueDto } from './dto/create-goods-issue.dto';
import { UpdateGoodsIssueDto } from './dto/update-goods-issue.dto';

@Injectable()
export class GoodsIssueService {
  create(createGoodsIssueDto: CreateGoodsIssueDto) {
    return 'This action adds a new goodsIssue';
  }

  findAll() {
    return `This action returns all goodsIssue`;
  }

  findOne(id: number) {
    return `This action returns a #${id} goodsIssue`;
  }

  update(id: number, updateGoodsIssueDto: UpdateGoodsIssueDto) {
    return `This action updates a #${id} goodsIssue`;
  }

  remove(id: number) {
    return `This action removes a #${id} goodsIssue`;
  }
}
