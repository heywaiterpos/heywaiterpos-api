import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { UserAuth } from "src/db/entities/UserAuth";
import { AUTH_METHOD } from "src/common/constants/auth-method.constant";
import { Users } from "src/db/entities/Users";

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(Users) private usersRepository: Repository<Users>,
    @InjectRepository(UserAuth)
    private userAuthRepository: Repository<UserAuth>,
  ) {}

  async findById(userId: string) {
    return this.usersRepository.findOne({ where: { userId } });
  }

  async findByEmail(email: string): Promise<Users> {
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

  async findByAuth(email: string, authMethod: AUTH_METHOD) {
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

  async createUserWithPassword(
    email: string,
    passwordHash: string,
    displayName: string,
  ): Promise<Users> {
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

  async createWithOAuth(data: {
    name: string;
    email: string;
    authMethod: AUTH_METHOD;
  }) {
    return this.usersRepository.manager.transaction(async (entityManager) => {
      let user = new Users();
      user.name = data.name;
      user = await entityManager.save(Users, user);

      let userAuth = new UserAuth();
      userAuth.user = user;
      userAuth.authMethod = data.authMethod;
      userAuth.providerUserId = data.email;
      userAuth.isVerified = true;
      userAuth.isVerified = true;
      userAuth = await entityManager.save(UserAuth, userAuth);
      await entityManager.find(Users, {
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

  async updatePassword(userId: string, hashedPassword: string) {
    return this.userAuthRepository.manager.transaction(
      async (entityManager) => {
        const userAuth = await entityManager.findOneBy(UserAuth, {
          user: {
            userId,
            active: true,
            isVerified: true,
          },
          active: true,
          isVerified: true,
          authMethod: AUTH_METHOD.PASSWORD
        });
        userAuth.passwordHash = hashedPassword;
        await entityManager.save(UserAuth, userAuth);
      },
    );
  }
}
