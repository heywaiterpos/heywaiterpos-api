import { Controller, Get, Query } from "@nestjs/common";
import { UsersService } from "./users.service";
import { ApiQuery, ApiTags } from "@nestjs/swagger";

@ApiTags("users")
@Controller("users")
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  @ApiQuery({ name: "email", required: false, type: String })
  findByEmail(@Query("email") email = "") {
    return this.usersService.findByEmail(email);
  }
}
