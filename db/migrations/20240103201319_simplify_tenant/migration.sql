/*
  Warnings:

  - You are about to drop the `task_property` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `task_property_value` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `task_status` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `task_test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tenant` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DailyLog" DROP CONSTRAINT "DailyLog_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_taskId_fkey";

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
ALTER TABLE "api_key" DROP CONSTRAINT "api_key_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property" DROP CONSTRAINT "equipment_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task_property" DROP CONSTRAINT "task_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "task_property" DROP CONSTRAINT "task_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task_property_value" DROP CONSTRAINT "task_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "task_property_value" DROP CONSTRAINT "task_property_value_task_id_fkey";

-- DropForeignKey
ALTER TABLE "task_property_value" DROP CONSTRAINT "task_property_value_task_property_id_fkey";

-- DropForeignKey
ALTER TABLE "task_property_value" DROP CONSTRAINT "task_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task_status" DROP CONSTRAINT "task_status_created_by_fkey";

-- DropForeignKey
ALTER TABLE "task_status" DROP CONSTRAINT "task_status_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task_test" DROP CONSTRAINT "task_test_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "task_test" DROP CONSTRAINT "task_test_parentId_fkey";

-- DropForeignKey
ALTER TABLE "task_test" DROP CONSTRAINT "task_test_projectId_fkey";

-- DropForeignKey
ALTER TABLE "task_test" DROP CONSTRAINT "task_test_taskStatusId_fkey";

-- DropForeignKey
ALTER TABLE "task_test" DROP CONSTRAINT "task_test_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "tenant" DROP CONSTRAINT "tenant_created_by_fkey";

-- DropForeignKey
ALTER TABLE "tenant_user" DROP CONSTRAINT "tenant_user_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "time_block" DROP CONSTRAINT "time_block_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_current_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_task_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_tenant_id_fkey";

-- DropTable
DROP TABLE "task_property";

-- DropTable
DROP TABLE "task_property_value";

-- DropTable
DROP TABLE "task_status";

-- DropTable
DROP TABLE "task_test";

-- DropTable
DROP TABLE "tenant";

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "name" TEXT,
    "statusId" TEXT,
    "systemStatusId" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "projectId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "parentId" TEXT,
    "taskStatusId" TEXT,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TaskProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "TaskProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TaskPropertyValue" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "taskPropertyId" TEXT NOT NULL,
    "taskId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "TaskPropertyValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TaskStatus" (
    "id" TEXT NOT NULL,
    "displayOrder" INTEGER NOT NULL,
    "iconColor" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "TaskStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tenant_test" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "settings" JSONB NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,

    CONSTRAINT "tenant_test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileProperty" ADD CONSTRAINT "FileProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProperty" ADD CONSTRAINT "ProjectProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_taskStatusId_fkey" FOREIGN KEY ("taskStatusId") REFERENCES "TaskStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskProperty" ADD CONSTRAINT "TaskProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskProperty" ADD CONSTRAINT "TaskProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskPropertyValue" ADD CONSTRAINT "TaskPropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskPropertyValue" ADD CONSTRAINT "TaskPropertyValue_taskPropertyId_fkey" FOREIGN KEY ("taskPropertyId") REFERENCES "TaskProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskPropertyValue" ADD CONSTRAINT "TaskPropertyValue_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskPropertyValue" ADD CONSTRAINT "TaskPropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskStatus" ADD CONSTRAINT "TaskStatus_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskStatus" ADD CONSTRAINT "TaskStatus_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_test" ADD CONSTRAINT "tenant_test_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user" ADD CONSTRAINT "tenant_user_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant_test"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block" ADD CONSTRAINT "time_block_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_current_tenant_id_fkey" FOREIGN KEY ("current_tenant_id") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "Task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "api_key" ADD CONSTRAINT "api_key_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property" ADD CONSTRAINT "equipment_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property_value" ADD CONSTRAINT "equipment_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
