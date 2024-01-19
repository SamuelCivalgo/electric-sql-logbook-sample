/*
  Warnings:

  - The `type` column on the `file` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `system_status_id` column on the `task` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `invite_status` column on the `tenant_user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `preferred_language` column on the `user` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `status` on the `daily_log` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `item_type` on the `daily_log_item` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "DailyLogStatus" AS ENUM ('inProgress', 'waitingReview', 'validated', 'editing');

-- CreateEnum
CREATE TYPE "DailyLogItemType" AS ENUM ('task', 'break', 'travel');

-- CreateEnum
CREATE TYPE "BadgeType" AS ENUM ('Expense', 'Blueprint', 'Defect', 'Progress', 'Picture');

-- CreateEnum
CREATE TYPE "TaskSystemStatusId" AS ENUM ('noStatus', 'completed', 'canceled');

-- CreateEnum
CREATE TYPE "InviteStatus" AS ENUM ('pending', 'accepted', 'rejected');

-- CreateEnum
CREATE TYPE "Locales" AS ENUM ('en', 'fr');

-- AlterTable
ALTER TABLE "daily_log" ADD COLUMN "status_temp" "DailyLogStatus";
UPDATE "daily_log" SET "status_temp" = "status"::text::"DailyLogStatus";
ALTER TABLE "daily_log" DROP COLUMN "status";
ALTER TABLE "daily_log" RENAME COLUMN "status_temp" TO "status";
ALTER TABLE "daily_log" ALTER COLUMN "status" SET NOT NULL;

-- AlterTable
ALTER TABLE "daily_log_item" DROP COLUMN "item_type",
ADD COLUMN     "item_type" "DailyLogItemType" NOT NULL;

-- AlterTable
ALTER TABLE "file" DROP COLUMN "type",
ADD COLUMN     "type" "BadgeType";

-- AlterTable
ALTER TABLE "task" DROP COLUMN "system_status_id",
ADD COLUMN     "system_status_id" "TaskSystemStatusId";

-- AlterTable
ALTER TABLE "tenant_user" DROP COLUMN "invite_status",
ADD COLUMN     "invite_status" "InviteStatus";

-- AlterTable
ALTER TABLE "user" DROP COLUMN "preferred_language",
ADD COLUMN     "preferred_language" "Locales";
