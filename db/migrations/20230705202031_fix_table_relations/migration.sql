/*
  Warnings:

  - You are about to drop the column `projectPropertyValuesId` on the `tenants` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "tenants" DROP CONSTRAINT "tenants_projectPropertyValuesId_fkey";

-- AlterTable
ALTER TABLE "projectProperties" ADD COLUMN     "tenant_id" TEXT;

-- AlterTable
ALTER TABLE "projectPropertyValues" ADD COLUMN     "tenant_id" TEXT;

-- AlterTable
ALTER TABLE "tenants" DROP COLUMN "projectPropertyValuesId";

-- AddForeignKey
ALTER TABLE "projectProperties" ADD CONSTRAINT "projectProperties_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenants"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projectPropertyValues" ADD CONSTRAINT "projectPropertyValues_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenants"("id") ON DELETE SET NULL ON UPDATE CASCADE;
