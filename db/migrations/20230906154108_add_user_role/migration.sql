-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('admin', 'member');

-- AlterTable
ALTER TABLE "tenant_user" ADD COLUMN     "user_role" "UserRole" NOT NULL DEFAULT 'member';
