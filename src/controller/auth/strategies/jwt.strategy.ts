import { ExtractJwt, Strategy } from "passport-jwt";
import { PassportStrategy } from "@nestjs/passport";
import { Injectable, UnauthorizedException } from "@nestjs/common";
import * as fs from "fs";
import * as path from "path";
import { JwtPayload } from "src/core/interfaces/payload.interface";
import { UsersService } from "src/controller/users/users.service";
import { ConfigService } from "@nestjs/config";

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy, "jwt") {
  constructor(
    private readonly usersService: UsersService,
    private configService: ConfigService,
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: configService.get<string>("AUTH_ACCESS_TOKEN_EXPIRE"),
    });
  }
  async validate(payload: JwtPayload) {
    const { userId } = payload;
    const user = await this.usersService.findById(userId);

    if (!user) {
      throw new UnauthorizedException();
    }
    return { userId: user.userId };
  }
}
