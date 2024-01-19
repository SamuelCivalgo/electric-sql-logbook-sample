/*
  Warnings:

  - You are about to drop the `daily_log` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "daily_log" DROP CONSTRAINT "daily_log_created_by_fkey";

-- DropForeignKey
ALTER TABLE "daily_log" DROP CONSTRAINT "daily_log_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item" DROP CONSTRAINT "daily_log_item_daily_log_id_fkey";

-- DropForeignKey
ALTER TABLE "file" DROP CONSTRAINT "file_daily_log_id_fkey";

-- DropForeignKey
ALTER TABLE "location_entry" DROP CONSTRAINT "location_entry_daily_log_id_fkey";

-- DropTable
DROP TABLE "daily_log";

-- CreateTable
CREATE TABLE "DailyLog" (
    "id" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "status" TEXT NOT NULL,
    "note" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "ratingNote" TEXT NOT NULL,
    "managerNote" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ NOT NULL,
    "deletedAt" TIMESTAMPTZ NOT NULL,
    "serverCreatedAt" TIMESTAMPTZ NOT NULL,
    "serverUpdatedAt" TIMESTAMPTZ NOT NULL,
    "createdBy" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "DailyLog_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item" ADD CONSTRAINT "daily_log_item_daily_log_id_fkey" FOREIGN KEY ("daily_log_id") REFERENCES "DailyLog"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_daily_log_id_fkey" FOREIGN KEY ("daily_log_id") REFERENCES "DailyLog"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_entry" ADD CONSTRAINT "location_entry_daily_log_id_fkey" FOREIGN KEY ("daily_log_id") REFERENCES "DailyLog"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
