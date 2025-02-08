"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const testing_1 = require("@nestjs/testing");
const goods_issue_controller_1 = require("./goods-issue.controller");
const goods_issue_service_1 = require("./goods-issue.service");
describe('GoodsIssueController', () => {
    let controller;
    beforeEach(async () => {
        const module = await testing_1.Test.createTestingModule({
            controllers: [goods_issue_controller_1.GoodsIssueController],
            providers: [goods_issue_service_1.GoodsIssueService],
        }).compile();
        controller = module.get(goods_issue_controller_1.GoodsIssueController);
    });
    it('should be defined', () => {
        expect(controller).toBeDefined();
    });
});
//# sourceMappingURL=goods-issue.controller.spec.js.map