import { Module } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { AuthController } from "./auth.controller";
import { TokenService } from "./token.service";
import { UsersService } from "../users/users.service";
import { ConfigModule, ConfigService } from "@nestjs/config";
import { JwtModule } from "@nestjs/jwt";
import { PassportModule } from "@nestjs/passport";
import { UsersModule } from "../users/users.module";
import { TypeOrmModule } from "@nestjs/typeorm";
import { UserAuth } from "src/db/entities/UserAuth";
import { LocalStrategy } from "./strategies/local.strategy";
import { JwtStrategy } from "./strategies/jwt.strategy";
import { GoogleStrategy } from "./strategies/google.strategy";
import { Users } from "src/db/entities/Users";

@Module({
  imports: [
    UsersModule,
    PassportModule,
    JwtModule.registerAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: async (configService: ConfigService) => ({
        secret: configService.get<string>("JWT_ACCESS_TOKEN_SECRET"), // Fetch secret from environment variable
        signOptions: { expiresIn: "60m" },
        verifyOptions: { ignoreExpiration: false },
      }),
    }),
    TypeOrmModule.forFeature([Users, UserAuth]),
  ],
  controllers: [AuthController],
  providers: [
    AuthService,
    TokenService,
    UsersService,
    GoogleStrategy,
    LocalStrategy,
    JwtStrategy,
    TokenService,
    UsersService,
  ],
})
export class AuthModule {}
