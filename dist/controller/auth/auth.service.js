"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthService = void 0;
const common_1 = require("@nestjs/common");
const bcrypt = __importStar(require("bcrypt"));
const users_service_1 = require("../users/users.service");
const auth_method_constant_1 = require("../../common/constants/auth-method.constant");
const token_service_1 = require("./token.service");
const auth_token_type_constant_1 = require("../../common/constants/auth-token-type.constant");
const utils_1 = require("../../common/utils/utils");
let AuthService = class AuthService {
    constructor(usersService, tokenService) {
        this.usersService = usersService;
        this.tokenService = tokenService;
    }
    async register(email, password, displayName) {
        const existingUser = await this.usersService.findByEmail(email);
        if (existingUser) {
            throw new common_1.BadRequestException("Email is already registered");
        }
        const hashedPassword = await bcrypt.hash(password, 10);
        const newUser = await this.usersService.createUserWithPassword(email, hashedPassword, displayName);
        return {
            message: "User registered successfully",
            user: {
                id: newUser.userId,
                email,
                displayName,
            },
        };
    }
    async loginWithPassword(email, password) {
        const user = await this.usersService.findByEmail(email);
        if (!user ||
            !user.userAuths.some((auth) => auth.authMethod === auth_method_constant_1.AUTH_METHOD.PASSWORD)) {
            throw new common_1.UnauthorizedException("Invalid credentials");
        }
        const passwordAuth = user.userAuths.find((auth) => auth.authMethod === auth_method_constant_1.AUTH_METHOD.PASSWORD);
        if (!(await bcrypt.compare(password, passwordAuth.passwordHash))) {
            throw new common_1.UnauthorizedException("Invalid credentials");
        }
        const accessToken = await this.tokenService.generateToken({
            providerUserId: user.userAuths[0]?.providerUserId,
            tokenType: auth_token_type_constant_1.AUTH_TOKENT_TYPE.ACCESS,
        });
        const refreshToken = await this.tokenService.generateToken({
            providerUserId: user.userAuths[0]?.providerUserId,
            tokenType: auth_token_type_constant_1.AUTH_TOKENT_TYPE.REFRESH,
        });
        return {
            accessToken,
            refreshToken,
        };
    }
    async refreshTokens(token) {
        try {
            const payload = this.tokenService.verifyToken(token, auth_token_type_constant_1.AUTH_TOKENT_TYPE.REFRESH);
            const user = await this.usersService.findById(payload.userId);
            if (!user)
                throw new common_1.UnauthorizedException("Invalid refresh token");
            if (!user.userAuths.some((x) => x.active) &&
                user.userAuths[0]?.providerUserId)
                throw new common_1.UnauthorizedException("Invalid refresh token");
            const accessToken = await this.tokenService.generateToken({
                providerUserId: user.userAuths[0]?.providerUserId,
                tokenType: auth_token_type_constant_1.AUTH_TOKENT_TYPE.ACCESS,
            });
            const refreshToken = await this.tokenService.generateToken({
                providerUserId: user.userAuths[0]?.providerUserId,
                tokenType: auth_token_type_constant_1.AUTH_TOKENT_TYPE.REFRESH,
            });
            return {
                accessToken,
                refreshToken,
            };
        }
        catch {
            throw new common_1.UnauthorizedException("Invalid or expired refresh token");
        }
    }
    async sendResetPasswordLink(email) {
        const user = await this.usersService.findByEmail(email);
        if (!user) {
            throw new common_1.NotFoundException("User with this email does not exist");
        }
        if (!user.userAuths.some((x) => x.active) &&
            user.userAuths[0]?.providerUserId)
            throw new common_1.UnauthorizedException("Invalid refresh token");
        const token = this.tokenService.generateToken({
            providerUserId: email,
            tokenType: auth_token_type_constant_1.AUTH_TOKENT_TYPE.PASSWORD_RESET,
        });
        const resetLink = `${process.env.FRONTEND_URL}/reset-password?token=${token}`;
        await this.sendEmail(user.userAuths[0]?.providerUserId, "Reset Password", `Click here to reset your password: ${resetLink}`);
    }
    async resetPassword(token, newPassword) {
        try {
            const payload = this.tokenService.verifyToken(token, auth_token_type_constant_1.AUTH_TOKENT_TYPE.PASSWORD_RESET);
            const user = await this.usersService.findByEmail(payload.email);
            if (!user) {
                throw new common_1.NotFoundException("Invalid token or user does not exist");
            }
            const hashedPassword = await (0, utils_1.hash)(newPassword);
            await this.usersService.updatePassword(user.userId, hashedPassword);
        }
        catch (error) {
            throw new common_1.BadRequestException("Invalid or expired token");
        }
    }
    async validateOAuthUser(name, providerUserId, authMethod) {
        let user = await this.usersService.findByAuth(providerUserId, authMethod);
        if (!user) {
            user = await this.usersService.createWithOAuth({
                name,
                email: providerUserId,
                authMethod,
            });
        }
        return user;
    }
    async sendEmail(to, subject, body) {
        console.log(`Sending email to ${to}: ${subject} - ${body}`);
    }
};
exports.AuthService = AuthService;
exports.AuthService = AuthService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [users_service_1.UsersService,
        token_service_1.TokenService])
], AuthService);
//# sourceMappingURL=auth.service.js.map