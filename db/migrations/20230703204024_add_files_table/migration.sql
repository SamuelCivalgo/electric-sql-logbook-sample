-- CreateTable
CREATE TABLE "files" (
    "id" TEXT NOT NULL,
    "description" TEXT,
    "location_label" TEXT,
    "location_latitude" DOUBLE PRECISION,
    "location_longitude" DOUBLE PRECISION,
    "name" TEXT,
    "path_high_res" TEXT,
    "path_low_res" TEXT,
    "properties" TEXT,
    "type" TEXT,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "files_pkey" PRIMARY KEY ("id")
);
