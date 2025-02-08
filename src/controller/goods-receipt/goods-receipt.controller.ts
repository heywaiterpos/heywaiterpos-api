import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from "@nestjs/common";
import { GoodsReceiptService } from "./goods-receipt.service";
import { CreateGoodsReceiptDto } from "./dto/create-goods-receipt.dto";
import { UpdateGoodsReceiptDto } from "./dto/update-goods-receipt.dto";
import { ApiTags } from "@nestjs/swagger";

@ApiTags("goods-receipt")
@Controller("goods-receipt")
export class GoodsReceiptController {
  constructor(private readonly goodsReceiptService: GoodsReceiptService) {}

  @Post()
  create(@Body() createGoodsReceiptDto: CreateGoodsReceiptDto) {
    return this.goodsReceiptService.create(createGoodsReceiptDto);
  }

  @Get()
  findAll() {
    return this.goodsReceiptService.findAll();
  }

  @Get(":id")
  findOne(@Param("id") id: string) {
    return this.goodsReceiptService.findOne(+id);
  }

  @Patch(":id")
  update(
    @Param("id") id: string,
    @Body() updateGoodsReceiptDto: UpdateGoodsReceiptDto,
  ) {
    return this.goodsReceiptService.update(+id, updateGoodsReceiptDto);
  }

  @Delete(":id")
  remove(@Param("id") id: string) {
    return this.goodsReceiptService.remove(+id);
  }
}
