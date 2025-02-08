import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { JwtService } from "@nestjs/jwt";
import { AUTH_TOKENT_TYPE } from "src/common/constants/auth-token-type.constant";
import { TokenPayload } from "src/core/interfaces/tokenPayload.interface";

@Injectable()
export class TokenService {
  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {}
  async generateToken(payload: TokenPayload) {
    let secret, expiresIn;
    if (payload.tokenType === AUTH_TOKENT_TYPE.REFRESH) {
      secret = this.configService.get<string>("JWT_REFRESH_TOKEN_SECRET");
      expiresIn = this.configService.get<string>("AUTH_REFRESH_TOKEN_EXPIRE");
    } else if (payload.tokenType === AUTH_TOKENT_TYPE.EMAIL_VERIFICATION) {
      secret = this.configService.get<string>("JWT_VERIFICATION_TOKEN_SECRET");
      expiresIn = this.configService.get<string>(
        "AUTH_VERIFICATION_TOKEN_EXPIRE",
      );
    } else {
      secret = this.configService.get<string>("JWT_ACCESS_TOKEN_SECRET");
      expiresIn = this.configService.get<string>("AUTH_ACCESS_TOKEN_EXPIRE");
    }
    return this.jwtService.sign(payload, {
      secret,
      expiresIn,
    });
    // return {
    //   accessToken: this.jwtService.sign(payload, {
    //     expiresIn: "15m",
    //     secret: this.configService.get<string>("JWT_ACCESS_TOKEN_SECRET"),
    //   }),
    //   refreshToken: this.jwtService.sign(payload, {
    //     expiresIn: "7d",
    //     secret: this.configService.get<string>("JWT_REFRESH_TOKEN_SECRET"),
    //   }),
    // };
  }

  async verifyToken(token: string, tokenType: AUTH_TOKENT_TYPE) {
    let secret;
    if (tokenType === AUTH_TOKENT_TYPE.REFRESH) {
      secret = this.configService.get<string>("JWT_REFRESH_TOKEN_SECRET");
    } else if (tokenType === AUTH_TOKENT_TYPE.EMAIL_VERIFICATION) {
      secret = this.configService.get<string>("JWT_VERIFICATION_TOKEN_SECRET");
    } else {
      secret = this.configService.get<string>("JWT_ACCESS_TOKEN_SECRET");
    }
    return this.jwtService.verify(token, {
      secret,
    });
  }
}
