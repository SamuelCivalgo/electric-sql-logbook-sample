/*
  Warnings:

  - You are about to drop the `status` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "status" DROP CONSTRAINT "status_tenant_id_fkey";

-- DropTable
DROP TABLE "status";

-- CreateTable
CREATE TABLE "taskStatus" (
    "id" TEXT NOT NULL,
    "displayOrder" INTEGER NOT NULL,
    "iconColor" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "taskStatus_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "taskStatus" ADD CONSTRAINT "taskStatus_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenants"("id") ON DELETE SET NULL ON UPDATE CASCADE;
