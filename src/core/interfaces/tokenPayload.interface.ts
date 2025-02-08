import { AUTH_TOKENT_TYPE } from "src/common/constants/auth-token-type.constant";

export interface TokenPayload {
  userId: string;
  providerUserId?: string;
  role?: string;
  tokenType: AUTH_TOKENT_TYPE;
}
