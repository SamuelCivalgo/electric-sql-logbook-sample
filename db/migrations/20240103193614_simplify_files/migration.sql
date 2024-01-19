/*
  Warnings:

  - You are about to drop the `daily_log_item_test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `daily_log_test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `feedback` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `file` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "daily_log_item_test" DROP CONSTRAINT "daily_log_item_test_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item_test" DROP CONSTRAINT "daily_log_item_test_dailyLogId_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item_test" DROP CONSTRAINT "daily_log_item_test_equipmentId_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item_test" DROP CONSTRAINT "daily_log_item_test_taskId_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item_test" DROP CONSTRAINT "daily_log_item_test_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_test" DROP CONSTRAINT "daily_log_test_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_test" DROP CONSTRAINT "daily_log_test_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "feedback" DROP CONSTRAINT "feedback_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "feedback" DROP CONSTRAINT "feedback_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "file" DROP CONSTRAINT "file_created_by_fkey";

-- DropForeignKey
ALTER TABLE "file" DROP CONSTRAINT "file_daily_log_id_fkey";

-- DropForeignKey
ALTER TABLE "file" DROP CONSTRAINT "file_image_id_fkey";

-- DropForeignKey
ALTER TABLE "file" DROP CONSTRAINT "file_project_id_fkey";

-- DropForeignKey
ALTER TABLE "file" DROP CONSTRAINT "file_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "file_property_value" DROP CONSTRAINT "file_property_value_file_id_fkey";

-- DropForeignKey
ALTER TABLE "location_entry" DROP CONSTRAINT "location_entry_daily_log_id_fkey";

-- DropForeignKey
ALTER TABLE "time_block" DROP CONSTRAINT "time_block_daily_log_item_id_fkey";

-- DropTable
DROP TABLE "daily_log_item_test";

-- DropTable
DROP TABLE "daily_log_test";

-- DropTable
DROP TABLE "feedback";

-- DropTable
DROP TABLE "file";

-- CreateTable
CREATE TABLE "DailyLog" (
    "id" TEXT NOT NULL,
    "date" DATE,
    "status" TEXT NOT NULL,
    "note" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "ratingNote" TEXT NOT NULL,
    "managerNote" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "DailyLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DailyLogItem" (
    "id" TEXT NOT NULL,
    "note" TEXT,
    "isNoteVisible" BOOLEAN,
    "itemType" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "taskId" TEXT,
    "dailyLogId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "equipmentId" TEXT,

    CONSTRAINT "DailyLogItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feedback" (
    "id" TEXT NOT NULL,
    "text" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "Feedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "file_test" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "locationLabel" TEXT,
    "locationLatitude" DOUBLE PRECISION,
    "locationLongitude" DOUBLE PRECISION,
    "name" TEXT,
    "type" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "imageId" TEXT NOT NULL,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,
    "projectId" TEXT,
    "dailyLogId" TEXT,

    CONSTRAINT "file_test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_dailyLogId_fkey" FOREIGN KEY ("dailyLogId") REFERENCES "DailyLog"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_test" ADD CONSTRAINT "file_test_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_test" ADD CONSTRAINT "file_test_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_test" ADD CONSTRAINT "file_test_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_test" ADD CONSTRAINT "file_test_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "project"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_test" ADD CONSTRAINT "file_test_dailyLogId_fkey" FOREIGN KEY ("dailyLogId") REFERENCES "DailyLog"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property_value" ADD CONSTRAINT "file_property_value_file_id_fkey" FOREIGN KEY ("file_id") REFERENCES "file_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_entry" ADD CONSTRAINT "location_entry_daily_log_id_fkey" FOREIGN KEY ("daily_log_id") REFERENCES "DailyLog"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block" ADD CONSTRAINT "time_block_daily_log_item_id_fkey" FOREIGN KEY ("daily_log_item_id") REFERENCES "DailyLogItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
