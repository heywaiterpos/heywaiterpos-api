"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppModule = void 0;
const common_1 = require("@nestjs/common");
const app_service_1 = require("./app.service");
const config_1 = require("@nestjs/config");
const utils_1 = require("./common/utils/utils");
const auth_module_1 = require("./controller/auth/auth.module");
const users_module_1 = require("./controller/users/users.module");
const throttler_1 = require("@nestjs/throttler");
const typeorm_1 = require("@nestjs/typeorm");
const orders_module_1 = require("./controller/orders/orders.module");
const products_module_1 = require("./controller/products/products.module");
const categories_module_1 = require("./controller/categories/categories.module");
const goods_receipt_module_1 = require("./controller/goods-receipt/goods-receipt.module");
const goods_issue_module_1 = require("./controller/goods-issue/goods-issue.module");
const inventory_module_1 = require("./controller/inventory/inventory.module");
const roles_module_1 = require("./controller/roles/roles.module");
const typeorm_service_1 = require("./db/typeorm/typeorm.service");
const path = require("path");
const envFilePath = (0, utils_1.getEnvPath)(path.resolve(__dirname, "../"));
let AppModule = class AppModule {
};
exports.AppModule = AppModule;
exports.AppModule = AppModule = __decorate([
    (0, common_1.Module)({
        imports: [
            throttler_1.ThrottlerModule.forRoot([
                {
                    ttl: 60,
                    limit: 10,
                },
            ]),
            config_1.ConfigModule.forRoot({
                envFilePath,
                isGlobal: true,
            }),
            typeorm_1.TypeOrmModule.forRootAsync({ useClass: typeorm_service_1.TypeOrmConfigService }),
            auth_module_1.AuthModule,
            users_module_1.UsersModule,
            orders_module_1.OrdersModule,
            products_module_1.ProductsModule,
            categories_module_1.CategoriesModule,
            goods_receipt_module_1.GoodsReceiptModule,
            goods_issue_module_1.GoodsIssueModule,
            inventory_module_1.InventoryModule,
            roles_module_1.RolesModule,
        ],
        controllers: [],
        providers: [app_service_1.AppService],
    })
], AppModule);
//# sourceMappingURL=app.module.js.map