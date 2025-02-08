import {
  Injectable,
  UnauthorizedException,
  NotFoundException,
  BadRequestException,
} from "@nestjs/common";
import * as bcrypt from "bcrypt";
import { UsersService } from "../users/users.service";
import { AUTH_METHOD } from "src/common/constants/auth-method.constant";
import { TokenService } from "./token.service";
import { AUTH_TOKENT_TYPE } from "src/common/constants/auth-token-type.constant";
import { TokenPayload } from "src/core/interfaces/tokenPayload.interface";
import { hash } from "src/common/utils/utils";

@Injectable()
export class AuthService {
  constructor(
    private usersService: UsersService,
    private tokenService: TokenService,
  ) {}

  async register(email: string, password: string, displayName: string) {
    const existingUser = await this.usersService.findByEmail(email);
    if (existingUser) {
      throw new BadRequestException("Email is already registered");
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = await this.usersService.createUserWithPassword(
      email,
      hashedPassword,
      displayName,
    );

    return {
      message: "User registered successfully",
      user: {
        id: newUser.userId,
        email,
        displayName,
      },
    };
  }

  async loginWithPassword(email: string, password: string) {
    const user = await this.usersService.findByEmail(email);
    if (
      !user ||
      !user.userAuths.some((auth) => auth.authMethod === AUTH_METHOD.PASSWORD)
    ) {
      throw new UnauthorizedException("Invalid credentials");
    }

    const passwordAuth = user.userAuths.find(
      (auth) => auth.authMethod === AUTH_METHOD.PASSWORD,
    );
    if (!(await bcrypt.compare(password, passwordAuth.passwordHash))) {
      throw new UnauthorizedException("Invalid credentials");
    }

    const accessToken = await this.tokenService.generateToken({
      providerUserId: user.userAuths[0]?.providerUserId,
      tokenType: AUTH_TOKENT_TYPE.ACCESS,
    } as TokenPayload);
    const refreshToken = await this.tokenService.generateToken({
      providerUserId: user.userAuths[0]?.providerUserId,
      tokenType: AUTH_TOKENT_TYPE.REFRESH,
    } as TokenPayload);
    return {
      accessToken,
      refreshToken,
    };
  }

  async refreshTokens(token: string) {
    try {
      const payload: any = this.tokenService.verifyToken(
        token,
        AUTH_TOKENT_TYPE.REFRESH,
      );
      const user = await this.usersService.findById(payload.userId);

      if (!user) throw new UnauthorizedException("Invalid refresh token");

      if (
        !user.userAuths.some((x) => x.active) &&
        user.userAuths[0]?.providerUserId
      )
        throw new UnauthorizedException("Invalid refresh token");
      const accessToken = await this.tokenService.generateToken({
        providerUserId: user.userAuths[0]?.providerUserId,
        tokenType: AUTH_TOKENT_TYPE.ACCESS,
      } as TokenPayload);
      const refreshToken = await this.tokenService.generateToken({
        providerUserId: user.userAuths[0]?.providerUserId,
        tokenType: AUTH_TOKENT_TYPE.REFRESH,
      } as TokenPayload);
      return {
        accessToken,
        refreshToken,
      };
    } catch {
      throw new UnauthorizedException("Invalid or expired refresh token");
    }
  }

  async sendResetPasswordLink(email: string) {
    const user = await this.usersService.findByEmail(email);
    if (!user) {
      throw new NotFoundException("User with this email does not exist");
    }
    if (
      !user.userAuths.some((x) => x.active) &&
      user.userAuths[0]?.providerUserId
    )
      throw new UnauthorizedException("Invalid refresh token");

    const token = this.tokenService.generateToken({
      providerUserId: email,
      tokenType: AUTH_TOKENT_TYPE.PASSWORD_RESET,
    } as TokenPayload);
    const resetLink = `${process.env.FRONTEND_URL}/reset-password?token=${token}`;
    await this.sendEmail(
      user.userAuths[0]?.providerUserId,
      "Reset Password",
      `Click here to reset your password: ${resetLink}`,
    );
  }

  async resetPassword(token: string, newPassword: string) {
    try {
      const payload: any = this.tokenService.verifyToken(
        token,
        AUTH_TOKENT_TYPE.PASSWORD_RESET,
      );
      const user = await this.usersService.findByEmail(payload.email);

      if (!user) {
        throw new NotFoundException("Invalid token or user does not exist");
      }

      const hashedPassword = await hash(newPassword);
      await this.usersService.updatePassword(user.userId, hashedPassword);
    } catch (error: any) {
      throw new BadRequestException("Invalid or expired token");
    }
  }

  async validateOAuthUser(
    name: string,
    providerUserId: string,
    authMethod: AUTH_METHOD,
  ) {
    let user = await this.usersService.findByAuth(providerUserId, authMethod);
    if (!user) {
      // Register new user if not found
      user = await this.usersService.createWithOAuth({
        name,
        email: providerUserId,
        authMethod,
      });
    }
    return user;
  }

  private async sendEmail(to: string, subject: string, body: string) {
    console.log(`Sending email to ${to}: ${subject} - ${body}`);
  }
}
