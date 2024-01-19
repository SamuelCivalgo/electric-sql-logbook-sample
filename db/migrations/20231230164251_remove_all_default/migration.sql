-- AlterTable
ALTER TABLE "task" ALTER COLUMN "system_status_id" DROP DEFAULT;

-- AlterTable
ALTER TABLE "tenant" ALTER COLUMN "settings" DROP DEFAULT;

-- AlterTable
ALTER TABLE "tenant_user" ALTER COLUMN "user_role" DROP DEFAULT;

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "settings" DROP DEFAULT;
