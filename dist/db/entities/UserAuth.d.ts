import { Users } from "./Users";
import { UserAuthLog } from "./UserAuthLog";
export declare class UserAuth {
    userAuthId: string;
    authMethod: string;
    providerUserId: string | null;
    passwordHash: string | null;
    isVerified: boolean;
    createdAt: Date;
    updatedAt: Date | null;
    active: boolean;
    user: Users;
    userAuthLogs: UserAuthLog[];
}
