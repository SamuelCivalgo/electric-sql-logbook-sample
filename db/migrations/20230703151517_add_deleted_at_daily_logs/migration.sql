-- CreateTable
CREATE TABLE "dailyLogs" (
    "id" TEXT NOT NULL,
    "date" TEXT NOT NULL,
    "note" TEXT,
    "status" TEXT,
    "rating" INTEGER,
    "rating_note" TEXT,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "dailyLogs_pkey" PRIMARY KEY ("id")
);
