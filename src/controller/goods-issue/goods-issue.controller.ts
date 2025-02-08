import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from "@nestjs/common";
import { GoodsIssueService } from "./goods-issue.service";
import { CreateGoodsIssueDto } from "./dto/create-goods-issue.dto";
import { UpdateGoodsIssueDto } from "./dto/update-goods-issue.dto";
import { ApiTags } from "@nestjs/swagger";

@ApiTags("goods-issue")
@Controller("goods-issue")
export class GoodsIssueController {
  constructor(private readonly goodsIssueService: GoodsIssueService) {}

  @Post()
  create(@Body() createGoodsIssueDto: CreateGoodsIssueDto) {
    return this.goodsIssueService.create(createGoodsIssueDto);
  }

  @Get()
  findAll() {
    return this.goodsIssueService.findAll();
  }

  @Get(":id")
  findOne(@Param("id") id: string) {
    return this.goodsIssueService.findOne(+id);
  }

  @Patch(":id")
  update(
    @Param("id") id: string,
    @Body() updateGoodsIssueDto: UpdateGoodsIssueDto,
  ) {
    return this.goodsIssueService.update(+id, updateGoodsIssueDto);
  }

  @Delete(":id")
  remove(@Param("id") id: string) {
    return this.goodsIssueService.remove(+id);
  }
}
