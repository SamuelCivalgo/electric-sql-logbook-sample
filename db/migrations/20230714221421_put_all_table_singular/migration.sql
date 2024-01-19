/*
  Warnings:

  - You are about to drop the `dailyLogItems` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `dailyLogs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `feedbacks` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `fileProperties` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `filePropertyValues` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `files` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `locationEntries` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `projectProperties` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `projectPropertyValues` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `projects` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `taskProperties` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `taskStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tasks` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "dailyLogItems" DROP CONSTRAINT "dailyLogItems_created_by_fkey";

-- DropForeignKey
ALTER TABLE "dailyLogItems" DROP CONSTRAINT "dailyLogItems_dailyLog_id_fkey";

-- DropForeignKey
ALTER TABLE "dailyLogItems" DROP CONSTRAINT "dailyLogItems_task_id_fkey";

-- DropForeignKey
ALTER TABLE "dailyLogItems" DROP CONSTRAINT "dailyLogItems_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "dailyLogs" DROP CONSTRAINT "dailyLogs_created_by_fkey";

-- DropForeignKey
ALTER TABLE "dailyLogs" DROP CONSTRAINT "dailyLogs_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "feedbacks" DROP CONSTRAINT "feedbacks_created_by_fkey";

-- DropForeignKey
ALTER TABLE "feedbacks" DROP CONSTRAINT "feedbacks_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "fileProperties" DROP CONSTRAINT "fileProperties_created_by_fkey";

-- DropForeignKey
ALTER TABLE "fileProperties" DROP CONSTRAINT "fileProperties_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "filePropertyValues" DROP CONSTRAINT "filePropertyValues_created_by_fkey";

-- DropForeignKey
ALTER TABLE "filePropertyValues" DROP CONSTRAINT "filePropertyValues_file_id_fkey";

-- DropForeignKey
ALTER TABLE "filePropertyValues" DROP CONSTRAINT "filePropertyValues_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "files" DROP CONSTRAINT "files_created_by_fkey";

-- DropForeignKey
ALTER TABLE "files" DROP CONSTRAINT "files_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "locationEntries" DROP CONSTRAINT "locationEntries_created_by_fkey";

-- DropForeignKey
ALTER TABLE "locationEntries" DROP CONSTRAINT "locationEntries_dailyLog_id_fkey";

-- DropForeignKey
ALTER TABLE "locationEntries" DROP CONSTRAINT "locationEntries_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "projectProperties" DROP CONSTRAINT "projectProperties_created_by_fkey";

-- DropForeignKey
ALTER TABLE "projectProperties" DROP CONSTRAINT "projectProperties_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "projectPropertyValues" DROP CONSTRAINT "projectPropertyValues_created_by_fkey";

-- DropForeignKey
ALTER TABLE "projectPropertyValues" DROP CONSTRAINT "projectPropertyValues_project_id_fkey";

-- DropForeignKey
ALTER TABLE "projectPropertyValues" DROP CONSTRAINT "projectPropertyValues_property_id_fkey";

-- DropForeignKey
ALTER TABLE "projectPropertyValues" DROP CONSTRAINT "projectPropertyValues_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_created_by_fkey";

-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "taskProperties" DROP CONSTRAINT "taskProperties_created_by_fkey";

-- DropForeignKey
ALTER TABLE "taskProperties" DROP CONSTRAINT "taskProperties_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "taskStatus" DROP CONSTRAINT "taskStatus_created_by_fkey";

-- DropForeignKey
ALTER TABLE "taskStatus" DROP CONSTRAINT "taskStatus_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_created_by_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_project_id_fkey";

-- DropForeignKey
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_tenant_id_fkey";

-- DropTable
DROP TABLE "dailyLogItems";

-- DropTable
DROP TABLE "dailyLogs";

-- DropTable
DROP TABLE "feedbacks";

-- DropTable
DROP TABLE "fileProperties";

-- DropTable
DROP TABLE "filePropertyValues";

-- DropTable
DROP TABLE "files";

-- DropTable
DROP TABLE "locationEntries";

-- DropTable
DROP TABLE "projectProperties";

-- DropTable
DROP TABLE "projectPropertyValues";

-- DropTable
DROP TABLE "projects";

-- DropTable
DROP TABLE "taskProperties";

-- DropTable
DROP TABLE "taskStatus";

-- DropTable
DROP TABLE "tasks";

-- CreateTable
CREATE TABLE "DailyLog" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "note" TEXT,
    "status" TEXT NOT NULL,
    "rating" INTEGER,
    "ratingNote" TEXT,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DailyLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DailyLogItem" (
    "id" TEXT NOT NULL,
    "note" TEXT,
    "isNoteVisible" BOOLEAN,
    "itemType" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "task_id" TEXT,
    "dailyLog_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DailyLogItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feedback" (
    "id" TEXT NOT NULL,
    "text" TEXT,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Feedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "File" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "location_label" TEXT,
    "location_latitude" DOUBLE PRECISION,
    "location_longitude" DOUBLE PRECISION,
    "name" TEXT,
    "path_high_res" TEXT,
    "path_low_res" TEXT,
    "type" TEXT,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "File_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FileProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FileProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FilePropertyValue" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "file_id" TEXT NOT NULL,
    "property_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FilePropertyValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LocationEntry" (
    "id" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,
    "dailyLog_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LocationEntry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "dueDate" TIMESTAMP(3),
    "location_label" TEXT,
    "location_latitude" DOUBLE PRECISION,
    "location_longitude" DOUBLE PRECISION,
    "name" TEXT,
    "progress" DOUBLE PRECISION,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ProjectProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectPropertyValue" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "project_id" TEXT NOT NULL,
    "property_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ProjectPropertyValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "name" TEXT,
    "status_id" TEXT,
    "system_status_id" TEXT,
    "project_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TaskProperty" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TaskProperty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TaskStatus" (
    "id" TEXT NOT NULL,
    "displayOrder" INTEGER NOT NULL,
    "iconColor" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "tenant_id" TEXT,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TaskStatus_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLog" ADD CONSTRAINT "DailyLog_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "Task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_dailyLog_id_fkey" FOREIGN KEY ("dailyLog_id") REFERENCES "DailyLog"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyLogItem" ADD CONSTRAINT "DailyLogItem_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feedback" ADD CONSTRAINT "Feedback_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "File" ADD CONSTRAINT "File_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileProperty" ADD CONSTRAINT "FileProperty_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileProperty" ADD CONSTRAINT "FileProperty_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_file_id_fkey" FOREIGN KEY ("file_id") REFERENCES "File"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_property_id_fkey" FOREIGN KEY ("property_id") REFERENCES "FileProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FilePropertyValue" ADD CONSTRAINT "FilePropertyValue_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_dailyLog_id_fkey" FOREIGN KEY ("dailyLog_id") REFERENCES "DailyLog"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocationEntry" ADD CONSTRAINT "LocationEntry_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProperty" ADD CONSTRAINT "ProjectProperty_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectProperty" ADD CONSTRAINT "ProjectProperty_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_property_id_fkey" FOREIGN KEY ("property_id") REFERENCES "ProjectProperty"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValue" ADD CONSTRAINT "ProjectPropertyValue_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskProperty" ADD CONSTRAINT "TaskProperty_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskProperty" ADD CONSTRAINT "TaskProperty_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskStatus" ADD CONSTRAINT "TaskStatus_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TaskStatus" ADD CONSTRAINT "TaskStatus_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
