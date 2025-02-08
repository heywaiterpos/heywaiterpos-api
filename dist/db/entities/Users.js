"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Users = void 0;
const typeorm_1 = require("typeorm");
const UserAuth_1 = require("./UserAuth");
let Users = class Users {
};
exports.Users = Users;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)({ type: "bigint", name: "UserId" }),
    __metadata("design:type", String)
], Users.prototype, "userId", void 0);
__decorate([
    (0, typeorm_1.Column)("character varying", { name: "Name" }),
    __metadata("design:type", String)
], Users.prototype, "name", void 0);
__decorate([
    (0, typeorm_1.Column)("timestamp with time zone", {
        name: "CreatedAt",
        default: () => "CURRENT_TIMESTAMP",
    }),
    __metadata("design:type", Date)
], Users.prototype, "createdAt", void 0);
__decorate([
    (0, typeorm_1.Column)("timestamp with time zone", { name: "UpdatedAt", nullable: true }),
    __metadata("design:type", Date)
], Users.prototype, "updatedAt", void 0);
__decorate([
    (0, typeorm_1.Column)("boolean", { name: "Active", default: () => "true" }),
    __metadata("design:type", Boolean)
], Users.prototype, "active", void 0);
__decorate([
    (0, typeorm_1.Column)("boolean", { name: "IsVerified", default: () => "false" }),
    __metadata("design:type", Boolean)
], Users.prototype, "isVerified", void 0);
__decorate([
    (0, typeorm_1.Column)("bigint", { name: "AccessId", nullable: true }),
    __metadata("design:type", String)
], Users.prototype, "accessId", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => UserAuth_1.UserAuth, (userAuth) => userAuth.user),
    __metadata("design:type", Array)
], Users.prototype, "userAuths", void 0);
exports.Users = Users = __decorate([
    (0, typeorm_1.Index)("User_pkey", ["userId"], { unique: true }),
    (0, typeorm_1.Entity)("Users", { schema: "dbo" })
], Users);
//# sourceMappingURL=Users.js.map