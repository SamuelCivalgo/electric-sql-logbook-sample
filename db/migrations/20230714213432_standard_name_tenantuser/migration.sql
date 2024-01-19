/*
  Warnings:

  - You are about to drop the `tenantUsers` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "tenantUsers" DROP CONSTRAINT "tenantUsers_created_by_fkey";

-- DropForeignKey
ALTER TABLE "tenantUsers" DROP CONSTRAINT "tenantUsers_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "tenantUsers" DROP CONSTRAINT "tenantUsers_user_id_fkey";

-- DropTable
DROP TABLE "tenantUsers";

-- CreateTable
CREATE TABLE "TenantUser" (
    "id" TEXT NOT NULL,
    "invite_email" TEXT,
    "invite_sent_at" TIMESTAMP(3),
    "invite_status" TEXT,
    "user_id" TEXT NOT NULL,
    "tenant_id" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TenantUser_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenants"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
