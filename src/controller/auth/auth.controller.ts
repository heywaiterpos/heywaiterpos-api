// src/auth/auth.controller.ts
import {
  Controller,
  Get,
  Req,
  UseGuards,
  Post,
  Body,
  HttpCode,
  Res,
} from "@nestjs/common";
import { AuthGuard } from "@nestjs/passport";
import { AuthService } from "./auth.service";
import { ApiTags } from "@nestjs/swagger";
import { LoginDto } from "./dto/login.dto";
import { ApiResponseModel } from "src/core/models/api-response.model";
import { RegisterDto } from "./dto/register.dto";
import { ConfigService } from "@nestjs/config";

@ApiTags("auth")
@Controller("auth")
export class AuthController {
  constructor(
    private readonly configService: ConfigService,
    private readonly authService: AuthService,
  ) {}

  @Get("google")
  @UseGuards(AuthGuard("google"))
  async googleAuth() {}

  @Get("google/callback")
  @UseGuards(AuthGuard("google"))
  async googleAuthCallback(@Req() req, @Res() res) {
    res.location(
      `${this.configService.get<string>("AUTH_CLIENT_ERROR_CALL_BACK")}`,
    );
    res.redirect(
      `${this.configService.get<string>("AUTH_CLIENT_ERROR_CALL_BACK")}`,
    );
  }

  @Post("login")
  public async login(@Body() dto: LoginDto) {
    const res: ApiResponseModel<any> = {} as ApiResponseModel<any>;
    try {
      res.data = await this.authService.loginWithPassword(
        dto.email,
        dto.password,
      );
      res.success = true;
      return res;
    } catch (e) {
      res.success = false;
      res.message = e.message !== undefined ? e.message : e;
      return res;
    }
  }

  @Post("register")
  public async register(@Body() dto: RegisterDto) {
    const res: ApiResponseModel<any> = {} as ApiResponseModel<any>;
    try {
      const { email, password, name } = dto;
      res.data = await this.authService.register(email, password, name);
      res.success = true;
      return res;
    } catch (e) {
      res.success = false;
      res.message = e.message !== undefined ? e.message : e;
      return res;
    }
  }

  @Post("refresh")
  @HttpCode(200)
  async refreshToken(@Body("refreshToken") refreshToken: string) {
    return await this.authService.refreshTokens(refreshToken);
  }

  @Post("logout")
  @HttpCode(200)
  async logout(@Body("refreshToken") refreshToken: string) {
    // await this.authService.revokeRefreshToken(refreshToken);
    return { message: "Logged out successfully" };
  }
}
