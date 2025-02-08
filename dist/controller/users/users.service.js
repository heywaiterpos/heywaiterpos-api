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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UsersService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const UserAuth_1 = require("../../db/entities/UserAuth");
const auth_method_constant_1 = require("../../common/constants/auth-method.constant");
const Users_1 = require("../../db/entities/Users");
let UsersService = class UsersService {
    constructor(usersRepository, userAuthRepository) {
        this.usersRepository = usersRepository;
        this.userAuthRepository = userAuthRepository;
    }
    async findById(userId) {
        return this.usersRepository.findOne({ where: { userId } });
    }
    async findByEmail(email) {
        return this.usersRepository.findOne({
            where: {
                userAuths: {
                    providerUserId: email,
                },
            },
            relations: {
                userAuths: true
            },
        });
    }
    async findByAuth(email, authMethod) {
        return this.usersRepository.findOne({
            where: {
                userAuths: {
                    providerUserId: email,
                    authMethod,
                    active: true,
                    isVerified: true,
                },
                active: true,
                isVerified: true,
            },
            relations: {
                userAuths: true,
            },
        });
    }
    async createUserWithPassword(email, passwordHash, displayName) {
        const newUser = this.usersRepository.create({
            createdAt: new Date(),
            active: true,
            isVerified: false,
        });
        const savedUser = await this.usersRepository.save(newUser);
        const authMethod = this.userAuthRepository.create({
            user: savedUser,
            authMethod: "password",
            passwordHash,
            active: true,
        });
        await this.userAuthRepository.save(authMethod);
        return savedUser;
    }
    async createWithOAuth(data) {
        return this.usersRepository.manager.transaction(async (entityManager) => {
            let user = new Users_1.Users();
            user.name = data.name;
            user = await entityManager.save(Users_1.Users, user);
            let userAuth = new UserAuth_1.UserAuth();
            userAuth.user = user;
            userAuth.authMethod = data.authMethod;
            userAuth.providerUserId = data.email;
            userAuth.isVerified = true;
            userAuth.isVerified = true;
            userAuth = await entityManager.save(UserAuth_1.UserAuth, userAuth);
            await entityManager.find(Users_1.Users, {
                where: {
                    userId: user?.userId,
                },
            });
            return {
                ...user,
                userAuths: [userAuth],
            };
        });
    }
    async updatePassword(userId, hashedPassword) {
        return this.userAuthRepository.manager.transaction(async (entityManager) => {
            const userAuth = await entityManager.findOneBy(UserAuth_1.UserAuth, {
                user: {
                    userId,
                    active: true,
                    isVerified: true,
                },
                active: true,
                isVerified: true,
                authMethod: auth_method_constant_1.AUTH_METHOD.PASSWORD
            });
            userAuth.passwordHash = hashedPassword;
            await entityManager.save(UserAuth_1.UserAuth, userAuth);
        });
    }
};
exports.UsersService = UsersService;
exports.UsersService = UsersService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(Users_1.Users)),
    __param(1, (0, typeorm_1.InjectRepository)(UserAuth_1.UserAuth)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], UsersService);
//# sourceMappingURL=users.service.js.map