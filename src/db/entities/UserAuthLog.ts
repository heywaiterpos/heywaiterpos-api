import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { UserAuth } from "./UserAuth";

@Index("UserAuthLog_pkey", ["userAuthLogId"], { unique: true })
@Entity("UserAuthLog", { schema: "dbo" })
export class UserAuthLog {
  @PrimaryGeneratedColumn({ type: "bigint", name: "UserAuthLogId" })
  userAuthLogId: string;

  @Column("character varying", { name: "UserAgent" })
  userAgent: string;

  @Column("character varying", { name: "IpAddress", nullable: true })
  ipAddress: string | null;

  @Column("character varying", { name: "SessionId" })
  sessionId: string;

  @Column("character varying", { name: "Status" })
  status: string;

  @Column("character varying", { name: "Geolocation", nullable: true })
  geolocation: string | null;

  @Column("character varying", { name: "AccessToken" })
  accessToken: string;

  @Column("character varying", { name: "RefreshToken" })
  refreshToken: string;

  @ManyToOne(() => UserAuth, (userAuth) => userAuth.userAuthLogs)
  @JoinColumn([{ name: "UserAuthId", referencedColumnName: "userAuthId" }])
  userAuth: UserAuth;
}
