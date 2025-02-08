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
exports.GoodsIssueController = void 0;
const openapi = require("@nestjs/swagger");
const common_1 = require("@nestjs/common");
const goods_issue_service_1 = require("./goods-issue.service");
const create_goods_issue_dto_1 = require("./dto/create-goods-issue.dto");
const update_goods_issue_dto_1 = require("./dto/update-goods-issue.dto");
const swagger_1 = require("@nestjs/swagger");
let GoodsIssueController = class GoodsIssueController {
    constructor(goodsIssueService) {
        this.goodsIssueService = goodsIssueService;
    }
    create(createGoodsIssueDto) {
        return this.goodsIssueService.create(createGoodsIssueDto);
    }
    findAll() {
        return this.goodsIssueService.findAll();
    }
    findOne(id) {
        return this.goodsIssueService.findOne(+id);
    }
    update(id, updateGoodsIssueDto) {
        return this.goodsIssueService.update(+id, updateGoodsIssueDto);
    }
    remove(id) {
        return this.goodsIssueService.remove(+id);
    }
};
exports.GoodsIssueController = GoodsIssueController;
__decorate([
    (0, common_1.Post)(),
    openapi.ApiResponse({ status: 201, type: String }),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_goods_issue_dto_1.CreateGoodsIssueDto]),
    __metadata("design:returntype", void 0)
], GoodsIssueController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    openapi.ApiResponse({ status: 200, type: String }),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], GoodsIssueController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(":id"),
    openapi.ApiResponse({ status: 200, type: String }),
    __param(0, (0, common_1.Param)("id")),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], GoodsIssueController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(":id"),
    openapi.ApiResponse({ status: 200, type: String }),
    __param(0, (0, common_1.Param)("id")),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, update_goods_issue_dto_1.UpdateGoodsIssueDto]),
    __metadata("design:returntype", void 0)
], GoodsIssueController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(":id"),
    openapi.ApiResponse({ status: 200, type: String }),
    __param(0, (0, common_1.Param)("id")),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", void 0)
], GoodsIssueController.prototype, "remove", null);
exports.GoodsIssueController = GoodsIssueController = __decorate([
    (0, swagger_1.ApiTags)("goods-issue"),
    (0, common_1.Controller)("goods-issue"),
    __metadata("design:paramtypes", [goods_issue_service_1.GoodsIssueService])
], GoodsIssueController);
//# sourceMappingURL=goods-issue.controller.js.map