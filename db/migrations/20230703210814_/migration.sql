/*
  Warnings:

  - A unique constraint covering the columns `[owner_id]` on the table `tenants` will be added. If there are existing duplicate values, this will fail.
  - Made the column `owner_id` on table `tenants` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "tenants" ALTER COLUMN "owner_id" SET NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "tenants_owner_id_key" ON "tenants"("owner_id");

-- AddForeignKey
ALTER TABLE "tenants" ADD CONSTRAINT "tenants_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_current_tenant_id_fkey" FOREIGN KEY ("current_tenant_id") REFERENCES "tenants"("id") ON DELETE SET NULL ON UPDATE CASCADE;
