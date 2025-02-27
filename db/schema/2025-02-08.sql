PGDMP  &    *    	            }            angelspizzadb    16.3    16.3 �    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    25831    angelspizzadb    DATABASE     �   CREATE DATABASE angelspizzadb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE angelspizzadb;
                postgres    false                        2615    54004    dbo    SCHEMA        CREATE SCHEMA dbo;
    DROP SCHEMA dbo;
                postgres    false            �           1247    54192    auth_event_type_enum    TYPE     �  CREATE TYPE dbo.auth_event_type_enum AS ENUM (
    'LOGIN',
    'LOGOUT',
    'PASSWORD_RESET',
    'EMAIL_VERIFICATION',
    'EMAIL_CHANGE',
    'EMAIL_UPDATE_VERIFICATION',
    'PHONE_VERIFICATION',
    'ACCOUNT_ACTIVATION',
    'ACCOUNT_DEACTIVATION',
    'ACCOUNT_REACTIVATION',
    'LOGIN_CONFIRMATION',
    'ACCOUNT_DELETION',
    'SOCIAL_LOGIN_LINK',
    'DEVICE_VERIFICATION'
);
 $   DROP TYPE dbo.auth_event_type_enum;
       dbo          postgres    false    6            �           1247    54585    auth_method_enum    TYPE     �  CREATE TYPE dbo.auth_method_enum AS ENUM (
    'PASSWORD',
    'PIN',
    'PASSWORDLESS',
    'OTP',
    'GOOGLE',
    'FACEBOOK',
    'APPLE',
    'GITHUB',
    'LINKEDIN',
    'SSO',
    'SAML',
    'OAUTH2',
    'OPENID_CONNECT',
    'AZURE_AD',
    'OKTA',
    'FINGERPRINT',
    'FACE_RECOGNITION',
    'VOICE_RECOGNITION',
    '2FA_SMS',
    '2FA_EMAIL',
    '2FA_AUTH_APP',
    '2FA_HARDWARE_TOKEN',
    'MAGIC_LINK',
    'TOKEN',
    'QR_CODE',
    'GUEST'
);
     DROP TYPE dbo.auth_method_enum;
       dbo          postgres    false    6            �           1247    54144    auth_status_enum    TYPE     �   CREATE TYPE dbo.auth_status_enum AS ENUM (
    'SUCCESS',
    'FAILED',
    'LOCKED',
    'ACTIONS',
    'PENDING',
    'EXPIRED',
    'TIMED_OUT',
    'REVOKED',
    'MFA_REQUIRED'
);
     DROP TYPE dbo.auth_status_enum;
       dbo          postgres    false    6            �           1247    55546    auth_token_status_enum    TYPE     }  CREATE TYPE dbo.auth_token_status_enum AS ENUM (
    'ACTIVE',
    'USED',
    'EXPIRED',
    'REVOKED',
    'INVALID',
    'PENDING',
    'FAILED',
    'LOCKED',
    'INACTIVE',
    'BLACKLISTED',
    'VERIFIED',
    'UNVERIFIED',
    'REISSUED',
    'CONSUMED',
    'SUPERSEDED',
    'INVALIDATED',
    'PENDING_VERIFICATION',
    'ERROR',
    'AWAITING_ACTION',
    'DENIED'
);
 &   DROP TYPE dbo.auth_token_status_enum;
       dbo          postgres    false    6            �           1247    55492    auth_token_type_enum    TYPE     a  CREATE TYPE dbo.auth_token_type_enum AS ENUM (
    'ACCESS',
    'REFRESH',
    'EMAIL_VERIFICATION',
    'PASSWORD_RESET',
    'MFA',
    'DEVICE_VERIFICATION',
    'API_KEY',
    'INVITE',
    'ACCOUNT_ACTIVATION',
    'SESSION',
    'REVOKE_ACCESS',
    'ONE_TIME_USE',
    'CONSENT_VERIFICATION',
    'TWO_FACTOR_AUTHENTICATION',
    'API_ACCESS',
    'SECURE_OPERATION',
    'EMAIL_UPDATE',
    'SOCIAL_LOGIN',
    'REGISTRATION',
    'ACCOUNT_DELETION',
    'AUTHORIZATION_CODE',
    'PERSONAL_ACCESS_TOKEN',
    'SESSION_REFRESH',
    'NOTIFICATION_SUBSCRIPTION',
    'SERVICE_AUTH',
    'RECOVERY'
);
 $   DROP TYPE dbo.auth_token_type_enum;
       dbo          postgres    false    6            {           1247    54126    brand_type_enum    TYPE     U   CREATE TYPE dbo.brand_type_enum AS ENUM (
    'ANGELS_PIZZA',
    'FIGARO_COFFEE'
);
    DROP TYPE dbo.brand_type_enum;
       dbo          postgres    false    6            x           1247    54119    corporate_type_enum    TYPE     ]   CREATE TYPE dbo.corporate_type_enum AS ENUM (
    'BRANCH',
    'RIDER',
    'OPERATIONS'
);
 #   DROP TYPE dbo.corporate_type_enum;
       dbo          postgres    false    6            �           1247    54966    disposition    TYPE     F   CREATE TYPE dbo.disposition AS ENUM (
    'DELIVER',
    'PICK_UP'
);
    DROP TYPE dbo.disposition;
       dbo          postgres    false    6            �           1247    54972    disposition_type    TYPE     E   CREATE TYPE dbo.disposition_type AS ENUM (
    'NOW',
    'LATER'
);
     DROP TYPE dbo.disposition_type;
       dbo          postgres    false    6            �           1247    54164    mfa_method_enum    TYPE     �   CREATE TYPE dbo.mfa_method_enum AS ENUM (
    'SMS',
    'EMAIL',
    'AUTH_APP',
    'HARDWARE_TOKEN',
    'PUSH_NOTIFICATION',
    'BIOMETRICS'
);
    DROP TYPE dbo.mfa_method_enum;
       dbo          postgres    false    6            �           1247    54178    mfa_status_enum    TYPE     �   CREATE TYPE dbo.mfa_status_enum AS ENUM (
    'SUCCESS',
    'FAILED',
    'SKIPPED',
    'TIMED_OUT',
    'PENDING',
    'NOT_REQUIRED'
);
    DROP TYPE dbo.mfa_status_enum;
       dbo          postgres    false    6            �           1247    54933    order_status_enum    TYPE     V  CREATE TYPE dbo.order_status_enum AS ENUM (
    'ORDER_PLACED',
    'ORDER_ACCEPTED',
    'PREPARING_FOOD',
    'ORDER_READY_FOR_PICKUP',
    'DRIVER_ASSIGNED',
    'DRIVER_AT_RESTAURANT',
    'ORDER_PICKED_UP',
    'ON_THE_WAY',
    'ARRIVED_AT_DELIVERY_LOCATION',
    'ORDER_DELIVERED',
    'ORDER_CANCELED',
    'RE_DELIVERY_REQUESTED'
);
 !   DROP TYPE dbo.order_status_enum;
       dbo          postgres    false    6            �           1247    54741    user_role_enum    TYPE     h   CREATE TYPE dbo.user_role_enum AS ENUM (
    'CUSTOMER',
    'CORPORATE',
    'BRANCH',
    'DRIVER'
);
    DROP TYPE dbo.user_role_enum;
       dbo          postgres    false    6            ~           1247    54138    user_status_enum    TYPE     L   CREATE TYPE dbo.user_status_enum AS ENUM (
    'ENABLED',
    'DISABLED'
);
     DROP TYPE dbo.user_status_enum;
       dbo          postgres    false    6                       1255    55274    usp_reset() 	   PROCEDURE     M  CREATE PROCEDURE dbo.usp_reset()
    LANGUAGE plpgsql
    AS $_$

begin
	DELETE FROM dbo."Access";
	DELETE FROM dbo."CorporateUser";
	DELETE FROM dbo."CustomerUser";
	DELETE FROM dbo."UserAuthLog";
	DELETE FROM dbo."UserAuthTokenLog";
	DELETE FROM dbo."UserAuth";
	DELETE FROM dbo."User";
	DELETE FROM dbo."Branch";
	
	ALTER SEQUENCE dbo."Access_AccessId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."CorporateUser_CorporateUserId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."CustomerUser_CustomerUserId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."UserAuthLog_UserAuthLogId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."UserAuthTokenLog_UserAuthTokenLogId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."UserAuth_UserAuthId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."User_UserId_seq" RESTART WITH 1;
	ALTER SEQUENCE dbo."Branch_BranchId_seq" RESTART WITH 1;
	
	INSERT INTO dbo."Access" (
		"Name", 
		"Active",
		"AccessPages"
	)
	VALUES (
			'Admin',
			true,
			'[
      {
        "page": "Dashboard",
        "view": true,
        "modify": true,
        "rights": []
      },
      {
        "page": "Orders",
        "view": true,
        "modify": true,
        "rights": ["Status"]
      },
      {
        "page": "Transactions",
        "view": true,
        "modify": true,
        "rights": []
      },
      {
        "page": "Category",
        "view": true,
        "modify": true,
        "rights": []
      },
      {
        "page": "Products",
        "view": true,
        "modify": true,
        "rights": []
      },
      {
        "page": "Corporate Users",
        "view": true,
        "modify": true,
        "rights": []
      },
      {
        "page": "Branch Users",
        "view": true,
        "modify": true,
        "rights": []
      },
      {
        "page": "Driver Users",
        "view": true,
        "modify": true,
        "rights": []
      },
      {
        "page": "Access",
        "view": true,
        "modify": true,
        "rights": []
      }
    ]');

	INSERT INTO dbo."User" (
		"Role", 
		"Brand",
		"AccessId",
		"IsVerified")
	VALUES (
			'CORPORATE',
			'ANGELS_PIZZA',
			1,
			true);

	INSERT INTO dbo."UserAuth" (
		"UserId",
		"AuthMethod",
		"ProviderUserId",
		"PasswordHash",
		"IsVerified")
	VALUES (
        1,
			'PASSWORD',
			'admin@admin.com',
			'$2b$10$LqN3kzfgaYnP5PfDZFfT4edUFqh5Lu7amIxeDDDmu/KEqQFze.p8a',
			true
	);

	INSERT INTO dbo."UserAuthLog" (
		"UserAuthId",
		"UserAgent",
		"EventType",
		"AuthMethod",
		"SessionId",
		"Status",
		"Brand",
		"AccessToken",
		"RefreshToken")
	VALUES (
        1,
		'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
		'LOGIN',
		'PASSWORD',
		'1',
		'SUCCESS',
		'ANGELS_PIZZA',
		'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJicmFuZCI6IkFOR0VMU19QSVpaQSIsInVzZXJJZCI6IjIiLCJhdXRoTWV0aG9kIjoiUEFTU1dPUkQiLCJwcm92aWRlclVzZXJJZCI6ImVyd2lucmFtaXJlejIyMEBnbWFpbC5jb20iLCJyb2xlIjoiQ1VTVE9NRVIiLCJ0b2tlblR5cGUiOiJFTUFJTF9WRVJJRklDQVRJT04iLCJpYXQiOjE3MjkxMTU2MjEsImV4cCI6MTcyOTEzMDAyMX0.7biMy0Ap4nYDrYQ9vUE8m0gHHKClCd2t0EdoEOn9zP8',
		'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJicmFuZCI6IkFOR0VMU19QSVpaQSIsInVzZXJJZCI6IjIiLCJhdXRoTWV0aG9kIjoiUEFTU1dPUkQiLCJwcm92aWRlclVzZXJJZCI6ImVyd2lucmFtaXJlejIyMEBnbWFpbC5jb20iLCJyb2xlIjoiQ1VTVE9NRVIiLCJ0b2tlblR5cGUiOiJFTUFJTF9WRVJJRklDQVRJT04iLCJpYXQiOjE3MjkxMTU2MjEsImV4cCI6MTcyOTEzMDAyMX0.7biMy0Ap4nYDrYQ9vUE8m0gHHKClCd2t0EdoEOn9zP8'
	);
	INSERT INTO dbo."CorporateUser" (
		"UserId",
		"Brand",
		"Name",
		"Email",
		"MobileNumber",
		"AccessGranted")
	VALUES (
            1,
			'ANGELS_PIZZA',
			'Admin',
			'admin@admin.com',
			'123456',
			true);
END;
$_$;
     DROP PROCEDURE dbo.usp_reset();
       dbo          postgres    false    6                       1259    58719    Access    TABLE     �   CREATE TABLE dbo."Access" (
    "AccessId" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "AccessPages" jsonb DEFAULT '[]'::json NOT NULL,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."Access";
       dbo         heap    postgres    false    6                       1259    58718    Access_AccessId_seq    SEQUENCE     �   ALTER TABLE dbo."Access" ALTER COLUMN "AccessId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Access_AccessId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    259    6            �            1259    55121    Branch    TABLE     �  CREATE TABLE dbo."Branch" (
    "BranchId" bigint NOT NULL,
    "BranchCode" character varying,
    "Brand" dbo.brand_type_enum,
    "Name" character varying,
    "Description" character varying,
    "Address" character varying,
    "Province" character varying,
    "City" character varying,
    "Country" character varying,
    "Phone" character varying,
    "LocationCoordinates" character varying,
    "Disposition" character varying,
    "PaymentMethodIds" character varying[] DEFAULT '{}'::character varying[],
    "MinOrderValue" numeric DEFAULT 0 NOT NULL,
    "MaxOrderValue" numeric DEFAULT 0 NOT NULL,
    "OpensAt" time with time zone,
    "ClosesAt" time with time zone,
    "ClosedFrom" timestamp with time zone,
    "ClosedUntil" timestamp with time zone,
    "IsOperational" boolean,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."Branch";
       dbo         heap    postgres    false    6    891            �            1259    54823    BranchDaysAvailability    TABLE     P  CREATE TABLE dbo."BranchDaysAvailability" (
    "BranchId" bigint NOT NULL,
    "ProductId" bigint NOT NULL,
    "Friday" boolean NOT NULL,
    "Monday" boolean NOT NULL,
    "Sunday" boolean NOT NULL,
    "Tuesday" boolean NOT NULL,
    "Saturday" boolean NOT NULL,
    "Thursday" boolean NOT NULL,
    "Wednesday" boolean NOT NULL
);
 )   DROP TABLE dbo."BranchDaysAvailability";
       dbo         heap    postgres    false    6            �            1259    55134 
   BranchUser    TABLE     �  CREATE TABLE dbo."BranchUser" (
    "BranchUserId" bigint NOT NULL,
    "BranchId" bigint NOT NULL,
    "UserId" bigint NOT NULL,
    "Brand" dbo.brand_type_enum NOT NULL,
    "Name" character varying NOT NULL,
    "Email" character varying,
    "MobileNumber" character varying,
    "AccessGranted" boolean DEFAULT false,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."BranchUser";
       dbo         heap    postgres    false    6    891            �            1259    55133    BranchUser_DriverUserId_seq    SEQUENCE     �   ALTER TABLE dbo."BranchUser" ALTER COLUMN "BranchUserId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."BranchUser_DriverUserId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    245    6            �            1259    55120    Branch_BranchId_seq    SEQUENCE     �   ALTER TABLE dbo."Branch" ALTER COLUMN "BranchId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Branch_BranchId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    243    6            �            1259    55032    Cart    TABLE     l  CREATE TABLE dbo."Cart" (
    "CartId" bigint NOT NULL,
    "CustomerUserId" bigint,
    "GuestId" bigint,
    "FirstName" character varying NOT NULL,
    "LastName" character varying NOT NULL,
    "MobileNumber" character varying,
    "MobileCountryCode" character varying,
    "Email" character varying,
    "PaymentMethodId" bigint NOT NULL,
    "PaymentChangeFor" numeric,
    "DeliveryAddress" character varying NOT NULL,
    "LocationCoordinates" jsonb DEFAULT '{}'::json NOT NULL,
    "CustomerAddressId" bigint NOT NULL,
    "DeliveryFee" numeric DEFAULT 0 NOT NULL,
    "Disposition" dbo.disposition NOT NULL,
    "DispositionType" dbo.disposition_type NOT NULL,
    "DispositionSchedule" timestamp with time zone,
    "PromoCode" character varying,
    "Subtotal" numeric DEFAULT 0 NOT NULL,
    "Discount" numeric DEFAULT 0 NOT NULL,
    "Total" numeric NOT NULL,
    "IsIncludeUtensils" boolean DEFAULT false,
    "SpecialInstructions" character varying,
    "NotesToRider" character varying,
    "PendingStateAt" timestamp with time zone,
    "CancelledStateAt" timestamp with time zone,
    "CancelReason" character varying,
    "AdditionalReason" character varying,
    "Brand" dbo.brand_type_enum NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."Cart";
       dbo         heap    postgres    false    891    942    6    945            �            1259    55031    Cart_CartId_seq    SEQUENCE     �   ALTER TABLE dbo."Cart" ALTER COLUMN "CartId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Cart_CartId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    233            �            1259    55205    Category    TABLE     �  CREATE TABLE dbo."Category" (
    "CategoryId" bigint NOT NULL,
    "CategoryCode" character varying NOT NULL,
    "Name" character varying NOT NULL,
    "Description" character varying NOT NULL,
    "Brand" dbo.brand_type_enum NOT NULL,
    "ImageUrl" character varying,
    "SortOrder" integer,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."Category";
       dbo         heap    postgres    false    6    891            �            1259    55204    Category_CategoryId_seq    SEQUENCE     �   ALTER TABLE dbo."Category" ALTER COLUMN "CategoryId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Category_CategoryId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    251            �            1259    54869    CorporateUser    TABLE     �  CREATE TABLE dbo."CorporateUser" (
    "CorporateUserId" bigint NOT NULL,
    "UserId" bigint NOT NULL,
    "Brand" dbo.brand_type_enum NOT NULL,
    "Name" character varying NOT NULL,
    "Email" character varying,
    "MobileNumber" character varying,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "AccessGranted" boolean DEFAULT false NOT NULL,
    "Active" boolean DEFAULT true NOT NULL
);
     DROP TABLE dbo."CorporateUser";
       dbo         heap    postgres    false    891    6            �            1259    54868 !   CorporateUser_CorporateUserId_seq    SEQUENCE     �   ALTER TABLE dbo."CorporateUser" ALTER COLUMN "CorporateUserId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."CorporateUser_CorporateUserId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    221    6            �            1259    55103    CustomerAddress    TABLE     E  CREATE TABLE dbo."CustomerAddress" (
    "CustomerAddressId" bigint NOT NULL,
    "CustomerUserId" bigint NOT NULL,
    "Province" character varying,
    "City" character varying,
    "Barangay" character varying,
    "Address" character varying,
    "Building" character varying,
    "Subdivision" character varying,
    "HouseNumber" character varying,
    "LocationCoordinates" jsonb DEFAULT '{}'::json NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
 "   DROP TABLE dbo."CustomerAddress";
       dbo         heap    postgres    false    6            �            1259    55102 %   CustomerAddress_CustomerAddressId_seq    SEQUENCE     �   ALTER TABLE dbo."CustomerAddress" ALTER COLUMN "CustomerAddressId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."CustomerAddress_CustomerAddressId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    241    6            �            1259    55081    CustomerUser    TABLE     z  CREATE TABLE dbo."CustomerUser" (
    "CustomerUserId" bigint NOT NULL,
    "UserId" bigint NOT NULL,
    "Brand" dbo.brand_type_enum NOT NULL,
    "FirstName" character varying NOT NULL,
    "MiddleName" character varying,
    "LastName" character varying NOT NULL,
    "Birthdate" date,
    "ImageUrl" character varying,
    "Email" character varying,
    "MobileNumber" character varying,
    "MobileCountryCode" character varying,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL,
    "FullName" character varying
);
    DROP TABLE dbo."CustomerUser";
       dbo         heap    postgres    false    6    891            �            1259    55100    CustomerUser_CustomerUserId_seq    SEQUENCE     �   ALTER TABLE dbo."CustomerUser" ALTER COLUMN "CustomerUserId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."CustomerUser_CustomerUserId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    236            �            1259    55143 
   DriverUser    TABLE     �  CREATE TABLE dbo."DriverUser" (
    "DriverUserId" bigint NOT NULL,
    "UserId" bigint NOT NULL,
    "Brand" dbo.brand_type_enum NOT NULL,
    "Name" character varying NOT NULL,
    "Email" character varying,
    "MobileNumber" character varying,
    "AccessGranted" boolean DEFAULT false NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."DriverUser";
       dbo         heap    postgres    false    891    6            �            1259    55142    DriverUser_DriverUserId_seq    SEQUENCE     �   ALTER TABLE dbo."DriverUser" ALTER COLUMN "DriverUserId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."DriverUser_DriverUserId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    247    6            �            1259    55090    Guest    TABLE     �  CREATE TABLE dbo."Guest" (
    "GuestId" bigint NOT NULL,
    "SessionId" uuid NOT NULL,
    "Brand" dbo.brand_type_enum NOT NULL,
    "FirstName" character varying NOT NULL,
    "LastName" character varying NOT NULL,
    "Email" character varying,
    "MobileNumber" character varying,
    "MobileCountryCode" character varying,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."Guest";
       dbo         heap    postgres    false    6    891            �            1259    55101    Guest_GuestId_seq    SEQUENCE     �   ALTER TABLE dbo."Guest" ALTER COLUMN "GuestId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Guest_GuestId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    237            �            1259    55015    Order    TABLE     7  CREATE TABLE dbo."Order" (
    "OrderId" bigint NOT NULL,
    "OrderNo" character varying NOT NULL,
    "CartId" bigint NOT NULL,
    "ClaimNo" character varying,
    "CustomerUserId" bigint,
    "GuestId" bigint,
    "FirstName" character varying NOT NULL,
    "LastName" character varying NOT NULL,
    "MobileNumber" character varying,
    "MobileCountryCode" character varying,
    "Email" character varying,
    "PaymentMethodId" bigint NOT NULL,
    "PaymentChangeFor" numeric,
    "DeliveryAddress" character varying NOT NULL,
    "LocationCoordinates" jsonb DEFAULT '{}'::json NOT NULL,
    "CustomerAddressId" bigint NOT NULL,
    "DeliveryFee" numeric DEFAULT 0 NOT NULL,
    "Disposition" dbo.disposition NOT NULL,
    "DispositionType" dbo.disposition_type NOT NULL,
    "DispositionSchedule" timestamp with time zone,
    "PromoCode" character varying,
    "Subtotal" numeric DEFAULT 0 NOT NULL,
    "Discount" numeric DEFAULT 0 NOT NULL,
    "Total" numeric NOT NULL,
    "IsIncludeUtensils" boolean DEFAULT false,
    "SpecialInstructions" character varying,
    "NotesToRider" character varying,
    "OrderStatus" dbo.order_status_enum DEFAULT 'ORDER_PLACED'::dbo.order_status_enum NOT NULL,
    "PendingStateAt" timestamp with time zone,
    "CancelledStateAt" timestamp with time zone,
    "CancelReason" character varying,
    "AdditionalReason" character varying,
    "Brand" dbo.brand_type_enum NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."Order";
       dbo         heap    postgres    false    939    939    945    942    6    891            �            1259    55014    Order_OrderId_seq    SEQUENCE     �   ALTER TABLE dbo."Order" ALTER COLUMN "OrderId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Order_OrderId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    231            �            1259    55184    PaymentOptions    TABLE     P  CREATE TABLE dbo."PaymentOptions" (
    "PaymentOptionId" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "Description" character varying NOT NULL,
    "Brand" dbo.brand_type_enum,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean
);
 !   DROP TABLE dbo."PaymentOptions";
       dbo         heap    postgres    false    891    6            �            1259    55183 !   PaymentMethod_PaymentMethodId_seq    SEQUENCE     �   ALTER TABLE dbo."PaymentOptions" ALTER COLUMN "PaymentOptionId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."PaymentMethod_PaymentMethodId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    249            �            1259    54881    Product    TABLE     Z  CREATE TABLE dbo."Product" (
    "ProductId" bigint NOT NULL,
    "Sku" character varying NOT NULL,
    "ItemCode" character varying NOT NULL,
    "Name" character varying NOT NULL,
    "Description" text,
    "Brand" dbo.brand_type_enum NOT NULL,
    "Price" numeric DEFAULT 0 NOT NULL,
    "Flavor" character varying,
    "IsCombo" boolean,
    "IsBundle" boolean,
    "IsSingle" boolean,
    "IsFreebie" boolean,
    "ImageUrl" text,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."Product";
       dbo         heap    postgres    false    6    891            �            1259    54792    ProductBranch    TABLE     �   CREATE TABLE dbo."ProductBranch" (
    "ProductId" bigint NOT NULL,
    "BranchId" bigint NOT NULL,
    "Stock" numeric DEFAULT 0 NOT NULL,
    "IsAvailable" boolean DEFAULT true NOT NULL
);
     DROP TABLE dbo."ProductBranch";
       dbo         heap    postgres    false    6            �            1259    55215    ProductCategory    TABLE     `  CREATE TABLE dbo."ProductCategory" (
    "ProductCategoryId" bigint NOT NULL,
    "ProductId" bigint NOT NULL,
    "CategoryId" bigint NOT NULL,
    "Brand" dbo.brand_type_enum NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
 "   DROP TABLE dbo."ProductCategory";
       dbo         heap    postgres    false    6    891            �            1259    55214 %   ProductCategory_ProductCategoryId_seq    SEQUENCE     �   ALTER TABLE dbo."ProductCategory" ALTER COLUMN "ProductCategoryId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."ProductCategory_ProductCategoryId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    253            �            1259    54898    ProductOption    TABLE       CREATE TABLE dbo."ProductOption" (
    "ProductOptionId" bigint NOT NULL,
    "ProductOptionTypeId" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "Quantity" numeric DEFAULT 1 NOT NULL,
    "IsRequired" boolean NOT NULL,
    "Active" boolean DEFAULT true NOT NULL
);
     DROP TABLE dbo."ProductOption";
       dbo         heap    postgres    false    6            �            1259    54919    ProductOptionType    TABLE     m  CREATE TABLE dbo."ProductOptionType" (
    "ProductOptionTypeId" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "Description" character varying,
    "Brand" dbo.brand_type_enum NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
 $   DROP TABLE dbo."ProductOptionType";
       dbo         heap    postgres    false    891    6            �            1259    54918 )   ProductOptionType_ProductOptionTypeId_seq    SEQUENCE     �   ALTER TABLE dbo."ProductOptionType" ALTER COLUMN "ProductOptionTypeId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."ProductOptionType_ProductOptionTypeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    228    6            �            1259    54891    ProductOptionValue    TABLE     �  CREATE TABLE dbo."ProductOptionValue" (
    "ProductOptionValueId" bigint NOT NULL,
    "ProductOptionId" bigint NOT NULL,
    "ProductId" bigint NOT NULL,
    "Name" character varying NOT NULL,
    "Price" numeric DEFAULT 0 NOT NULL,
    "IsDefault" boolean,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
 %   DROP TABLE dbo."ProductOptionValue";
       dbo         heap    postgres    false    6            �            1259    54928 +   ProductOptionValue_ProductOptionValueId_seq    SEQUENCE       ALTER TABLE dbo."ProductOptionValue" ALTER COLUMN "ProductOptionValueId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."ProductOptionValue_ProductOptionValueId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    224            �            1259    54912 !   ProductOption_ProductOptionId_seq    SEQUENCE     �   ALTER TABLE dbo."ProductOption" ALTER COLUMN "ProductOptionId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."ProductOption_ProductOptionId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    225            �            1259    54880    Product_ProductId_seq    SEQUENCE     �   ALTER TABLE dbo."Product" ALTER COLUMN "ProductId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."Product_ProductId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    223    6            �            1259    55071    User    TABLE     w  CREATE TABLE dbo."User" (
    "UserId" bigint NOT NULL,
    "Role" dbo.user_role_enum NOT NULL,
    "Brand" dbo.brand_type_enum NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL,
    "IsVerified" boolean DEFAULT false NOT NULL,
    "AccessId" bigint
);
    DROP TABLE dbo."User";
       dbo         heap    postgres    false    6    912    891            �            1259    55236    UserAuth    TABLE     �  CREATE TABLE dbo."UserAuth" (
    "UserAuthId" bigint NOT NULL,
    "UserId" bigint NOT NULL,
    "AuthMethod" dbo.auth_method_enum NOT NULL,
    "ProviderUserId" character varying,
    "PasswordHash" character varying,
    "IsVerified" boolean DEFAULT false NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "UpdatedAt" timestamp with time zone,
    "Active" boolean DEFAULT true NOT NULL
);
    DROP TABLE dbo."UserAuth";
       dbo         heap    postgres    false    909    6            �            1259    54835    UserAuthLog    TABLE       CREATE TABLE dbo."UserAuthLog" (
    "UserAuthLogId" bigint NOT NULL,
    "UserAuthId" bigint NOT NULL,
    "UserAgent" character varying NOT NULL,
    "EventType" dbo.auth_event_type_enum NOT NULL,
    "EventTime" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "IpAddress" character varying,
    "AuthMethod" dbo.auth_method_enum NOT NULL,
    "SessionId" character varying NOT NULL,
    "Status" dbo.auth_status_enum NOT NULL,
    "MfaMethod" dbo.mfa_method_enum,
    "MfaStatus" dbo.mfa_status_enum,
    "Geolocation" character varying,
    "FailedReason" text,
    "LoginAt" timestamp with time zone,
    "LogOutAt" timestamp with time zone,
    "Brand" dbo.brand_type_enum NOT NULL,
    "AccessToken" character varying NOT NULL,
    "RefreshToken" character varying NOT NULL
);
    DROP TABLE dbo."UserAuthLog";
       dbo         heap    postgres    false    906    6    903    900    897    909    891            �            1259    54834    UserAuthLog_UserAuthLogId_seq    SEQUENCE     �   ALTER TABLE dbo."UserAuthLog" ALTER COLUMN "UserAuthLogId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."UserAuthLog_UserAuthLogId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    219    6                       1259    55598    UserAuthTokenLog    TABLE     �  CREATE TABLE dbo."UserAuthTokenLog" (
    "UserAuthTokenLogId" bigint NOT NULL,
    "UserAuthId" bigint NOT NULL,
    "Token" character varying NOT NULL,
    "TokenType" dbo.auth_token_type_enum NOT NULL,
    "IssuedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ExpiresAt" timestamp without time zone NOT NULL,
    "UsedAt" timestamp without time zone,
    "Status" dbo.auth_token_status_enum DEFAULT 'ACTIVE'::dbo.auth_token_status_enum NOT NULL,
    "IpAddress" character varying,
    "UserAgent" character varying,
    "Geolocation" character varying,
    "FailedReason" character varying,
    "IsRevoked" boolean DEFAULT false,
    "RevokedAt " timestamp without time zone,
    "Brand" dbo.brand_type_enum NOT NULL
);
 #   DROP TABLE dbo."UserAuthTokenLog";
       dbo         heap    postgres    false    990    987    6    891    990                        1259    55597 '   UserAuthTokenLog_UserAuthTokenLogId_seq    SEQUENCE     �   ALTER TABLE dbo."UserAuthTokenLog" ALTER COLUMN "UserAuthTokenLogId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."UserAuthTokenLog_UserAuthTokenLogId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    257    6            �            1259    55235    UserAuth_UserAuthId_seq    SEQUENCE     �   ALTER TABLE dbo."UserAuth" ALTER COLUMN "UserAuthId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."UserAuth_UserAuthId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    255    6            �            1259    55070    User_UserId_seq    SEQUENCE     �   ALTER TABLE dbo."User" ALTER COLUMN "UserId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME dbo."User_UserId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            dbo          postgres    false    6    235            -          0    58719    Access 
   TABLE DATA           L   COPY dbo."Access" ("AccessId", "Name", "AccessPages", "Active") FROM stdin;
    dbo          postgres    false    259   )                0    55121    Branch 
   TABLE DATA           Q  COPY dbo."Branch" ("BranchId", "BranchCode", "Brand", "Name", "Description", "Address", "Province", "City", "Country", "Phone", "LocationCoordinates", "Disposition", "PaymentMethodIds", "MinOrderValue", "MaxOrderValue", "OpensAt", "ClosesAt", "ClosedFrom", "ClosedUntil", "IsOperational", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    243   &                0    54823    BranchDaysAvailability 
   TABLE DATA           �   COPY dbo."BranchDaysAvailability" ("BranchId", "ProductId", "Friday", "Monday", "Sunday", "Tuesday", "Saturday", "Thursday", "Wednesday") FROM stdin;
    dbo          postgres    false    217   �                0    55134 
   BranchUser 
   TABLE DATA           �   COPY dbo."BranchUser" ("BranchUserId", "BranchId", "UserId", "Brand", "Name", "Email", "MobileNumber", "AccessGranted", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    245   �                0    55032    Cart 
   TABLE DATA             COPY dbo."Cart" ("CartId", "CustomerUserId", "GuestId", "FirstName", "LastName", "MobileNumber", "MobileCountryCode", "Email", "PaymentMethodId", "PaymentChangeFor", "DeliveryAddress", "LocationCoordinates", "CustomerAddressId", "DeliveryFee", "Disposition", "DispositionType", "DispositionSchedule", "PromoCode", "Subtotal", "Discount", "Total", "IsIncludeUtensils", "SpecialInstructions", "NotesToRider", "PendingStateAt", "CancelledStateAt", "CancelReason", "AdditionalReason", "Brand", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    233         %          0    55205    Category 
   TABLE DATA           �   COPY dbo."Category" ("CategoryId", "CategoryCode", "Name", "Description", "Brand", "ImageUrl", "SortOrder", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    251   4                0    54869    CorporateUser 
   TABLE DATA           �   COPY dbo."CorporateUser" ("CorporateUserId", "UserId", "Brand", "Name", "Email", "MobileNumber", "CreatedAt", "UpdatedAt", "AccessGranted", "Active") FROM stdin;
    dbo          postgres    false    221   �                0    55103    CustomerAddress 
   TABLE DATA           �   COPY dbo."CustomerAddress" ("CustomerAddressId", "CustomerUserId", "Province", "City", "Barangay", "Address", "Building", "Subdivision", "HouseNumber", "LocationCoordinates", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    241   [	                0    55081    CustomerUser 
   TABLE DATA           �   COPY dbo."CustomerUser" ("CustomerUserId", "UserId", "Brand", "FirstName", "MiddleName", "LastName", "Birthdate", "ImageUrl", "Email", "MobileNumber", "MobileCountryCode", "CreatedAt", "UpdatedAt", "Active", "FullName") FROM stdin;
    dbo          postgres    false    236   x	      !          0    55143 
   DriverUser 
   TABLE DATA           �   COPY dbo."DriverUser" ("DriverUserId", "UserId", "Brand", "Name", "Email", "MobileNumber", "AccessGranted", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    247   
                0    55090    Guest 
   TABLE DATA           �   COPY dbo."Guest" ("GuestId", "SessionId", "Brand", "FirstName", "LastName", "Email", "MobileNumber", "MobileCountryCode", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    237   
                0    55015    Order 
   TABLE DATA           K  COPY dbo."Order" ("OrderId", "OrderNo", "CartId", "ClaimNo", "CustomerUserId", "GuestId", "FirstName", "LastName", "MobileNumber", "MobileCountryCode", "Email", "PaymentMethodId", "PaymentChangeFor", "DeliveryAddress", "LocationCoordinates", "CustomerAddressId", "DeliveryFee", "Disposition", "DispositionType", "DispositionSchedule", "PromoCode", "Subtotal", "Discount", "Total", "IsIncludeUtensils", "SpecialInstructions", "NotesToRider", "OrderStatus", "PendingStateAt", "CancelledStateAt", "CancelReason", "AdditionalReason", "Brand", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    231   ;
      #          0    55184    PaymentOptions 
   TABLE DATA           ~   COPY dbo."PaymentOptions" ("PaymentOptionId", "Name", "Description", "Brand", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    249   X
      	          0    54881    Product 
   TABLE DATA           �   COPY dbo."Product" ("ProductId", "Sku", "ItemCode", "Name", "Description", "Brand", "Price", "Flavor", "IsCombo", "IsBundle", "IsSingle", "IsFreebie", "ImageUrl", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    223   u
                0    54792    ProductBranch 
   TABLE DATA           W   COPY dbo."ProductBranch" ("ProductId", "BranchId", "Stock", "IsAvailable") FROM stdin;
    dbo          postgres    false    216   �
      '          0    55215    ProductCategory 
   TABLE DATA           �   COPY dbo."ProductCategory" ("ProductCategoryId", "ProductId", "CategoryId", "Brand", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    253   �
                0    54898    ProductOption 
   TABLE DATA           |   COPY dbo."ProductOption" ("ProductOptionId", "ProductOptionTypeId", "Name", "Quantity", "IsRequired", "Active") FROM stdin;
    dbo          postgres    false    225   �
                0    54919    ProductOptionType 
   TABLE DATA           �   COPY dbo."ProductOptionType" ("ProductOptionTypeId", "Name", "Description", "Brand", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    228   �
      
          0    54891    ProductOptionValue 
   TABLE DATA           �   COPY dbo."ProductOptionValue" ("ProductOptionValueId", "ProductOptionId", "ProductId", "Name", "Price", "IsDefault", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    224                   0    55071    User 
   TABLE DATA           v   COPY dbo."User" ("UserId", "Role", "Brand", "CreatedAt", "UpdatedAt", "Active", "IsVerified", "AccessId") FROM stdin;
    dbo          postgres    false    235   #      )          0    55236    UserAuth 
   TABLE DATA           �   COPY dbo."UserAuth" ("UserAuthId", "UserId", "AuthMethod", "ProviderUserId", "PasswordHash", "IsVerified", "CreatedAt", "UpdatedAt", "Active") FROM stdin;
    dbo          postgres    false    255   �                0    54835    UserAuthLog 
   TABLE DATA             COPY dbo."UserAuthLog" ("UserAuthLogId", "UserAuthId", "UserAgent", "EventType", "EventTime", "IpAddress", "AuthMethod", "SessionId", "Status", "MfaMethod", "MfaStatus", "Geolocation", "FailedReason", "LoginAt", "LogOutAt", "Brand", "AccessToken", "RefreshToken") FROM stdin;
    dbo          postgres    false    219   /      +          0    55598    UserAuthTokenLog 
   TABLE DATA           �   COPY dbo."UserAuthTokenLog" ("UserAuthTokenLogId", "UserAuthId", "Token", "TokenType", "IssuedAt", "ExpiresAt", "UsedAt", "Status", "IpAddress", "UserAgent", "Geolocation", "FailedReason", "IsRevoked", "RevokedAt ", "Brand") FROM stdin;
    dbo          postgres    false    257   s      4           0    0    Access_AccessId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('dbo."Access_AccessId_seq"', 2, true);
          dbo          postgres    false    258            5           0    0    BranchUser_DriverUserId_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('dbo."BranchUser_DriverUserId_seq"', 3, true);
          dbo          postgres    false    244            6           0    0    Branch_BranchId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('dbo."Branch_BranchId_seq"', 1, true);
          dbo          postgres    false    242            7           0    0    Cart_CartId_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('dbo."Cart_CartId_seq"', 1, false);
          dbo          postgres    false    232            8           0    0    Category_CategoryId_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('dbo."Category_CategoryId_seq"', 10, true);
          dbo          postgres    false    250            9           0    0 !   CorporateUser_CorporateUserId_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('dbo."CorporateUser_CorporateUserId_seq"', 2, true);
          dbo          postgres    false    220            :           0    0 %   CustomerAddress_CustomerAddressId_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('dbo."CustomerAddress_CustomerAddressId_seq"', 1, false);
          dbo          postgres    false    240            ;           0    0    CustomerUser_CustomerUserId_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('dbo."CustomerUser_CustomerUserId_seq"', 1, true);
          dbo          postgres    false    238            <           0    0    DriverUser_DriverUserId_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('dbo."DriverUser_DriverUserId_seq"', 1, false);
          dbo          postgres    false    246            =           0    0    Guest_GuestId_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('dbo."Guest_GuestId_seq"', 1, false);
          dbo          postgres    false    239            >           0    0    Order_OrderId_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('dbo."Order_OrderId_seq"', 1, false);
          dbo          postgres    false    230            ?           0    0 !   PaymentMethod_PaymentMethodId_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('dbo."PaymentMethod_PaymentMethodId_seq"', 1, false);
          dbo          postgres    false    248            @           0    0 %   ProductCategory_ProductCategoryId_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('dbo."ProductCategory_ProductCategoryId_seq"', 1, false);
          dbo          postgres    false    252            A           0    0 )   ProductOptionType_ProductOptionTypeId_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('dbo."ProductOptionType_ProductOptionTypeId_seq"', 1, false);
          dbo          postgres    false    227            B           0    0 +   ProductOptionValue_ProductOptionValueId_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('dbo."ProductOptionValue_ProductOptionValueId_seq"', 1, false);
          dbo          postgres    false    229            C           0    0 !   ProductOption_ProductOptionId_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('dbo."ProductOption_ProductOptionId_seq"', 1, false);
          dbo          postgres    false    226            D           0    0    Product_ProductId_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('dbo."Product_ProductId_seq"', 1, false);
          dbo          postgres    false    222            E           0    0    UserAuthLog_UserAuthLogId_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('dbo."UserAuthLog_UserAuthLogId_seq"', 10, true);
          dbo          postgres    false    218            F           0    0 '   UserAuthTokenLog_UserAuthTokenLogId_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('dbo."UserAuthTokenLog_UserAuthTokenLogId_seq"', 24, true);
          dbo          postgres    false    256            G           0    0    UserAuth_UserAuthId_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('dbo."UserAuth_UserAuthId_seq"', 5, true);
          dbo          postgres    false    254            H           0    0    User_UserId_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('dbo."User_UserId_seq"', 5, true);
          dbo          postgres    false    234            f           2606    58727    Access Access_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY dbo."Access"
    ADD CONSTRAINT "Access_pkey" PRIMARY KEY ("AccessId");
 =   ALTER TABLE ONLY dbo."Access" DROP CONSTRAINT "Access_pkey";
       dbo            postgres    false    259            S           2606    55193    BranchUser BranchUser_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY dbo."BranchUser"
    ADD CONSTRAINT "BranchUser_pkey" PRIMARY KEY ("BranchUserId");
 E   ALTER TABLE ONLY dbo."BranchUser" DROP CONSTRAINT "BranchUser_pkey";
       dbo            postgres    false    245            N           2606    55132    Branch Branch_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY dbo."Branch"
    ADD CONSTRAINT "Branch_pkey" PRIMARY KEY ("BranchId");
 =   ALTER TABLE ONLY dbo."Branch" DROP CONSTRAINT "Branch_pkey";
       dbo            postgres    false    243            ?           2606    55046    Cart Cart_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY dbo."Cart"
    ADD CONSTRAINT "Cart_pkey" PRIMARY KEY ("CartId");
 9   ALTER TABLE ONLY dbo."Cart" DROP CONSTRAINT "Cart_pkey";
       dbo            postgres    false    233            ^           2606    55213    Category Category_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY dbo."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY ("CategoryId");
 A   ALTER TABLE ONLY dbo."Category" DROP CONSTRAINT "Category_pkey";
       dbo            postgres    false    251            3           2606    54878     CorporateUser CorporateUser_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dbo."CorporateUser"
    ADD CONSTRAINT "CorporateUser_pkey" PRIMARY KEY ("CorporateUserId");
 K   ALTER TABLE ONLY dbo."CorporateUser" DROP CONSTRAINT "CorporateUser_pkey";
       dbo            postgres    false    221            J           2606    55112 $   CustomerAddress CustomerAddress_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY dbo."CustomerAddress"
    ADD CONSTRAINT "CustomerAddress_pkey" PRIMARY KEY ("CustomerAddressId");
 O   ALTER TABLE ONLY dbo."CustomerAddress" DROP CONSTRAINT "CustomerAddress_pkey";
       dbo            postgres    false    241            F           2606    55089    CustomerUser CustomerUser_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY dbo."CustomerUser"
    ADD CONSTRAINT "CustomerUser_pkey" PRIMARY KEY ("CustomerUserId");
 I   ALTER TABLE ONLY dbo."CustomerUser" DROP CONSTRAINT "CustomerUser_pkey";
       dbo            postgres    false    236            ,           2606    54827 ,   BranchDaysAvailability DaysAvailability_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY dbo."BranchDaysAvailability"
    ADD CONSTRAINT "DaysAvailability_pkey" PRIMARY KEY ("BranchId", "ProductId");
 W   ALTER TABLE ONLY dbo."BranchDaysAvailability" DROP CONSTRAINT "DaysAvailability_pkey";
       dbo            postgres    false    217    217            X           2606    55157    DriverUser DriverUser_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY dbo."DriverUser"
    ADD CONSTRAINT "DriverUser_pkey" PRIMARY KEY ("DriverUserId");
 E   ALTER TABLE ONLY dbo."DriverUser" DROP CONSTRAINT "DriverUser_pkey";
       dbo            postgres    false    247            H           2606    55098    Guest Guest_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY dbo."Guest"
    ADD CONSTRAINT "Guest_pkey" PRIMARY KEY ("GuestId");
 ;   ALTER TABLE ONLY dbo."Guest" DROP CONSTRAINT "Guest_pkey";
       dbo            postgres    false    237            =           2606    55029    Order Order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY dbo."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("OrderId");
 ;   ALTER TABLE ONLY dbo."Order" DROP CONSTRAINT "Order_pkey";
       dbo            postgres    false    231            Z           2606    55191 !   PaymentOptions PaymentMethod_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY dbo."PaymentOptions"
    ADD CONSTRAINT "PaymentMethod_pkey" PRIMARY KEY ("PaymentOptionId");
 L   ALTER TABLE ONLY dbo."PaymentOptions" DROP CONSTRAINT "PaymentMethod_pkey";
       dbo            postgres    false    249            *           2606    54796     ProductBranch ProductBranch_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY dbo."ProductBranch"
    ADD CONSTRAINT "ProductBranch_pkey" PRIMARY KEY ("BranchId", "ProductId");
 K   ALTER TABLE ONLY dbo."ProductBranch" DROP CONSTRAINT "ProductBranch_pkey";
       dbo            postgres    false    216    216            `           2606    55231 $   ProductCategory ProductCategory_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY dbo."ProductCategory"
    ADD CONSTRAINT "ProductCategory_pkey" PRIMARY KEY ("ProductCategoryId");
 O   ALTER TABLE ONLY dbo."ProductCategory" DROP CONSTRAINT "ProductCategory_pkey";
       dbo            postgres    false    253            ;           2606    54927 (   ProductOptionType ProductOptionType_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY dbo."ProductOptionType"
    ADD CONSTRAINT "ProductOptionType_pkey" PRIMARY KEY ("ProductOptionTypeId");
 S   ALTER TABLE ONLY dbo."ProductOptionType" DROP CONSTRAINT "ProductOptionType_pkey";
       dbo            postgres    false    228            7           2606    54897 *   ProductOptionValue ProductOptionValue_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY dbo."ProductOptionValue"
    ADD CONSTRAINT "ProductOptionValue_pkey" PRIMARY KEY ("ProductOptionValueId");
 U   ALTER TABLE ONLY dbo."ProductOptionValue" DROP CONSTRAINT "ProductOptionValue_pkey";
       dbo            postgres    false    224            9           2606    54904     ProductOption ProductOption_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY dbo."ProductOption"
    ADD CONSTRAINT "ProductOption_pkey" PRIMARY KEY ("ProductOptionId");
 K   ALTER TABLE ONLY dbo."ProductOption" DROP CONSTRAINT "ProductOption_pkey";
       dbo            postgres    false    225            5           2606    54890    Product Product_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY dbo."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("ProductId");
 ?   ALTER TABLE ONLY dbo."Product" DROP CONSTRAINT "Product_pkey";
       dbo            postgres    false    223            .           2606    54842    UserAuthLog UserAuthLog_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY dbo."UserAuthLog"
    ADD CONSTRAINT "UserAuthLog_pkey" PRIMARY KEY ("UserAuthLogId");
 G   ALTER TABLE ONLY dbo."UserAuthLog" DROP CONSTRAINT "UserAuthLog_pkey";
       dbo            postgres    false    219            d           2606    55607 &   UserAuthTokenLog UserAuthTokenLog_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY dbo."UserAuthTokenLog"
    ADD CONSTRAINT "UserAuthTokenLog_pkey" PRIMARY KEY ("UserAuthTokenLogId");
 Q   ALTER TABLE ONLY dbo."UserAuthTokenLog" DROP CONSTRAINT "UserAuthTokenLog_pkey";
       dbo            postgres    false    257            b           2606    55244    UserAuth UserAuth_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY dbo."UserAuth"
    ADD CONSTRAINT "UserAuth_pkey" PRIMARY KEY ("UserAuthId");
 A   ALTER TABLE ONLY dbo."UserAuth" DROP CONSTRAINT "UserAuth_pkey";
       dbo            postgres    false    255            A           2606    55077    User User_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY dbo."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("UserId");
 9   ALTER TABLE ONLY dbo."User" DROP CONSTRAINT "User_pkey";
       dbo            postgres    false    235            O           1259    56321    BranchUser_Email_Active_idx    INDEX     �   CREATE UNIQUE INDEX "BranchUser_Email_Active_idx" ON dbo."BranchUser" USING btree ("Email", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 .   DROP INDEX dbo."BranchUser_Email_Active_idx";
       dbo            postgres    false    245    245    245            P           1259    56320 "   BranchUser_MobileNumber_Active_idx    INDEX     �   CREATE UNIQUE INDEX "BranchUser_MobileNumber_Active_idx" ON dbo."BranchUser" USING btree ("MobileNumber", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 5   DROP INDEX dbo."BranchUser_MobileNumber_Active_idx";
       dbo            postgres    false    245    245    245            Q           1259    56319    BranchUser_UserId_idx    INDEX     y   CREATE UNIQUE INDEX "BranchUser_UserId_idx" ON dbo."BranchUser" USING btree ("UserId") WITH (deduplicate_items='false');
 (   DROP INDEX dbo."BranchUser_UserId_idx";
       dbo            postgres    false    245            K           1259    56322    Branch_BranchCode_Active_idx    INDEX     �   CREATE UNIQUE INDEX "Branch_BranchCode_Active_idx" ON dbo."Branch" USING btree ("BranchCode", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 /   DROP INDEX dbo."Branch_BranchCode_Active_idx";
       dbo            postgres    false    243    243    243            L           1259    56323    Branch_Name_Active_idx    INDEX     �   CREATE UNIQUE INDEX "Branch_Name_Active_idx" ON dbo."Branch" USING btree ("Name", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 )   DROP INDEX dbo."Branch_Name_Active_idx";
       dbo            postgres    false    243    243    243            [           1259    56240     Category_CategoryCode_Active_idx    INDEX     �   CREATE UNIQUE INDEX "Category_CategoryCode_Active_idx" ON dbo."Category" USING btree ("CategoryCode", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 3   DROP INDEX dbo."Category_CategoryCode_Active_idx";
       dbo            postgres    false    251    251    251            \           1259    56241    Category_Name_Active_idx    INDEX     �   CREATE UNIQUE INDEX "Category_Name_Active_idx" ON dbo."Category" USING btree ("Name", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 +   DROP INDEX dbo."Category_Name_Active_idx";
       dbo            postgres    false    251    251    251            /           1259    56290    CorporateUser_Email_Active_idx    INDEX     �   CREATE UNIQUE INDEX "CorporateUser_Email_Active_idx" ON dbo."CorporateUser" USING btree ("Email", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 1   DROP INDEX dbo."CorporateUser_Email_Active_idx";
       dbo            postgres    false    221    221    221            0           1259    56291 %   CorporateUser_MobileNumber_Active_idx    INDEX     �   CREATE UNIQUE INDEX "CorporateUser_MobileNumber_Active_idx" ON dbo."CorporateUser" USING btree ("MobileNumber", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 8   DROP INDEX dbo."CorporateUser_MobileNumber_Active_idx";
       dbo            postgres    false    221    221    221            1           1259    56289    CorporateUser_UserId_idx    INDEX        CREATE UNIQUE INDEX "CorporateUser_UserId_idx" ON dbo."CorporateUser" USING btree ("UserId") WITH (deduplicate_items='false');
 +   DROP INDEX dbo."CorporateUser_UserId_idx";
       dbo            postgres    false    221            B           1259    56351    CustomerUser_Email_Active_idx    INDEX     �   CREATE UNIQUE INDEX "CustomerUser_Email_Active_idx" ON dbo."CustomerUser" USING btree ("Email", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 0   DROP INDEX dbo."CustomerUser_Email_Active_idx";
       dbo            postgres    false    236    236    236            C           1259    56352 $   CustomerUser_MobileNumber_Active_idx    INDEX     �   CREATE UNIQUE INDEX "CustomerUser_MobileNumber_Active_idx" ON dbo."CustomerUser" USING btree ("MobileNumber", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 7   DROP INDEX dbo."CustomerUser_MobileNumber_Active_idx";
       dbo            postgres    false    236    236    236            D           1259    56353    CustomerUser_UserId_idx    INDEX     }   CREATE UNIQUE INDEX "CustomerUser_UserId_idx" ON dbo."CustomerUser" USING btree ("UserId") WITH (deduplicate_items='false');
 *   DROP INDEX dbo."CustomerUser_UserId_idx";
       dbo            postgres    false    236            T           1259    56356    DriverUser_Email_Active_idx    INDEX     �   CREATE UNIQUE INDEX "DriverUser_Email_Active_idx" ON dbo."DriverUser" USING btree ("Email", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 .   DROP INDEX dbo."DriverUser_Email_Active_idx";
       dbo            postgres    false    247    247    247            U           1259    56357 "   DriverUser_MobileNumber_Active_idx    INDEX     �   CREATE UNIQUE INDEX "DriverUser_MobileNumber_Active_idx" ON dbo."DriverUser" USING btree ("MobileNumber", "Active") WITH (deduplicate_items='false') WHERE ("Active" = true);
 5   DROP INDEX dbo."DriverUser_MobileNumber_Active_idx";
       dbo            postgres    false    247    247    247            V           1259    56354    DriverUser_UserId_idx    INDEX     y   CREATE UNIQUE INDEX "DriverUser_UserId_idx" ON dbo."DriverUser" USING btree ("UserId") WITH (deduplicate_items='false');
 (   DROP INDEX dbo."DriverUser_UserId_idx";
       dbo            postgres    false    247            o           2606    55225 /   ProductCategory ProductCategory_CategoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."ProductCategory"
    ADD CONSTRAINT "ProductCategory_CategoryId_fkey" FOREIGN KEY ("CategoryId") REFERENCES dbo."Category"("CategoryId");
 Z   ALTER TABLE ONLY dbo."ProductCategory" DROP CONSTRAINT "ProductCategory_CategoryId_fkey";
       dbo          postgres    false    253    251    4958            p           2606    55220 .   ProductCategory ProductCategory_ProductId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."ProductCategory"
    ADD CONSTRAINT "ProductCategory_ProductId_fkey" FOREIGN KEY ("ProductId") REFERENCES dbo."Product"("ProductId");
 Y   ALTER TABLE ONLY dbo."ProductCategory" DROP CONSTRAINT "ProductCategory_ProductId_fkey";
       dbo          postgres    false    253    4917    223            l           2606    55194    BranchUser fk_BranchUser_Branch    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."BranchUser"
    ADD CONSTRAINT "fk_BranchUser_Branch" FOREIGN KEY ("BranchId") REFERENCES dbo."Branch"("BranchId") NOT VALID;
 J   ALTER TABLE ONLY dbo."BranchUser" DROP CONSTRAINT "fk_BranchUser_Branch";
       dbo          postgres    false    245    4942    243            m           2606    55199    BranchUser fk_BranchUser_User    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."BranchUser"
    ADD CONSTRAINT "fk_BranchUser_User" FOREIGN KEY ("UserId") REFERENCES dbo."User"("UserId") NOT VALID;
 H   ALTER TABLE ONLY dbo."BranchUser" DROP CONSTRAINT "fk_BranchUser_User";
       dbo          postgres    false    245    235    4929            h           2606    56257 #   CorporateUser fk_CorporateUser_User    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."CorporateUser"
    ADD CONSTRAINT "fk_CorporateUser_User" FOREIGN KEY ("UserId") REFERENCES dbo."User"("UserId") NOT VALID;
 N   ALTER TABLE ONLY dbo."CorporateUser" DROP CONSTRAINT "fk_CorporateUser_User";
       dbo          postgres    false    235    221    4929            k           2606    55926 /   CustomerAddress fk_CustomerAddress_CustomerUser    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."CustomerAddress"
    ADD CONSTRAINT "fk_CustomerAddress_CustomerUser" FOREIGN KEY ("CustomerUserId") REFERENCES dbo."CustomerUser"("CustomerUserId") NOT VALID;
 Z   ALTER TABLE ONLY dbo."CustomerAddress" DROP CONSTRAINT "fk_CustomerAddress_CustomerUser";
       dbo          postgres    false    236    241    4934            j           2606    55151 !   CustomerUser fk_CustomerUser_User    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."CustomerUser"
    ADD CONSTRAINT "fk_CustomerUser_User" FOREIGN KEY ("UserId") REFERENCES dbo."User"("UserId") NOT VALID;
 L   ALTER TABLE ONLY dbo."CustomerUser" DROP CONSTRAINT "fk_CustomerUser_User";
       dbo          postgres    false    4929    236    235            n           2606    55158    DriverUser fk_DriverUser_User    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."DriverUser"
    ADD CONSTRAINT "fk_DriverUser_User" FOREIGN KEY ("UserId") REFERENCES dbo."User"("UserId") NOT VALID;
 H   ALTER TABLE ONLY dbo."DriverUser" DROP CONSTRAINT "fk_DriverUser_User";
       dbo          postgres    false    247    235    4929            g           2606    55251 #   UserAuthLog fk_UserAuthLog_UserAuth    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."UserAuthLog"
    ADD CONSTRAINT "fk_UserAuthLog_UserAuth" FOREIGN KEY ("UserAuthId") REFERENCES dbo."UserAuth"("UserAuthId") NOT VALID;
 N   ALTER TABLE ONLY dbo."UserAuthLog" DROP CONSTRAINT "fk_UserAuthLog_UserAuth";
       dbo          postgres    false    4962    255    219            r           2606    55608 -   UserAuthTokenLog fk_UserAuthTokenLog_UserAuth    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."UserAuthTokenLog"
    ADD CONSTRAINT "fk_UserAuthTokenLog_UserAuth" FOREIGN KEY ("UserAuthId") REFERENCES dbo."UserAuth"("UserAuthId");
 X   ALTER TABLE ONLY dbo."UserAuthTokenLog" DROP CONSTRAINT "fk_UserAuthTokenLog_UserAuth";
       dbo          postgres    false    255    4962    257            q           2606    55245    UserAuth fk_UserAuthUser_User    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."UserAuth"
    ADD CONSTRAINT "fk_UserAuthUser_User" FOREIGN KEY ("UserId") REFERENCES dbo."User"("UserId");
 H   ALTER TABLE ONLY dbo."UserAuth" DROP CONSTRAINT "fk_UserAuthUser_User";
       dbo          postgres    false    235    4929    255            i           2606    58776    User fk_User_Access    FK CONSTRAINT     �   ALTER TABLE ONLY dbo."User"
    ADD CONSTRAINT "fk_User_Access" FOREIGN KEY ("AccessId") REFERENCES dbo."Access"("AccessId") NOT VALID;
 >   ALTER TABLE ONLY dbo."User" DROP CONSTRAINT "fk_User_Access";
       dbo          postgres    false    4966    235    259            -   �   x��ӱn1���QfT��lPT�H���w����B�w't�����:��'��=�r��T����5�j�C��&�R���&S��F��c�\Yq����2�wfF(<k�kn��Z�8dІ��Ů��J�S?eNh�}gA: Ł�*���.6��c
iJ�J!�������
�m���	��5���[�I(�Rq� 6�f�"��#��Hu� I<�|�{�����/f�yB\��         X   x�3��I,(aNG?wW��� Ϩ(G�(�Q\R����㇎�k9�M����D��P��D��������H������\�����+F��� �i!�            x������ � �         \   x�3�4�4�t�sw�	����r�L*J�K�0��鹉�z�����F�F�i�FF&�����&
�V��V�z��&����1~�%\1z\\\ AU�            x������ � �      %   }   x�3�L*�4,I�N5�t*�T0T ��8�~�>���QQ��1~ dd`d�khD
�V�V�&z&f�&��� i\��1����d����1�l��mj	4����d6����������� 8RIX         �   x�U̽
�0@���)ܥ!��&4��AD�"����Z�`���?���.�3}�������u�5MO��6��!'@�l,�"�+�b�썑�sn�j�[(P�^�C�_y�eĿm�)N�G"Mz���k�������>|/�oDa.            x������ � �         y   x�3�4�t�sw�	����r�t-*����J��,J����T�`D����!=713G/9?������������S�̘����D��P��T��������H������X��dR	���\1z\\\ �v#3      !      x������ � �            x������ � �            x������ � �      #      x������ � �      	      x������ � �            x������ � �      '      x������ � �            x������ � �            x������ � �      
      x������ � �         �   x��˱
� �Y�"{�x�i�m�Z&]�П��ӎ�Pg>smKmi�"�k�����ImhFР���9�c�D/��i�|��l�`}�����X[0��wb~�[}������gm�"��^dWR�Q�9�      )   i  x�e�MS�0��u�+\tw�4/$@X�1�V�
�`�q�����,"��gƅ����^�<&2Qx�\��	��ںj�1�����T������PG���P+P��Ċ���z����B5��k:�$�;-����Azp�0,���-�q��G�sº��F��U��I[����dا�h�����nU�ݺ���#M���>�����o�v���)��> 8�r����k/��Y��S���e��\�L�f�d�(t����L����5����ڑ?x�R�2�9X��o�!v泶/�V��N�A�nx��ߛ��v�$�ͦW칍q�Ŝ��0Yݥ������4g�Du�qw®���r��)�|�+�F��w��         4  x��[��Hş�O��L�bgB��<)�f"rb"�(W��ç��z7v�ꈙ���6z+,� I��N�����wMV��O|��m����nC�����Ҿ	���`�//	'���u;���i2�����2+���D��綔vU�	�b�_mk�^�5y��F^X�"B�6@}��<�� ��˯�e6�,Ϙ���Y�$ɖu?��7 �<��3-/I���eF�kN�A�iGm;�#I�b�p%]�Ћ��R���AŘ;P4-w�2�{�	��v>ײ����b��=�T���]�Ȋ��x����5�Dv��˨����[�ly�}�V�Lr���pz�>��<d��m���~O��+�d��	B�T�%}xչ!ڡ�ۊ��]]���t���ڽ�03#�9�7l;,��#�ݿ8��ڰ��5^�N7�p{��G�/�ܫ�f<�H��' �;�؊ͬ�1��د��$k|�>�ux���߱����
%,�H`�z�3+�M���v�.X	|G��a�(E�gS��Z�K�v�~�#�&}]��Ҍ��(��s����Z�ﮭk�n��%,ʷ��=R�[;�H@P�p��5����8a5�2K<�вk��@��H�o�� ����S&������^�MĎ�؋Y��7���c`O�1?���-2��&'{F�v��懫�5wk��>j�� �҄����8�Y��}偝�Du�7���?5H�S����Ð4qF�aJr��m(�ef���7d4����,���c"B��6;p��Z�Oۋ=4��8�Q�,���3fZ���AɎ���oqς>��a���,?�J�����9�(t��t�Q�P��jpn7����Wx$7@[y�Eyr�:?\�1�t�/�O�C����h\ī�A08��u���g�����9�K&�Γ#�&�z
�{}��� �>�>���E�}:yiR�s�tuN,rs�%���'��Z��TI&OKN����U�[�p���}���Q���\5Y�[�+l��(��~rH�e!vS5.�R��}�@�:@����gD��#̾G�`q��,�:��(򚚦0f��[X�d�]%E�������UᛢO�AC�G��+�ա��d��y����R1oj�<'L~hU����E��P����}H�G}�uz�����@��1�إ��P��.�D,\�+�K�����������'?/�;�Ė�w�Qt
<\cO�י(���=�΍��>=^�e�x�����5
��(�::K�q�.e�?n�j~Nd���j?\���
D7����x�P�G�K��䦞��\I}�Z�[����������Y�W�rZ�ͥ٨�*њVڹ���J�e[]��c��z��>�,���AG� �ߡO ��τ=���60=H�O@��R��@��ǣ͕"Z������!��]c�����)�t�7� ��:����Ȱ���t��Al�bGb��ƪ��/��rȈ3�+<i�7��=���^C���|��#L����ՠٽ�B��;T�����4��w��ƨ���ϩ�4ѕ�?>E�U���6�q��zsR�W�
w���ֳ�n����Z�����ې�s4�ċ��{�ϋ\��(�1C%!]�W(b���+��$���;���П��qc�t����`���@�itҩ�4(Ŝfx��kO�Nr��kף�g	�r7�%7,��P*'=r�������˽�K�y4���ϳy���<ME��$8<n6�Oq�z&F2nF$H}�<�� }�jt�q��ԕ=H�*��@N%���� ��d�|s�&���鍌��ɭ�2D��YF�Dh2r����>/v�nW�Є���]�q/�j��;;I��>�����Gd�\G�0��8u�Kڈ^�CW�[jM�?	�>5kO5�c�c��U�̮�,�	��19r�4;�����5�M`Z���j�}s�C</¿.	�b���ѣ<��Ї��r���!_�> �G�w�P�����$\����[��Lf�+:����"���s�${��!�}�ܻ�j�ѻo&�p��1r�yɻ;�����f����"��U6.Z�vZ��oO��      +   ]  x��Yo�H��s~�/����f���P`���A-Y/�6��~�I�t��Q'M4���E!?���x �ZO"5N�T��F8ն���bI㵼{�.t�Ni\*���!��US�>�p��/�3��$=�����{�Tr-[�.T̞��<o?ƥ@O}�����-�<򋽩�~�J|�^��"�=��� �$}���P�+�������Ia��-�V�eUwaӘ���.Q^��O���P!:�.T5
���|X�����`Zc�
i�{��ө�Pd�	7�D!�m�<�| �F�@��,��BGs��S؆'��&����m�w����n�J������(Iжh�f� �ۢ�G�z�w5���&#̓��~�.^�X�#{򤅡���C��冶�a�$T*�5~�P���\E4��\Y�$	V�z�[)��V�� A�^�|p3Kq�Op�d�V+�dF�"'n��6X��<���x�����A�G�*ܭNߴG���2�F��x�j��Ăx�u�`Ał���d��!㯕؉O7$fp��/�L��J�����Oz�]?�q)^Ȯ`���|�r"1�ȁK�_j��!�/��@�oHL��5k��T����N�'u�w�bX���`���p�2���$�b,|�1w���Pb�6䘽���
7��ٖ�ja	��>d�j�{���Ԟ$U�̇"�	�R�ApK��#�}�z�_k��!௔�Bْ1�K�]e1K$f���P�Su��~	��hT>��#3�o��$��:+�R~S���I��;d���HF���9��P�f��X�[�X���4��Z��"Y�f�)	;]��W�[a�G��z�}p���8�^J1O$��Yݲ�z��b��y;�~�p}���-oBCɇ�M�o1f>�X�C���AG����.�r�,1v��,q(ǻ�G5���Ɇ~P_K�pv��I�~��3���w^��in�䪼�|㸚@'خ���ϡ�F�������% �j�;$�	��t�jDj�kn�Ų{B��4���e(S���B�+Qze1@Np#4zŁڇIY7�f�ڪD�Ky �Ce'�p(��k���f?}2�Y��!Xc$/�D�5供-lS$�j��Y��#�BG$�a�3D���t�q�N|�И &_b�:<?��i���� '�M�ݡS�a����4��0���9�4���tD�U�Z�"�Z�0���g[�ȞueD:,�=�&1�&l�\�]r!���h4��4�9g�eG���C�ƃ]L=�`mf9�@?.�;�{v�h�,Lm�����lz7o�7!3���}�����W��bO��M�D�L��"_�"��"�:��#�T��i��-O��L��"����V^Ȧg�Ş�����C=�!1,����0dxBc�S�;T9=�Wkz����繾�[��m�xЈ����g� ��ă��h��h�;�s��=2�]��@O�Vߏ|hݤE1��u��/~�����v��C��"���u��_[bUs��w��v���p��o�"��-u��_[R�Y���!8����b�I߆<�b����L�a�� �������џ��䐓_�#���aHڌ�>+�Zj�)��x��fi���XXvٹh���M֌p��^k��8(�ׯ���·�
�4����0؅��#�V��F�H��BDb�����"=eMz�쪭�Lg�e:���ո!�`�����hTv��f{����{lL}�57�7��,�㫶�;G=�k���|�q��;�����P���>�|�2$y�K�H����o%/Q�i�%I�-F@r�\%�,8'�sR��-�eç��-�p�yk�L����������j�n<��	��g��;��zs�����4>?�+�~>��B��W�+P�Ϻ:(*[����	�� K�ށ�N������K�ô�;���z�y�8��}C��3ll��iCݭxwt�b�x��-���lß�}��Y�̝�B�����oو�&��D�xެ�P�b�p��Ii�:�Ia{�6}F]qؖ�����>��R��j���9��� ��y ܸћ��m�n�e6I��S��C^kg�[�F�&@%x.�4)S���+�����V�(�?:߾}�Ys�     