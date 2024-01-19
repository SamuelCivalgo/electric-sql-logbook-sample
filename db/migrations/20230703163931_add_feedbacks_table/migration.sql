-- CreateTable
CREATE TABLE "feedbacks" (
    "id" TEXT NOT NULL,
    "text" TEXT,
    "user_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "feedbacks_pkey" PRIMARY KEY ("id")
);
