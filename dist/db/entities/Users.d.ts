import { UserAuth } from "./UserAuth";
export declare class Users {
    userId: string;
    name: string;
    createdAt: Date;
    updatedAt: Date | null;
    active: boolean;
    isVerified: boolean;
    accessId: string | null;
    userAuths: UserAuth[];
}
