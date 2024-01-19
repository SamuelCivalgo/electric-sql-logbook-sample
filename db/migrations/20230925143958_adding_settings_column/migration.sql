-- AlterTable
ALTER TABLE "tenant" ADD COLUMN     "settings" JSONB NOT NULL DEFAULT '{}';

-- AlterTable
ALTER TABLE "user" ADD COLUMN     "settings" JSONB NOT NULL DEFAULT '{}';
