/*
  Warnings:

  - The `type` column on the `file` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `system_status_id` column on the `task` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `invite_status` column on the `tenant_user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `user_role` column on the `tenant_user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `preferred_language` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `status` on the `daily_log` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `item_type` on the `daily_log_item` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `entry_type` on the `time_block` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "daily_log" DROP COLUMN "status",
ADD COLUMN     "status" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "daily_log_item" DROP COLUMN "item_type",
ADD COLUMN     "item_type" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "file" DROP COLUMN "type",
ADD COLUMN     "type" TEXT;

-- AlterTable
ALTER TABLE "task" DROP COLUMN "system_status_id",
ADD COLUMN     "system_status_id" TEXT NOT NULL DEFAULT 'noStatus';

-- AlterTable
ALTER TABLE "tenant_user" DROP COLUMN "invite_status",
ADD COLUMN     "invite_status" TEXT,
DROP COLUMN "user_role",
ADD COLUMN     "user_role" TEXT NOT NULL DEFAULT 'member';

-- AlterTable
ALTER TABLE "time_block" DROP COLUMN "entry_type",
ADD COLUMN     "entry_type" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "user" DROP COLUMN "preferred_language",
ADD COLUMN     "preferred_language" TEXT;

-- DropEnum
DROP TYPE "BadgeType";

-- DropEnum
DROP TYPE "DailyLogItemType";

-- DropEnum
DROP TYPE "DailyLogStatus";

-- DropEnum
DROP TYPE "InviteStatus";

-- DropEnum
DROP TYPE "Locales";

-- DropEnum
DROP TYPE "TaskSystemStatusId";

-- DropEnum
DROP TYPE "TimeBlockEntryType";

-- DropEnum
DROP TYPE "UserRole";
