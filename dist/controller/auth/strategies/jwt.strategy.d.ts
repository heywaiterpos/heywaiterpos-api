import { JwtPayload } from "src/core/interfaces/payload.interface";
import { UsersService } from "src/controller/users/users.service";
import { ConfigService } from "@nestjs/config";
declare const JwtStrategy_base: new (...args: any) => any;
export declare class JwtStrategy extends JwtStrategy_base {
    private readonly usersService;
    private configService;
    constructor(usersService: UsersService, configService: ConfigService);
    validate(payload: JwtPayload): Promise<{
        userId: string;
    }>;
}
export {};
