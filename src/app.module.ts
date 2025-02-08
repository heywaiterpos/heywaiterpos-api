import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";
import { ConfigModule } from "@nestjs/config";
import { getEnvPath } from "./common/utils/utils";
import { AuthModule } from "./controller/auth/auth.module";
import { UsersModule } from "./controller/users/users.module";
import { ThrottlerModule } from "@nestjs/throttler";
import { TypeOrmModule } from "@nestjs/typeorm";
import { OrdersModule } from "./controller/orders/orders.module";
import { ProductsModule } from "./controller/products/products.module";
import { CategoriesModule } from "./controller/categories/categories.module";
import { GoodsReceiptModule } from "./controller/goods-receipt/goods-receipt.module";
import { GoodsIssueModule } from "./controller/goods-issue/goods-issue.module";
import { InventoryModule } from "./controller/inventory/inventory.module";
import { RolesModule } from "./controller/roles/roles.module";
import { TypeOrmConfigService } from "./db/typeorm/typeorm.service";
import * as path from "path";
const envFilePath: string = getEnvPath(path.resolve(__dirname, "../"));

@Module({
  imports: [
    ThrottlerModule.forRoot([
      {
        ttl: 60,
        limit: 10,
      },
    ]),
    ConfigModule.forRoot({
      envFilePath,
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({ useClass: TypeOrmConfigService }),
    AuthModule,
    UsersModule,
    OrdersModule,
    ProductsModule,
    CategoriesModule,
    GoodsReceiptModule,
    GoodsIssueModule,
    InventoryModule,
    RolesModule,
  ],
  controllers: [],
  providers: [AppService],
})
export class AppModule {}
