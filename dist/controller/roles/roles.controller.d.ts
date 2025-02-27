import { RolesService } from "./roles.service";
import { CreateRoleDto } from "./dto/create-role.dto";
import { UpdateRoleDto } from "./dto/update-role.dto";
export declare class RolesController {
    private readonly rolesService;
    constructor(rolesService: RolesService);
    create(createRoleDto: CreateRoleDto): string;
    findAll(): string;
    findOne(id: string): string;
    update(id: string, updateRoleDto: UpdateRoleDto): string;
    remove(id: string): string;
}
