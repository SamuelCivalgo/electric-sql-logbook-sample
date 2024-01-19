/*
  Warnings:

  - You are about to drop the `tenants` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_created_by_fkey";

-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_user_id_fkey";

-- DropForeignKey
ALTER TABLE "dailyLogItems" DROP CONSTRAINT "dailyLogItems_created_by_fkey";

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
ALTER TABLE "filePropertyValues" DROP CONSTRAINT "filePropertyValues_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "files" DROP CONSTRAINT "files_created_by_fkey";

-- DropForeignKey
ALTER TABLE "files" DROP CONSTRAINT "files_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "locationEntries" DROP CONSTRAINT "locationEntries_created_by_fkey";

-- DropForeignKey
ALTER TABLE "locationEntries" DROP CONSTRAINT "locationEntries_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "projectProperties" DROP CONSTRAINT "projectProperties_created_by_fkey";

-- DropForeignKey
ALTER TABLE "projectProperties" DROP CONSTRAINT "projectProperties_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "projectPropertyValues" DROP CONSTRAINT "projectPropertyValues_created_by_fkey";

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
ALTER TABLE "tasks" DROP CONSTRAINT "tasks_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "tenants" DROP CONSTRAINT "tenants_created_by_fkey";

-- DropForeignKey
ALTER TABLE "tenants" DROP CONSTRAINT "tenants_owner_id_fkey";

-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_current_tenant_id_fkey";

-- DropTable
DROP TABLE "tenants";

-- DropTable
DROP TABLE "users";

-- CreateTable
CREATE TABLE "Tenant" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "owner_id" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Tenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "imagePath" TEXT,
    "imageUrl" TEXT,
    "name" TEXT,
    "preferredLanguage" TEXT,
    "current_tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "dailyLogs" ADD CONSTRAINT "dailyLogs_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dailyLogs" ADD CONSTRAINT "dailyLogs_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dailyLogItems" ADD CONSTRAINT "dailyLogItems_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dailyLogItems" ADD CONSTRAINT "dailyLogItems_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedbacks" ADD CONSTRAINT "feedbacks_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedbacks" ADD CONSTRAINT "feedbacks_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "files" ADD CONSTRAINT "files_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "files" ADD CONSTRAINT "files_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fileProperties" ADD CONSTRAINT "fileProperties_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fileProperties" ADD CONSTRAINT "fileProperties_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "filePropertyValues" ADD CONSTRAINT "filePropertyValues_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "filePropertyValues" ADD CONSTRAINT "filePropertyValues_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "locationEntries" ADD CONSTRAINT "locationEntries_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "locationEntries" ADD CONSTRAINT "locationEntries_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projectProperties" ADD CONSTRAINT "projectProperties_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projectProperties" ADD CONSTRAINT "projectProperties_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projectPropertyValues" ADD CONSTRAINT "projectPropertyValues_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projectPropertyValues" ADD CONSTRAINT "projectPropertyValues_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tenant" ADD CONSTRAINT "Tenant_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tenant" ADD CONSTRAINT "Tenant_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_current_tenant_id_fkey" FOREIGN KEY ("current_tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tasks" ADD CONSTRAINT "tasks_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tasks" ADD CONSTRAINT "tasks_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "taskProperties" ADD CONSTRAINT "taskProperties_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "taskProperties" ADD CONSTRAINT "taskProperties_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "taskStatus" ADD CONSTRAINT "taskStatus_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "taskStatus" ADD CONSTRAINT "taskStatus_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
