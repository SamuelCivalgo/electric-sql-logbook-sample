-- AlterTable
ALTER TABLE "project" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;
