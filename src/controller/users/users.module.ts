import { Module } from "@nestjs/common";
import { UsersService } from "./users.service";
import { UsersController } from "./users.controller";
import { TypeOrmModule } from "@nestjs/typeorm/dist/typeorm.module";
import { UserAuth } from "src/db/entities/UserAuth";
import { UserAuthLog } from "src/db/entities/UserAuthLog";
import { Users } from "src/db/entities/Users";

@Module({
  imports: [TypeOrmModule.forFeature([Users, UserAuth, UserAuthLog])],
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
