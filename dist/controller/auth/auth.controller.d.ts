import { AuthService } from "./auth.service";
import { LoginDto } from "./dto/login.dto";
import { ApiResponseModel } from "src/core/models/api-response.model";
import { RegisterDto } from "./dto/register.dto";
import { ConfigService } from "@nestjs/config";
export declare class AuthController {
    private readonly configService;
    private readonly authService;
    constructor(configService: ConfigService, authService: AuthService);
    googleAuth(): Promise<void>;
    googleAuthCallback(req: any, res: any): Promise<void>;
    login(dto: LoginDto): Promise<ApiResponseModel<any>>;
    register(dto: RegisterDto): Promise<ApiResponseModel<any>>;
    refreshToken(refreshToken: string): Promise<{
        accessToken: string;
        refreshToken: string;
    }>;
    logout(refreshToken: string): Promise<{
        message: string;
    }>;
}
