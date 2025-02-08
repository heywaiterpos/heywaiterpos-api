import { UsersService } from "../users/users.service";
import { AUTH_METHOD } from "src/common/constants/auth-method.constant";
import { TokenService } from "./token.service";
export declare class AuthService {
    private usersService;
    private tokenService;
    constructor(usersService: UsersService, tokenService: TokenService);
    register(email: string, password: string, displayName: string): Promise<{
        message: string;
        user: {
            id: string;
            email: string;
            displayName: string;
        };
    }>;
    loginWithPassword(email: string, password: string): Promise<{
        accessToken: string;
        refreshToken: string;
    }>;
    refreshTokens(token: string): Promise<{
        accessToken: string;
        refreshToken: string;
    }>;
    sendResetPasswordLink(email: string): Promise<void>;
    resetPassword(token: string, newPassword: string): Promise<void>;
    validateOAuthUser(name: string, providerUserId: string, authMethod: AUTH_METHOD): Promise<import("../../db/entities/Users").Users>;
    private sendEmail;
}
