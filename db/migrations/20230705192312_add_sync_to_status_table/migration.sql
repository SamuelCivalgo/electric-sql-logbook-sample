-- AlterTable
ALTER TABLE "tenants" ADD COLUMN     "projectPropertyValuesId" TEXT;

-- CreateTable
CREATE TABLE "projectPropertyValues" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "project_id" TEXT NOT NULL,
    "property_id" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "projectPropertyValues_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "status" (
    "id" TEXT NOT NULL,
    "displayOrder" INTEGER NOT NULL,
    "iconColor" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "status_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "projectPropertyValues" ADD CONSTRAINT "projectPropertyValues_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projectPropertyValues" ADD CONSTRAINT "projectPropertyValues_property_id_fkey" FOREIGN KEY ("property_id") REFERENCES "projectProperties"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "status" ADD CONSTRAINT "status_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenants"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenants" ADD CONSTRAINT "tenants_projectPropertyValuesId_fkey" FOREIGN KEY ("projectPropertyValuesId") REFERENCES "projectPropertyValues"("id") ON DELETE SET NULL ON UPDATE CASCADE;
