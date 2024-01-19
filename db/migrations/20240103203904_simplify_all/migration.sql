/*
  Warnings:

  - You are about to drop the `api_key` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `equipment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `equipment_property` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `equipment_property_value` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_task` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_test` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DailyLog" DROP CONSTRAINT "DailyLog_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_equipmentId_fkey";

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
ALTER TABLE "TimeBlock" DROP CONSTRAINT "TimeBlock_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "api_key" DROP CONSTRAINT "api_key_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "api_key" DROP CONSTRAINT "api_key_user_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_created_by_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_userId_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property" DROP CONSTRAINT "equipment_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property" DROP CONSTRAINT "equipment_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_equipment_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_equipment_property_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_created_by_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_task_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_user_id_fkey";

-- DropForeignKey
ALTER TABLE "user_test" DROP CONSTRAINT "user_test_currentTenantId_fkey";

-- DropForeignKey
ALTER TABLE "user_test" DROP CONSTRAINT "user_test_imageId_fkey";

-- DropTable
DROP TABLE "api_key";

-- DropTable
DROP TABLE "equipment";

-- DropTable
DROP TABLE "equipment_property";

-- DropTable
DROP TABLE "equipment_property_value";

-- DropTable
DROP TABLE "user_task";

-- DropTable
DROP TABLE "user_test";

-- CreateTable
CREATE TABLE "User" (
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

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserTask" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "taskId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "UserTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApiKey" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT,

    CONSTRAINT "ApiKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "type" TEXT,
    "organization" TEXT,
    "description" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "archivedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EquipmentProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "archivedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "EquipmentProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EquipmentPropertyValue" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "archivedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),
    "createdBy" TEXT,
    "equipmentId" TEXT NOT NULL,
    "equipmentPropertyId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "EquipmentPropertyValue_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileProperty" ADD CONSTRAINT "FileProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProperty" ADD CONSTRAINT "ProjectProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskProperty" ADD CONSTRAINT "TaskProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskPropertyValue" ADD CONSTRAINT "TaskPropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskStatus" ADD CONSTRAINT "TaskStatus_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tenant" ADD CONSTRAINT "Tenant_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TimeBlock" ADD CONSTRAINT "TimeBlock_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_currentTenantId_fkey" FOREIGN KEY ("currentTenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTask" ADD CONSTRAINT "UserTask_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTask" ADD CONSTRAINT "UserTask_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTask" ADD CONSTRAINT "UserTask_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserTask" ADD CONSTRAINT "UserTask_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApiKey" ADD CONSTRAINT "ApiKey_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApiKey" ADD CONSTRAINT "ApiKey_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentProperty" ADD CONSTRAINT "EquipmentProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentProperty" ADD CONSTRAINT "EquipmentProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentPropertyValue" ADD CONSTRAINT "EquipmentPropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentPropertyValue" ADD CONSTRAINT "EquipmentPropertyValue_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentPropertyValue" ADD CONSTRAINT "EquipmentPropertyValue_equipmentPropertyId_fkey" FOREIGN KEY ("equipmentPropertyId") REFERENCES "EquipmentProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentPropertyValue" ADD CONSTRAINT "EquipmentPropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
