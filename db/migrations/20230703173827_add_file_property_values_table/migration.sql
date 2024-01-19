-- CreateTable
CREATE TABLE "filePropertyValues" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "file_id" TEXT NOT NULL,
    "property_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "filePropertyValues_pkey" PRIMARY KEY ("id")
);
