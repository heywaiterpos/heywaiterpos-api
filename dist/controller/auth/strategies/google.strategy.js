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
exports.GoogleStrategy = void 0;
const common_1 = require("@nestjs/common");
const passport_1 = require("@nestjs/passport");
const passport_google_oauth20_1 = require("passport-google-oauth20");
const auth_service_1 = require("../auth.service");
const auth_method_constant_1 = require("../../../common/constants/auth-method.constant");
const token_service_1 = require("../token.service");
const config_1 = require("@nestjs/config");
let GoogleStrategy = class GoogleStrategy extends (0, passport_1.PassportStrategy)(passport_google_oauth20_1.Strategy, "google") {
    constructor(authService, tokenService, configService) {
        console.log("google", {
            GOOGLE_CLIENT_ID: configService.get("GOOGLE_CLIENT_ID"),
            GOOGLE_CLIENT_SECRET: configService.get("GOOGLE_CLIENT_SECRET"),
            GOOGLE_CALLBACK_URL: configService.get("GOOGLE_CALLBACK_URL"),
        });
        super({
            clientID: configService.get("GOOGLE_CLIENT_ID"),
            clientSecret: configService.get("GOOGLE_CLIENT_SECRET"),
            callbackURL: configService.get("GOOGLE_CALLBACK_URL"),
            passReqToCallback: true,
            scope: ["profile", "email"],
        });
        this.authService = authService;
        this.tokenService = tokenService;
        this.configService = configService;
    }
    async validate(req, accessToken, refreshToken, profile, done) {
        if (profile) {
            const { emails } = profile;
            const email = emails[0].value;
            const user = await this.authService.validateOAuthUser(email, email, auth_method_constant_1.AUTH_METHOD.GOOGLE);
            return done(null, user);
        }
        else {
            return done(null, null);
        }
    }
};
exports.GoogleStrategy = GoogleStrategy;
exports.GoogleStrategy = GoogleStrategy = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [auth_service_1.AuthService,
        token_service_1.TokenService,
        config_1.ConfigService])
], GoogleStrategy);
//# sourceMappingURL=google.strategy.js.map