"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UpdateGoodsIssueDto = void 0;
const openapi = require("@nestjs/swagger");
const swagger_1 = require("@nestjs/swagger");
const create_goods_issue_dto_1 = require("./create-goods-issue.dto");
class UpdateGoodsIssueDto extends (0, swagger_1.PartialType)(create_goods_issue_dto_1.CreateGoodsIssueDto) {
    static _OPENAPI_METADATA_FACTORY() {
        return {};
    }
}
exports.UpdateGoodsIssueDto = UpdateGoodsIssueDto;
//# sourceMappingURL=update-goods-issue.dto.js.map