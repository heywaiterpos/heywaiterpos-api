"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const testing_1 = require("@nestjs/testing");
const goods_receipt_controller_1 = require("./goods-receipt.controller");
const goods_receipt_service_1 = require("./goods-receipt.service");
describe('GoodsReceiptController', () => {
    let controller;
    beforeEach(async () => {
        const module = await testing_1.Test.createTestingModule({
            controllers: [goods_receipt_controller_1.GoodsReceiptController],
            providers: [goods_receipt_service_1.GoodsReceiptService],
        }).compile();
        controller = module.get(goods_receipt_controller_1.GoodsReceiptController);
    });
    it('should be defined', () => {
        expect(controller).toBeDefined();
    });
});
//# sourceMappingURL=goods-receipt.controller.spec.js.map