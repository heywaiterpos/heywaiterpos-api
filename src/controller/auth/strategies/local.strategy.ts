import { PassportStrategy } from "@nestjs/passport";
import { Injectable, UnauthorizedException } from "@nestjs/common";
import { Strategy } from "passport-local";
import { AuthService } from "../auth.service";
@Injectable()
export class LocalStrategy extends PassportStrategy(Strategy) {
  constructor(private readonly authService: AuthService) {
    super();
  }
  async validate(userName, password) {
    // class is constructed but this method is never called
    const user: any = await this.authService.loginWithPassword(
      userName,
      password,
    );
    if (!user) {
      throw new UnauthorizedException();
    }
    return user;
  }
}
