"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.GoodsReceiptController = void 0;
const openapi = require("@nestjs/swagger");
const common_1 = require("@nestjs/common");
const goods_receipt_service_1 = require("./goods-receipt.service");
const create_goods_receipt_dto_1 = require("./dto/create-goods-receipt.dto");
const update_goods_receipt_dto_1 = require("./dto/update-goods-receipt.dto");
const swagger_1 = require("@nestjs/swagger");
let GoodsReceiptController = class GoodsReceiptController {
    constructor(goodsReceiptService) {
        this.goodsReceiptService = goodsReceiptService;
    }
    create(createGoodsReceiptDto) {
        return this.goodsReceiptService.create(createGoodsReceiptDto);
    }
    findAll() {
        return this.goodsReceiptService.findAll();
    }
    findOne(id) {
        return this.goodsReceiptService.findOne(+id);
    }
    update(id, updateGoodsReceiptDto) {
        return this.goodsReceiptService.update(+id, updateGoodsReceiptDto);
    }
    remove(id) {
        return this.goodsReceiptService.remove(+id);
    }
};
exports.GoodsReceiptController = GoodsReceiptController;
__decorate([
    (0, common_1.Post)(),
    openapi.ApiResponse({ status: 201, type: String }),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_goods_receipt_dto_1.CreateGoodsReceiptDto]),
    __metadata("design:returntype", void 0)
], GoodsReceiptController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    openapi.ApiResponse({ status: 200, type: String }),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], GoodsReceiptController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(":id"),
    openapi.ApiResponse({ status: 200, type: String }),
    __param(0, (0, common_1.Param)("id")),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], GoodsReceiptController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(":id"),
    openapi.ApiResponse({ status: 200, type: String }),
    __param(0, (0, common_1.Param)("id")),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_goods_receipt_dto_1.UpdateGoodsReceiptDto]),
    __metadata("design:returntype", void 0)
], GoodsReceiptController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(":id"),
    openapi.ApiResponse({ status: 200, type: String }),
    __param(0, (0, common_1.Param)("id")),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], GoodsReceiptController.prototype, "remove", null);
exports.GoodsReceiptController = GoodsReceiptController = __decorate([
    (0, swagger_1.ApiTags)("goods-receipt"),
    (0, common_1.Controller)("goods-receipt"),
    __metadata("design:paramtypes", [goods_receipt_service_1.GoodsReceiptService])
], GoodsReceiptController);
//# sourceMappingURL=goods-receipt.controller.js.map