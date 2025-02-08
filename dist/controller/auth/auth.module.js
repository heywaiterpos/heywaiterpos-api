"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthModule = void 0;
const common_1 = require("@nestjs/common");
const auth_service_1 = require("./auth.service");
const auth_controller_1 = require("./auth.controller");
const token_service_1 = require("./token.service");
const users_service_1 = require("../users/users.service");
const config_1 = require("@nestjs/config");
const jwt_1 = require("@nestjs/jwt");
const passport_1 = require("@nestjs/passport");
const users_module_1 = require("../users/users.module");
const typeorm_1 = require("@nestjs/typeorm");
const UserAuth_1 = require("../../db/entities/UserAuth");
const local_strategy_1 = require("./strategies/local.strategy");
const jwt_strategy_1 = require("./strategies/jwt.strategy");
const google_strategy_1 = require("./strategies/google.strategy");
const Users_1 = require("../../db/entities/Users");
let AuthModule = class AuthModule {
};
exports.AuthModule = AuthModule;
exports.AuthModule = AuthModule = __decorate([
    (0, common_1.Module)({
        imports: [
            users_module_1.UsersModule,
            passport_1.PassportModule,
            jwt_1.JwtModule.registerAsync({
                imports: [config_1.ConfigModule],
                inject: [config_1.ConfigService],
                useFactory: async (configService) => ({
                    secret: configService.get("JWT_ACCESS_TOKEN_SECRET"),
                    signOptions: { expiresIn: "60m" },
                    verifyOptions: { ignoreExpiration: false },
                }),
            }),
            typeorm_1.TypeOrmModule.forFeature([Users_1.Users, UserAuth_1.UserAuth]),
        ],
        controllers: [auth_controller_1.AuthController],
        providers: [
            auth_service_1.AuthService,
            token_service_1.TokenService,
            users_service_1.UsersService,
            google_strategy_1.GoogleStrategy,
            local_strategy_1.LocalStrategy,
            jwt_strategy_1.JwtStrategy,
            token_service_1.TokenService,
            users_service_1.UsersService,
        ],
    })
], AuthModule);
//# sourceMappingURL=auth.module.js.map