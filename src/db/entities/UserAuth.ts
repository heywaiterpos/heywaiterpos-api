import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Users } from "./Users";
import { UserAuthLog } from "./UserAuthLog";

@Index("UserAuth_pkey", ["userAuthId"], { unique: true })
@Entity("UserAuth", { schema: "dbo" })
export class UserAuth {
  @PrimaryGeneratedColumn({ type: "bigint", name: "UserAuthId" })
  userAuthId: string;

  @Column("character varying", { name: "AuthMethod" })
  authMethod: string;

  @Column("character varying", { name: "ProviderUserId", nullable: true })
  providerUserId: string | null;

  @Column("character varying", { name: "PasswordHash", nullable: true })
  passwordHash: string | null;

  @Column("boolean", { name: "IsVerified", default: () => "false" })
  isVerified: boolean;

  @Column("timestamp with time zone", {
    name: "CreatedAt",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @Column("timestamp with time zone", { name: "UpdatedAt", nullable: true })
  updatedAt: Date | null;

  @Column("boolean", { name: "Active", default: () => "true" })
  active: boolean;

  @ManyToOne(() => Users, (users) => users.userAuths)
  @JoinColumn([{ name: "UserId", referencedColumnName: "userId" }])
  user: Users;

  @OneToMany(() => UserAuthLog, (userAuthLog) => userAuthLog.userAuth)
  userAuthLogs: UserAuthLog[];
}
