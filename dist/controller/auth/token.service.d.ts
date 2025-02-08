import { ConfigService } from "@nestjs/config";
import { JwtService } from "@nestjs/jwt";
import { AUTH_TOKENT_TYPE } from "src/common/constants/auth-token-type.constant";
import { TokenPayload } from "src/core/interfaces/tokenPayload.interface";
export declare class TokenService {
    private readonly jwtService;
    private readonly configService;
    constructor(jwtService: JwtService, configService: ConfigService);
    generateToken(payload: TokenPayload): Promise<string>;
    verifyToken(token: string, tokenType: AUTH_TOKENT_TYPE): Promise<any>;
}
