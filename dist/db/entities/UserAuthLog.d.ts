import { UserAuth } from "./UserAuth";
export declare class UserAuthLog {
    userAuthLogId: string;
    userAgent: string;
    ipAddress: string | null;
    sessionId: string;
    status: string;
    geolocation: string | null;
    accessToken: string;
    refreshToken: string;
    userAuth: UserAuth;
}
