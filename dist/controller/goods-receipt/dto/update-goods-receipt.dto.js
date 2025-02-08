"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UpdateGoodsReceiptDto = void 0;
const openapi = require("@nestjs/swagger");
const swagger_1 = require("@nestjs/swagger");
const create_goods_receipt_dto_1 = require("./create-goods-receipt.dto");
class UpdateGoodsReceiptDto extends (0, swagger_1.PartialType)(create_goods_receipt_dto_1.CreateGoodsReceiptDto) {
    static _OPENAPI_METADATA_FACTORY() {
        return {};
    }
}
exports.UpdateGoodsReceiptDto = UpdateGoodsReceiptDto;
//# sourceMappingURL=update-goods-receipt.dto.js.map