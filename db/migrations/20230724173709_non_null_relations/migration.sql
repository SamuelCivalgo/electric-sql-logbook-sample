/*
  Warnings:

  - Made the column `user_id` on table `TenantUser` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_user_id_fkey";

-- AlterTable
ALTER TABLE "TenantUser" ALTER COLUMN "user_id" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
