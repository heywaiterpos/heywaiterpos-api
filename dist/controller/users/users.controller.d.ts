import { UsersService } from "./users.service";
export declare class UsersController {
    private readonly usersService;
    constructor(usersService: UsersService);
    findByEmail(email?: string): Promise<import("../../db/entities/Users").Users>;
}
