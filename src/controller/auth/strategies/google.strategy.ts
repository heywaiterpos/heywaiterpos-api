// src/auth/strategies/google.strategy.ts
import { Injectable } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { Strategy, VerifyCallback } from "passport-google-oauth20";
import { AuthService } from "../auth.service";
import { AUTH_METHOD } from "src/common/constants/auth-method.constant";
import { TokenService } from "../token.service";
import { ConfigService } from "@nestjs/config";

@Injectable()
export class GoogleStrategy extends PassportStrategy(Strategy, "google") {
  constructor(
    private readonly authService: AuthService,
    private readonly tokenService: TokenService,
    private configService: ConfigService,
  ) {
    console.log("google", {
      GOOGLE_CLIENT_ID: configService.get<string>("GOOGLE_CLIENT_ID"),
      GOOGLE_CLIENT_SECRET: configService.get<string>("GOOGLE_CLIENT_SECRET"),
      GOOGLE_CALLBACK_URL: configService.get<string>("GOOGLE_CALLBACK_URL"),
    });
    super({
      clientID: configService.get<string>("GOOGLE_CLIENT_ID"),
      clientSecret: configService.get<string>("GOOGLE_CLIENT_SECRET"),
      callbackURL: configService.get<string>("GOOGLE_CALLBACK_URL"),
      passReqToCallback: true, // This allows us to pass the request object to the validate function
      scope: ["profile", "email"],
    });
  }

  async validate(
    req: any,
    accessToken: string,
    refreshToken: string,
    profile: any,
    done: VerifyCallback,
  ): Promise<any> {
    if (profile) {
      const { emails } = profile;
      const email = emails[0].value;
      const user = await this.authService.validateOAuthUser(
        email,
        email,
        AUTH_METHOD.GOOGLE,
      );
      return done(null, user);
    } else {
      return done(null, null);
    }
  }
}
