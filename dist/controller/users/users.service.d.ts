import { Repository } from "typeorm";
import { UserAuth } from "src/db/entities/UserAuth";
import { AUTH_METHOD } from "src/common/constants/auth-method.constant";
import { Users } from "src/db/entities/Users";
export declare class UsersService {
    private usersRepository;
    private userAuthRepository;
    constructor(usersRepository: Repository<Users>, userAuthRepository: Repository<UserAuth>);
    findById(userId: string): Promise<Users>;
    findByEmail(email: string): Promise<Users>;
    findByAuth(email: string, authMethod: AUTH_METHOD): Promise<Users>;
    createUserWithPassword(email: string, passwordHash: string, displayName: string): Promise<Users>;
    createWithOAuth(data: {
        name: string;
        email: string;
        authMethod: AUTH_METHOD;
    }): Promise<{
        userAuths: UserAuth[];
        userId: string;
        name: string;
        createdAt: Date;
        updatedAt: Date | null;
        active: boolean;
        isVerified: boolean;
        accessId: string | null;
    }>;
    updatePassword(userId: string, hashedPassword: string): Promise<void>;
}
