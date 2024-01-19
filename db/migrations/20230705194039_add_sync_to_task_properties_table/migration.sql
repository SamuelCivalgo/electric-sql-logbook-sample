-- AlterTable
ALTER TABLE "projectProperties" ALTER COLUMN "order" SET DATA TYPE TEXT;

-- CreateTable
CREATE TABLE "taskProperties" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "taskProperties_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "taskProperties" ADD CONSTRAINT "taskProperties_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenants"("id") ON DELETE SET NULL ON UPDATE CASCADE;
