/*
  Warnings:

  - You are about to drop the `DailyLog` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DailyLogItem` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Feedback` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `File` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FileProperty` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FilePropertyValue` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `LocationEntry` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Project` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectProperty` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectPropertyValue` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Task` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TaskProperty` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TaskStatus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Tenant` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TenantUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "DailyLog" DROP CONSTRAINT "DailyLog_created_by_fkey";

-- DropForeignKey
ALTER TABLE "DailyLog" DROP CONSTRAINT "DailyLog_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_created_by_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_dailyLog_id_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_task_id_fkey";

-- DropForeignKey
ALTER TABLE "DailyLogItem" DROP CONSTRAINT "DailyLogItem_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "Feedback" DROP CONSTRAINT "Feedback_created_by_fkey";

-- DropForeignKey
ALTER TABLE "Feedback" DROP CONSTRAINT "Feedback_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "File" DROP CONSTRAINT "File_created_by_fkey";

-- DropForeignKey
ALTER TABLE "File" DROP CONSTRAINT "File_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "FileProperty" DROP CONSTRAINT "FileProperty_created_by_fkey";

-- DropForeignKey
ALTER TABLE "FileProperty" DROP CONSTRAINT "FileProperty_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "FilePropertyValue" DROP CONSTRAINT "FilePropertyValue_created_by_fkey";

-- DropForeignKey
ALTER TABLE "FilePropertyValue" DROP CONSTRAINT "FilePropertyValue_file_id_fkey";

-- DropForeignKey
ALTER TABLE "FilePropertyValue" DROP CONSTRAINT "FilePropertyValue_property_id_fkey";

-- DropForeignKey
ALTER TABLE "FilePropertyValue" DROP CONSTRAINT "FilePropertyValue_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "LocationEntry" DROP CONSTRAINT "LocationEntry_created_by_fkey";

-- DropForeignKey
ALTER TABLE "LocationEntry" DROP CONSTRAINT "LocationEntry_dailyLog_id_fkey";

-- DropForeignKey
ALTER TABLE "LocationEntry" DROP CONSTRAINT "LocationEntry_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_created_by_fkey";

-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "ProjectProperty" DROP CONSTRAINT "ProjectProperty_created_by_fkey";

-- DropForeignKey
ALTER TABLE "ProjectProperty" DROP CONSTRAINT "ProjectProperty_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "ProjectPropertyValue" DROP CONSTRAINT "ProjectPropertyValue_created_by_fkey";

-- DropForeignKey
ALTER TABLE "ProjectPropertyValue" DROP CONSTRAINT "ProjectPropertyValue_project_id_fkey";

-- DropForeignKey
ALTER TABLE "ProjectPropertyValue" DROP CONSTRAINT "ProjectPropertyValue_property_id_fkey";

-- DropForeignKey
ALTER TABLE "ProjectPropertyValue" DROP CONSTRAINT "ProjectPropertyValue_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_created_by_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_project_id_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "TaskProperty" DROP CONSTRAINT "TaskProperty_created_by_fkey";

-- DropForeignKey
ALTER TABLE "TaskProperty" DROP CONSTRAINT "TaskProperty_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "TaskStatus" DROP CONSTRAINT "TaskStatus_created_by_fkey";

-- DropForeignKey
ALTER TABLE "TaskStatus" DROP CONSTRAINT "TaskStatus_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "Tenant" DROP CONSTRAINT "Tenant_created_by_fkey";

-- DropForeignKey
ALTER TABLE "Tenant" DROP CONSTRAINT "Tenant_owner_id_fkey";

-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_created_by_fkey";

-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_user_id_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_current_tenant_id_fkey";

-- DropTable
DROP TABLE "DailyLog";

-- DropTable
DROP TABLE "DailyLogItem";

-- DropTable
DROP TABLE "Feedback";

-- DropTable
DROP TABLE "File";

-- DropTable
DROP TABLE "FileProperty";

-- DropTable
DROP TABLE "FilePropertyValue";

-- DropTable
DROP TABLE "LocationEntry";

-- DropTable
DROP TABLE "Project";

-- DropTable
DROP TABLE "ProjectProperty";

-- DropTable
DROP TABLE "ProjectPropertyValue";

-- DropTable
DROP TABLE "Task";

-- DropTable
DROP TABLE "TaskProperty";

-- DropTable
DROP TABLE "TaskStatus";

-- DropTable
DROP TABLE "Tenant";

-- DropTable
DROP TABLE "TenantUser";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "daily_log" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "note" TEXT,
    "status" TEXT NOT NULL,
    "rating" INTEGER,
    "rating_note" TEXT,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "daily_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "daily_log_item" (
    "id" TEXT NOT NULL,
    "note" TEXT,
    "is_note_visible" BOOLEAN,
    "item_type" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "task_id" TEXT,
    "daily_log_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "daily_log_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "feedback" (
    "id" TEXT NOT NULL,
    "text" TEXT,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "feedback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "file" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "location_label" TEXT,
    "location_latitude" DOUBLE PRECISION,
    "location_longitude" DOUBLE PRECISION,
    "name" TEXT,
    "path_high_res" TEXT,
    "path_low_res" TEXT,
    "type" TEXT,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "file_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "file_property" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "file_property_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "file_property_value" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "file_id" TEXT NOT NULL,
    "property_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "file_property_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "location_entry" (
    "id" TEXT NOT NULL,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,
    "created_by" TEXT NOT NULL,
    "daily_log_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "location_entry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "due_date" TIMESTAMP(3),
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

    CONSTRAINT "project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project_property" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "project_property_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "project_property_value" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "project_id" TEXT NOT NULL,
    "project_property_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "project_property_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "task" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "name" TEXT,
    "status_id" TEXT,
    "system_status_id" TEXT,
    "created_by" TEXT NOT NULL,
    "project_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "task_property" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "task_property_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "task_status" (
    "id" TEXT NOT NULL,
    "display_order" INTEGER NOT NULL,
    "icon_color" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "task_status_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tenant" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "created_by" TEXT NOT NULL,
    "owner_id" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tenant_user" (
    "id" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "tenant_id" TEXT NOT NULL,
    "invite_email" TEXT,
    "invite_sent_at" TIMESTAMP(3),
    "invite_status" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tenant_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "image_path" TEXT,
    "image_url" TEXT,
    "name" TEXT,
    "preferred_language" TEXT,
    "current_tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "daily_log" ADD CONSTRAINT "daily_log_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log" ADD CONSTRAINT "daily_log_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item" ADD CONSTRAINT "daily_log_item_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item" ADD CONSTRAINT "daily_log_item_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "task"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item" ADD CONSTRAINT "daily_log_item_daily_log_id_fkey" FOREIGN KEY ("daily_log_id") REFERENCES "daily_log"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item" ADD CONSTRAINT "daily_log_item_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedback" ADD CONSTRAINT "feedback_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedback" ADD CONSTRAINT "feedback_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property" ADD CONSTRAINT "file_property_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property" ADD CONSTRAINT "file_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property_value" ADD CONSTRAINT "file_property_value_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property_value" ADD CONSTRAINT "file_property_value_file_id_fkey" FOREIGN KEY ("file_id") REFERENCES "file"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property_value" ADD CONSTRAINT "file_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property_value" ADD CONSTRAINT "file_property_value_property_id_fkey" FOREIGN KEY ("property_id") REFERENCES "file_property"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_entry" ADD CONSTRAINT "location_entry_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_entry" ADD CONSTRAINT "location_entry_daily_log_id_fkey" FOREIGN KEY ("daily_log_id") REFERENCES "daily_log"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_entry" ADD CONSTRAINT "location_entry_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project" ADD CONSTRAINT "project_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project" ADD CONSTRAINT "project_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property" ADD CONSTRAINT "project_property_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property" ADD CONSTRAINT "project_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property_value" ADD CONSTRAINT "project_property_value_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property_value" ADD CONSTRAINT "project_property_value_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property_value" ADD CONSTRAINT "project_property_value_project_property_id_fkey" FOREIGN KEY ("project_property_id") REFERENCES "project_property"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property_value" ADD CONSTRAINT "project_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property" ADD CONSTRAINT "task_property_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property" ADD CONSTRAINT "task_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_status" ADD CONSTRAINT "task_status_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_status" ADD CONSTRAINT "task_status_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant" ADD CONSTRAINT "tenant_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant" ADD CONSTRAINT "tenant_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user" ADD CONSTRAINT "tenant_user_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user" ADD CONSTRAINT "tenant_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user" ADD CONSTRAINT "tenant_user_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_current_tenant_id_fkey" FOREIGN KEY ("current_tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;
