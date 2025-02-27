PGDMP              	        }            heywaiterposdb    16.3    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    98076    heywaiterposdb    DATABASE     �   CREATE DATABASE heywaiterposdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE heywaiterposdb;
                postgres    false                        2615    98866    dbo    SCHEMA        CREATE SCHEMA dbo;
    DROP SCHEMA dbo;
                postgres    false            �            1255    98917    usp_reset() 	   PROCEDURE     �  CREATE PROCEDURE dbo.usp_reset()
    LANGUAGE plpgsql
    AS $_$

begin
	DELETE FROM dbo."UserAuthLog";
	DELETE FROM dbo."UserAuth";
	DELETE FROM dbo."Access";
	DELETE FROM dbo."Users";
	
	ALTER SEQUENCE dbo."Access_AccessId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."UserAuthLog_UserAuthLogId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."UserAuth_UserAuthId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."Users_UserId_seq" RESTART WITH 1;
	
	INSERT INTO dbo."Users" (
		"Name",
		"IsVerified")
	VALUES (
			'admin',
			true
	);

	INSERT INTO dbo."UserAuth" (
		"UserId",
		"AuthMethod",
		"ProviderUserId",
		"PasswordHash",
		"IsVerified")
	VALUES (
			1,
			'PASSWORD',
			'admin',
			'$2b$10$LqN3kzfgaYnP5PfDZFfT4edUFqh5Lu7amIxeDDDmu/KEqQFze.p8a',  
			true
	);
END;
$_$;
     DROP PROCEDURE dbo.usp_reset();
       dbo          postgres    false    6            �            1259    98879    Access    TABLE     �   CREATE TABLE dbo."Access" (
    "AccessId" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "AccessPages" jsonb DEFAULT '[]'::json NOT NULL,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."Access";
       dbo         heap    postgres    false    6            �            1259    98878    Access_AccessId_seq    SEQUENCE     �   ALTER TABLE dbo."Access" ALTER COLUMN "AccessId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Access_AccessId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    218    6            �            1259    98889    UserAuth    TABLE     �  CREATE TABLE dbo."UserAuth" (
    "UserAuthId" bigint NOT NULL,
    "UserId" bigint NOT NULL,
    "AuthMethod" character varying NOT NULL,
    "ProviderUserId" character varying,
    "PasswordHash" character varying,
    "IsVerified" boolean DEFAULT false NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."UserAuth";
       dbo         heap    postgres    false    6            �            1259    98905    UserAuthLog    TABLE     �  CREATE TABLE dbo."UserAuthLog" (
    "UserAuthLogId" bigint NOT NULL,
    "UserAuthId" bigint NOT NULL,
    "UserAgent" character varying NOT NULL,
    "IpAddress" character varying,
    "SessionId" character varying NOT NULL,
    "Status" character varying NOT NULL,
    "Geolocation" character varying,
    "AccessToken" character varying NOT NULL,
    "RefreshToken" character varying NOT NULL
);
    DROP TABLE dbo."UserAuthLog";
       dbo         heap    postgres    false    6            �            1259    98904    UserAuthLog_UserAuthLogId_seq    SEQUENCE     �   ALTER TABLE dbo."UserAuthLog" ALTER COLUMN "UserAuthLogId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."UserAuthLog_UserAuthLogId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    222    6            �            1259    98888    UserAuth_UserAuthId_seq    SEQUENCE     �   ALTER TABLE dbo."UserAuth" ALTER COLUMN "UserAuthId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."UserAuth_UserAuthId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    220    6            �            1259    98868    Users    TABLE     M  CREATE TABLE dbo."Users" (
    "UserId" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL,
    "IsVerified" boolean DEFAULT false NOT NULL,
    "AccessId" bigint
);
    DROP TABLE dbo."Users";
       dbo         heap    postgres    false    6            �            1259    98918    Users_UserId_seq    SEQUENCE     �   ALTER TABLE dbo."Users" ALTER COLUMN "UserId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Users_UserId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    216                      0    98879    Access 
   TABLE DATA           L   COPY dbo."Access" ("AccessId", "Name", "AccessPages", "Active") FROM stdin;
    dbo          postgres    false    218   �$                 0    98889    UserAuth 
   TABLE DATA           �   COPY dbo."UserAuth" ("UserAuthId", "UserId", "AuthMethod", "ProviderUserId", "PasswordHash", "IsVerified", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    220   �$                 0    98905    UserAuthLog 
   TABLE DATA           �   COPY dbo."UserAuthLog" ("UserAuthLogId", "UserAuthId", "UserAgent", "IpAddress", "SessionId", "Status", "Geolocation", "AccessToken", "RefreshToken") FROM stdin;
    dbo          postgres    false    222   �%                 0    98868    Users 
   TABLE DATA           n   COPY dbo."Users" ("UserId", "Name", "CreatedAt", "UpdatedAt", "Active", "IsVerified", "AccessId") FROM stdin;
    dbo          postgres    false    216   �%                  0    0    Access_AccessId_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('dbo."Access_AccessId_seq"', 1, false);
          dbo          postgres    false    217                       0    0    UserAuthLog_UserAuthLogId_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('dbo."UserAuthLog_UserAuthLogId_seq"', 1, false);
          dbo          postgres    false    221                       0    0    UserAuth_UserAuthId_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('dbo."UserAuth_UserAuthId_seq"', 5, true);
          dbo          postgres    false    219                       0    0    Users_UserId_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('dbo."Users_UserId_seq"', 5, true);
          dbo          postgres    false    223            l           2606    98887    Access Access_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY dbo."Access"
    ADD CONSTRAINT "Access_pkey" PRIMARY KEY ("AccessId");
 =   ALTER TABLE ONLY dbo."Access" DROP CONSTRAINT "Access_pkey";
       dbo            postgres    false    218            p           2606    98911    UserAuthLog UserAuthLog_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dbo."UserAuthLog"
    ADD CONSTRAINT "UserAuthLog_pkey" PRIMARY KEY ("UserAuthLogId");
 G   ALTER TABLE ONLY dbo."UserAuthLog" DROP CONSTRAINT "UserAuthLog_pkey";
       dbo            postgres    false    222            n           2606    98898    UserAuth UserAuth_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY dbo."UserAuth"
    ADD CONSTRAINT "UserAuth_pkey" PRIMARY KEY ("UserAuthId");
 A   ALTER TABLE ONLY dbo."UserAuth" DROP CONSTRAINT "UserAuth_pkey";
       dbo            postgres    false    220            j           2606    98877    Users User_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY dbo."Users"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("UserId");
 :   ALTER TABLE ONLY dbo."Users" DROP CONSTRAINT "User_pkey";
       dbo            postgres    false    216            r           2606    98912 #   UserAuthLog fk_UserAuthLog_UserAuth    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."UserAuthLog"
    ADD CONSTRAINT "fk_UserAuthLog_UserAuth" FOREIGN KEY ("UserAuthId") REFERENCES dbo."UserAuth"("UserAuthId");
 N   ALTER TABLE ONLY dbo."UserAuthLog" DROP CONSTRAINT "fk_UserAuthLog_UserAuth";
       dbo          postgres    false    222    220    4718            q           2606    98899    UserAuth fk_UserAuthUser_User    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."UserAuth"
    ADD CONSTRAINT "fk_UserAuthUser_User" FOREIGN KEY ("UserId") REFERENCES dbo."Users"("UserId");
 H   ALTER TABLE ONLY dbo."UserAuth" DROP CONSTRAINT "fk_UserAuthUser_User";
       dbo          postgres    false    216    220    4714                  x������ � �         �   x���AO�0 ���W��ͬ��GK�I�b$�9���R]�D�B�h��&6�ܿ|$�כ�cu��ۅ���^b�qٯ�}l�U���Es���Cѿ��p���<���E�.F/�����#��̈�B�(�&F�@�"�eU-�������Dx������O��l�l)��"#IJ�2��iK��
Sy�H�e�R&8a�/S��e��,tj2��l+�(��o�            x������ � �         �   x���A
�0�ur����O'Mf�	z�n�V	�"�^�(vU��7k�:0�e���)�0i�0v��8���8x�yy��2ղ�O���:�n�w��Йe�~����G4����:��G2d�N����G� ��%�#y�_�nQ�     