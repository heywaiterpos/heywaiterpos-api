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
exports.UserAuthLog = void 0;
const typeorm_1 = require("typeorm");
const UserAuth_1 = require("./UserAuth");
let UserAuthLog = class UserAuthLog {
};
exports.UserAuthLog = UserAuthLog;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)({ type: "bigint", name: "UserAuthLogId" }),
    __metadata("design:type", String)
], UserAuthLog.prototype, "userAuthLogId", void 0);
__decorate([
    (0, typeorm_1.Column)("character varying", { name: "UserAgent" }),
    __metadata("design:type", String)
], UserAuthLog.prototype, "userAgent", void 0);
__decorate([
    (0, typeorm_1.Column)("character varying", { name: "IpAddress", nullable: true }),
    __metadata("design:type", String)
], UserAuthLog.prototype, "ipAddress", void 0);
__decorate([
    (0, typeorm_1.Column)("character varying", { name: "SessionId" }),
    __metadata("design:type", String)
], UserAuthLog.prototype, "sessionId", void 0);
__decorate([
    (0, typeorm_1.Column)("character varying", { name: "Status" }),
    __metadata("design:type", String)
], UserAuthLog.prototype, "status", void 0);
__decorate([
    (0, typeorm_1.Column)("character varying", { name: "Geolocation", nullable: true }),
    __metadata("design:type", String)
], UserAuthLog.prototype, "geolocation", void 0);
__decorate([
    (0, typeorm_1.Column)("character varying", { name: "AccessToken" }),
    __metadata("design:type", String)
], UserAuthLog.prototype, "accessToken", void 0);
__decorate([
    (0, typeorm_1.Column)("character varying", { name: "RefreshToken" }),
    __metadata("design:type", String)
], UserAuthLog.prototype, "refreshToken", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => UserAuth_1.UserAuth, (userAuth) => userAuth.userAuthLogs),
    (0, typeorm_1.JoinColumn)([{ name: "UserAuthId", referencedColumnName: "userAuthId" }]),
    __metadata("design:type", UserAuth_1.UserAuth)
], UserAuthLog.prototype, "userAuth", void 0);
exports.UserAuthLog = UserAuthLog = __decorate([
    (0, typeorm_1.Index)("UserAuthLog_pkey", ["userAuthLogId"], { unique: true }),
    (0, typeorm_1.Entity)("UserAuthLog", { schema: "dbo" })
], UserAuthLog);
//# sourceMappingURL=UserAuthLog.js.map