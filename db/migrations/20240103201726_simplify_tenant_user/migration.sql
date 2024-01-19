/*
  Warnings:

  - You are about to drop the `tenant_test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tenant_user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DailyLog" DROP CONSTRAINT "DailyLog_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "Feedback" DROP CONSTRAINT "Feedback_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "File" DROP CONSTRAINT "File_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "FileProperty" DROP CONSTRAINT "FileProperty_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "FilePropertyValue" DROP CONSTRAINT "FilePropertyValue_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "Image" DROP CONSTRAINT "Image_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "LocationEntry" DROP CONSTRAINT "LocationEntry_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "ProjectProperty" DROP CONSTRAINT "ProjectProperty_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "ProjectPropertyValue" DROP CONSTRAINT "ProjectPropertyValue_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "TaskProperty" DROP CONSTRAINT "TaskProperty_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "TaskPropertyValue" DROP CONSTRAINT "TaskPropertyValue_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "TaskStatus" DROP CONSTRAINT "TaskStatus_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "api_key" DROP CONSTRAINT "api_key_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property" DROP CONSTRAINT "equipment_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "tenant_test" DROP CONSTRAINT "tenant_test_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "tenant_user" DROP CONSTRAINT "tenant_user_created_by_fkey";

-- DropForeignKey
ALTER TABLE "tenant_user" DROP CONSTRAINT "tenant_user_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "tenant_user" DROP CONSTRAINT "tenant_user_user_id_fkey";

-- DropForeignKey
ALTER TABLE "time_block" DROP CONSTRAINT "time_block_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_current_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_tenant_id_fkey";

-- DropTable
DROP TABLE "tenant_test";

-- DropTable
DROP TABLE "tenant_user";

-- CreateTable
CREATE TABLE "Tenant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "settings" JSONB NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,

    CONSTRAINT "Tenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tenant_user_test" (
    "id" TEXT NOT NULL,
    "userRole" TEXT NOT NULL,
    "inviteEmail" TEXT,
    "inviteSentAt" TIMESTAMPTZ,
    "inviteStatus" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "userId" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "tenant_user_test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileProperty" ADD CONSTRAINT "FileProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProperty" ADD CONSTRAINT "ProjectProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskProperty" ADD CONSTRAINT "TaskProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskPropertyValue" ADD CONSTRAINT "TaskPropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskStatus" ADD CONSTRAINT "TaskStatus_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tenant" ADD CONSTRAINT "Tenant_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user_test" ADD CONSTRAINT "tenant_user_test_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user_test" ADD CONSTRAINT "tenant_user_test_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user_test" ADD CONSTRAINT "tenant_user_test_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block" ADD CONSTRAINT "time_block_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_current_tenant_id_fkey" FOREIGN KEY ("current_tenant_id") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "api_key" ADD CONSTRAINT "api_key_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property" ADD CONSTRAINT "equipment_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property_value" ADD CONSTRAINT "equipment_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
