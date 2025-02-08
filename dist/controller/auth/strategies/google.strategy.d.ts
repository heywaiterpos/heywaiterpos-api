import { VerifyCallback } from "passport-google-oauth20";
import { AuthService } from "../auth.service";
import { TokenService } from "../token.service";
import { ConfigService } from "@nestjs/config";
declare const GoogleStrategy_base: new (...args: any) => any;
export declare class GoogleStrategy extends GoogleStrategy_base {
    private readonly authService;
    private readonly tokenService;
    private configService;
    constructor(authService: AuthService, tokenService: TokenService, configService: ConfigService);
    validate(req: any, accessToken: string, refreshToken: string, profile: any, done: VerifyCallback): Promise<any>;
}
export {};
