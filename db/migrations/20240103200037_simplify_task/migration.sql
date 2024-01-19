/*
  Warnings:

  - You are about to drop the column `server_created_at` on the `equipment` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `equipment` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `equipment_property` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `equipment_property` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `equipment_property_value` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `equipment_property_value` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `task_property` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `task_property` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `task_property_value` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `task_property_value` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `task_status` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `task_status` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `tenant` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `tenant` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `tenant_user` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `tenant_user` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `time_block` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `time_block` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `server_created_at` on the `user_task` table. All the data in the column will be lost.
  - You are about to drop the column `server_updated_at` on the `user_task` table. All the data in the column will be lost.
  - You are about to drop the `file_property` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `file_property_value` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `file_test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `image` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `location_entry` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `project` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `project_property` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `project_property_value` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `task` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_taskId_fkey";

-- DropForeignKey
ALTER TABLE "file_property" DROP CONSTRAINT "file_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "file_property" DROP CONSTRAINT "file_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "file_property_value" DROP CONSTRAINT "file_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "file_property_value" DROP CONSTRAINT "file_property_value_file_id_fkey";

-- DropForeignKey
ALTER TABLE "file_property_value" DROP CONSTRAINT "file_property_value_property_id_fkey";

-- DropForeignKey
ALTER TABLE "file_property_value" DROP CONSTRAINT "file_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "file_test" DROP CONSTRAINT "file_test_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "file_test" DROP CONSTRAINT "file_test_dailyLogId_fkey";

-- DropForeignKey
ALTER TABLE "file_test" DROP CONSTRAINT "file_test_imageId_fkey";

-- DropForeignKey
ALTER TABLE "file_test" DROP CONSTRAINT "file_test_projectId_fkey";

-- DropForeignKey
ALTER TABLE "file_test" DROP CONSTRAINT "file_test_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "image" DROP CONSTRAINT "image_created_by_fkey";

-- DropForeignKey
ALTER TABLE "image" DROP CONSTRAINT "image_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "location_entry" DROP CONSTRAINT "location_entry_created_by_fkey";

-- DropForeignKey
ALTER TABLE "location_entry" DROP CONSTRAINT "location_entry_daily_log_id_fkey";

-- DropForeignKey
ALTER TABLE "location_entry" DROP CONSTRAINT "location_entry_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "project" DROP CONSTRAINT "project_created_by_fkey";

-- DropForeignKey
ALTER TABLE "project" DROP CONSTRAINT "project_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "project_property" DROP CONSTRAINT "project_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "project_property" DROP CONSTRAINT "project_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "project_property_value" DROP CONSTRAINT "project_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "project_property_value" DROP CONSTRAINT "project_property_value_project_id_fkey";

-- DropForeignKey
ALTER TABLE "project_property_value" DROP CONSTRAINT "project_property_value_project_property_id_fkey";

-- DropForeignKey
ALTER TABLE "project_property_value" DROP CONSTRAINT "project_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task" DROP CONSTRAINT "task_created_by_fkey";

-- DropForeignKey
ALTER TABLE "task" DROP CONSTRAINT "task_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "task" DROP CONSTRAINT "task_project_id_fkey";

-- DropForeignKey
ALTER TABLE "task" DROP CONSTRAINT "task_status_id_fkey";

-- DropForeignKey
ALTER TABLE "task" DROP CONSTRAINT "task_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task_property_value" DROP CONSTRAINT "task_property_value_task_id_fkey";

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_image_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_task_id_fkey";

-- DropIndex
DROP INDEX "task_property_deleted_at_idx";

-- DropIndex
DROP INDEX "task_property_server_created_at_idx";

-- DropIndex
DROP INDEX "task_property_server_updated_at_idx";

-- DropIndex
DROP INDEX "task_property_tenant_id_idx";

-- DropIndex
DROP INDEX "task_property_value_deleted_at_idx";

-- DropIndex
DROP INDEX "task_property_value_server_created_at_idx";

-- DropIndex
DROP INDEX "task_property_value_server_updated_at_idx";

-- DropIndex
DROP INDEX "task_property_value_tenant_id_idx";

-- DropIndex
DROP INDEX "task_status_deleted_at_idx";

-- DropIndex
DROP INDEX "task_status_server_created_at_idx";

-- DropIndex
DROP INDEX "task_status_server_updated_at_idx";

-- DropIndex
DROP INDEX "task_status_tenant_id_idx";

-- DropIndex
DROP INDEX "tenant_deleted_at_idx";

-- DropIndex
DROP INDEX "tenant_server_created_at_idx";

-- DropIndex
DROP INDEX "tenant_server_updated_at_idx";

-- DropIndex
DROP INDEX "tenant_user_deleted_at_idx";

-- DropIndex
DROP INDEX "tenant_user_server_created_at_idx";

-- DropIndex
DROP INDEX "tenant_user_server_updated_at_idx";

-- DropIndex
DROP INDEX "tenant_user_tenant_id_idx";

-- DropIndex
DROP INDEX "tenant_user_tenant_id_invite_email_key";

-- DropIndex
DROP INDEX "time_block_deleted_at_idx";

-- DropIndex
DROP INDEX "time_block_server_created_at_idx";

-- DropIndex
DROP INDEX "time_block_server_updated_at_idx";

-- DropIndex
DROP INDEX "time_block_tenant_id_idx";

-- DropIndex
DROP INDEX "user_current_tenant_id_idx";

-- DropIndex
DROP INDEX "user_deleted_at_idx";

-- DropIndex
DROP INDEX "user_server_created_at_idx";

-- DropIndex
DROP INDEX "user_server_updated_at_idx";

-- DropIndex
DROP INDEX "user_task_deleted_at_idx";

-- DropIndex
DROP INDEX "user_task_server_created_at_idx";

-- DropIndex
DROP INDEX "user_task_server_updated_at_idx";

-- DropIndex
DROP INDEX "user_task_tenant_id_idx";

-- AlterTable
ALTER TABLE "equipment" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "equipment_property" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "equipment_property_value" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "task_property" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "task_property_value" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "task_status" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "tenant" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "tenant_user" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "time_block" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "user" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- AlterTable
ALTER TABLE "user_task" DROP COLUMN "server_created_at",
DROP COLUMN "server_updated_at";

-- DropTable
DROP TABLE "file_property";

-- DropTable
DROP TABLE "file_property_value";

-- DropTable
DROP TABLE "file_test";

-- DropTable
DROP TABLE "image";

-- DropTable
DROP TABLE "location_entry";

-- DropTable
DROP TABLE "project";

-- DropTable
DROP TABLE "project_property";

-- DropTable
DROP TABLE "project_property_value";

-- DropTable
DROP TABLE "task";

-- CreateTable
CREATE TABLE "File" (
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

    CONSTRAINT "File_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FileProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "FileProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FilePropertyValue" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "fileId" TEXT NOT NULL,
    "propertyId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "FilePropertyValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" TEXT NOT NULL,
    "bucketId" TEXT NOT NULL,
    "blurhash" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LocationEntry" (
    "id" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "dailyLogId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "LocationEntry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "progress" DOUBLE PRECISION,
    "dueDate" TIMESTAMPTZ,
    "description" TEXT,
    "locationLabel" TEXT,
    "locationLatitude" DOUBLE PRECISION,
    "locationLongitude" DOUBLE PRECISION,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "ProjectProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectPropertyValue" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "projectId" TEXT NOT NULL,
    "projectPropertyId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "ProjectPropertyValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "task_test" (
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

    CONSTRAINT "task_test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "task_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_dailyLogId_fkey" FOREIGN KEY ("dailyLogId") REFERENCES "DailyLog"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileProperty" ADD CONSTRAINT "FileProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileProperty" ADD CONSTRAINT "FileProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "File"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_propertyId_fkey" FOREIGN KEY ("propertyId") REFERENCES "FileProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_dailyLogId_fkey" FOREIGN KEY ("dailyLogId") REFERENCES "DailyLog"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProperty" ADD CONSTRAINT "ProjectProperty_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProperty" ADD CONSTRAINT "ProjectProperty_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_projectPropertyId_fkey" FOREIGN KEY ("projectPropertyId") REFERENCES "ProjectProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_test" ADD CONSTRAINT "task_test_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_test" ADD CONSTRAINT "task_test_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_test" ADD CONSTRAINT "task_test_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_test" ADD CONSTRAINT "task_test_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "task_test"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_test" ADD CONSTRAINT "task_test_taskStatusId_fkey" FOREIGN KEY ("taskStatusId") REFERENCES "task_status"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property_value" ADD CONSTRAINT "task_property_value_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "task_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_image_id_fkey" FOREIGN KEY ("image_id") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "task_test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
