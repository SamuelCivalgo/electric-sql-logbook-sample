/*
  Warnings:

  - You are about to drop the column `archived_at` on the `feedback` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `feedback` table. All the data in the column will be lost.
  - You are about to drop the column `created_by` on the `feedback` table. All the data in the column will be lost.
  - You are about to drop the column `deleted_at` on the `feedback` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `feedback` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `feedback` table. All the data in the column will be lost.
  - You are about to drop the column `tenant_id` on the `feedback` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `feedback` table. All the data in the column will be lost.
  - You are about to drop the `daily_log_item` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `createdAt` to the `feedback` table without a default value. This is not possible if the table is not empty.
  - Added the required column `serverCreatedAt` to the `feedback` table without a default value. This is not possible if the table is not empty.
  - Added the required column `serverUpdatedAt` to the `feedback` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tenantId` to the `feedback` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `feedback` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "daily_log_item" DROP CONSTRAINT "daily_log_item_created_by_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item" DROP CONSTRAINT "daily_log_item_daily_log_id_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item" DROP CONSTRAINT "daily_log_item_equipment_id_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item" DROP CONSTRAINT "daily_log_item_task_id_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item" DROP CONSTRAINT "daily_log_item_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "feedback" DROP CONSTRAINT "feedback_created_by_fkey";

-- DropForeignKey
ALTER TABLE "feedback" DROP CONSTRAINT "feedback_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "time_block" DROP CONSTRAINT "time_block_daily_log_item_id_fkey";

-- DropIndex
DROP INDEX "feedback_deleted_at_idx";

-- DropIndex
DROP INDEX "feedback_server_created_at_idx";

-- DropIndex
DROP INDEX "feedback_server_updated_at_idx";

-- DropIndex
DROP INDEX "feedback_tenant_id_idx";

-- AlterTable
ALTER TABLE "feedback" DROP COLUMN "archived_at",
DROP COLUMN "created_at",
DROP COLUMN "created_by",
DROP COLUMN "deleted_at",
DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at",
DROP COLUMN "tenant_id",
DROP COLUMN "updated_at",
ADD COLUMN     "archivedAt" TIMESTAMPTZ,
ADD COLUMN     "createdAt" TIMESTAMPTZ NOT NULL,
ADD COLUMN     "createdBy" TEXT,
ADD COLUMN     "deletedAt" TIMESTAMPTZ,
ADD COLUMN     "serverCreatedAt" TIMESTAMPTZ NOT NULL,
ADD COLUMN     "serverUpdatedAt" TIMESTAMPTZ NOT NULL,
ADD COLUMN     "tenantId" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMPTZ NOT NULL;

-- DropTable
DROP TABLE "daily_log_item";

-- CreateTable
CREATE TABLE "daily_log_item_test" (
    "id" TEXT NOT NULL,
    "note" TEXT,
    "isNoteVisible" BOOLEAN,
    "itemType" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "serverCreatedAt" TIMESTAMPTZ NOT NULL,
    "serverUpdatedAt" TIMESTAMPTZ NOT NULL,
    "createdBy" TEXT,
    "taskId" TEXT,
    "dailyLogId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "equipmentId" TEXT,

    CONSTRAINT "daily_log_item_test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "daily_log_item_test" ADD CONSTRAINT "daily_log_item_test_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item_test" ADD CONSTRAINT "daily_log_item_test_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item_test" ADD CONSTRAINT "daily_log_item_test_dailyLogId_fkey" FOREIGN KEY ("dailyLogId") REFERENCES "daily_log_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item_test" ADD CONSTRAINT "daily_log_item_test_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item_test" ADD CONSTRAINT "daily_log_item_test_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedback" ADD CONSTRAINT "feedback_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedback" ADD CONSTRAINT "feedback_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block" ADD CONSTRAINT "time_block_daily_log_item_id_fkey" FOREIGN KEY ("daily_log_item_id") REFERENCES "daily_log_item_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
