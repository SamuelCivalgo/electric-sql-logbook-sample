/*
  Warnings:

  - You are about to drop the `time_block_test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DailyLog" DROP CONSTRAINT "DailyLog_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "Feedback" DROP CONSTRAINT "Feedback_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "File" DROP CONSTRAINT "File_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "FileProperty" DROP CONSTRAINT "FileProperty_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "FilePropertyValue" DROP CONSTRAINT "FilePropertyValue_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "Image" DROP CONSTRAINT "Image_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "LocationEntry" DROP CONSTRAINT "LocationEntry_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "ProjectProperty" DROP CONSTRAINT "ProjectProperty_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "ProjectPropertyValue" DROP CONSTRAINT "ProjectPropertyValue_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "TaskProperty" DROP CONSTRAINT "TaskProperty_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "TaskPropertyValue" DROP CONSTRAINT "TaskPropertyValue_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "TaskStatus" DROP CONSTRAINT "TaskStatus_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "Tenant" DROP CONSTRAINT "Tenant_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_userId_fkey";

-- DropForeignKey
ALTER TABLE "api_key" DROP CONSTRAINT "api_key_user_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_created_by_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_userId_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property" DROP CONSTRAINT "equipment_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "time_block_test" DROP CONSTRAINT "time_block_test_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "time_block_test" DROP CONSTRAINT "time_block_test_dailyLogItemId_fkey";

-- DropForeignKey
ALTER TABLE "time_block_test" DROP CONSTRAINT "time_block_test_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_current_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_image_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_created_by_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_user_id_fkey";

-- DropTable
DROP TABLE "time_block_test";

-- DropTable
DROP TABLE "user";

-- CreateTable
CREATE TABLE "TimeBlock" (
    "id" TEXT NOT NULL,
    "duration" INTEGER,
    "entryType" TEXT NOT NULL,
    "rangeStartAt" TIMESTAMPTZ,
    "rangeEndAt" TIMESTAMPTZ,
    "timerStartLatitude" DOUBLE PRECISION,
    "timerStartLongitude" DOUBLE PRECISION,
    "timerStartAddress" TEXT,
    "timerStartAt" TIMESTAMPTZ,
    "timerEndAt" TIMESTAMPTZ,
    "timerEndLatitude" DOUBLE PRECISION,
    "timerEndLongitude" DOUBLE PRECISION,
    "timerEndAddress" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT NOT NULL,
    "dailyLogItemId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "TimeBlock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_test" (
    "id" TEXT NOT NULL,
    "email" TEXT,
    "name" TEXT,
    "preferredLanguage" TEXT,
    "settings" JSONB NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "imageId" TEXT,
    "currentTenantId" TEXT NOT NULL,

    CONSTRAINT "user_test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileProperty" ADD CONSTRAINT "FileProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProperty" ADD CONSTRAINT "ProjectProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskProperty" ADD CONSTRAINT "TaskProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskPropertyValue" ADD CONSTRAINT "TaskPropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskStatus" ADD CONSTRAINT "TaskStatus_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tenant" ADD CONSTRAINT "Tenant_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeBlock" ADD CONSTRAINT "TimeBlock_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeBlock" ADD CONSTRAINT "TimeBlock_dailyLogItemId_fkey" FOREIGN KEY ("dailyLogItemId") REFERENCES "DailyLogItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeBlock" ADD CONSTRAINT "TimeBlock_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_test" ADD CONSTRAINT "user_test_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_test" ADD CONSTRAINT "user_test_currentTenantId_fkey" FOREIGN KEY ("currentTenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "api_key" ADD CONSTRAINT "api_key_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property" ADD CONSTRAINT "equipment_property_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property_value" ADD CONSTRAINT "equipment_property_value_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;
