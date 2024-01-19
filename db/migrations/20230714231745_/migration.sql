/*
  Warnings:

  - A unique constraint covering the columns `[tenant_id,user_id]` on the table `TenantUser` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[tenant_id,invite_email]` on the table `TenantUser` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "TenantUser" DROP CONSTRAINT "TenantUser_user_id_fkey";

-- AlterTable
ALTER TABLE "TenantUser" ALTER COLUMN "user_id" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "TenantUser_tenant_id_user_id_key" ON "TenantUser"("tenant_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "TenantUser_tenant_id_invite_email_key" ON "TenantUser"("tenant_id", "invite_email");

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
