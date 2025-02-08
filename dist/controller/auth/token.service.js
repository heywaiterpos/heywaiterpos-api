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
Object.defineProperty(exports, "__esModule", { value: true });
exports.TokenService = void 0;
const common_1 = require("@nestjs/common");
const config_1 = require("@nestjs/config");
const jwt_1 = require("@nestjs/jwt");
const auth_token_type_constant_1 = require("../../common/constants/auth-token-type.constant");
let TokenService = class TokenService {
    constructor(jwtService, configService) {
        this.jwtService = jwtService;
        this.configService = configService;
    }
    async generateToken(payload) {
        let secret, expiresIn;
        if (payload.tokenType === auth_token_type_constant_1.AUTH_TOKENT_TYPE.REFRESH) {
            secret = this.configService.get("JWT_REFRESH_TOKEN_SECRET");
            expiresIn = this.configService.get("AUTH_REFRESH_TOKEN_EXPIRE");
        }
        else if (payload.tokenType === auth_token_type_constant_1.AUTH_TOKENT_TYPE.EMAIL_VERIFICATION) {
            secret = this.configService.get("JWT_VERIFICATION_TOKEN_SECRET");
            expiresIn = this.configService.get("AUTH_VERIFICATION_TOKEN_EXPIRE");
        }
        else {
            secret = this.configService.get("JWT_ACCESS_TOKEN_SECRET");
            expiresIn = this.configService.get("AUTH_ACCESS_TOKEN_EXPIRE");
        }
        return this.jwtService.sign(payload, {
            secret,
            expiresIn,
        });
    }
    async verifyToken(token, tokenType) {
        let secret;
        if (tokenType === auth_token_type_constant_1.AUTH_TOKENT_TYPE.REFRESH) {
            secret = this.configService.get("JWT_REFRESH_TOKEN_SECRET");
        }
        else if (tokenType === auth_token_type_constant_1.AUTH_TOKENT_TYPE.EMAIL_VERIFICATION) {
            secret = this.configService.get("JWT_VERIFICATION_TOKEN_SECRET");
        }
        else {
            secret = this.configService.get("JWT_ACCESS_TOKEN_SECRET");
        }
        return this.jwtService.verify(token, {
            secret,
        });
    }
};
exports.TokenService = TokenService;
exports.TokenService = TokenService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [jwt_1.JwtService,
        config_1.ConfigService])
], TokenService);
//# sourceMappingURL=token.service.js.map