import {
  Column,
  Entity,
  Index,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { UserAuth } from "./UserAuth";

@Index("User_pkey", ["userId"], { unique: true })
@Entity("Users", { schema: "dbo" })
export class Users {
  @PrimaryGeneratedColumn({ type: "bigint", name: "UserId" })
  userId: string;

  @Column("character varying", { name: "Name" })
  name: string;

  @Column("timestamp with time zone", {
    name: "CreatedAt",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @Column("timestamp with time zone", { name: "UpdatedAt", nullable: true })
  updatedAt: Date | null;

  @Column("boolean", { name: "Active", default: () => "true" })
  active: boolean;

  @Column("boolean", { name: "IsVerified", default: () => "false" })
  isVerified: boolean;

  @Column("bigint", { name: "AccessId", nullable: true })
  accessId: string | null;

  @OneToMany(() => UserAuth, (userAuth) => userAuth.user)
  userAuths: UserAuth[];
}
