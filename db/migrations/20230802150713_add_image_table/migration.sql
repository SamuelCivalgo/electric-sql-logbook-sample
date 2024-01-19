/*
  Warnings:

  - You are about to drop the column `image_path` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `image_url` on the `user` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "user" DROP COLUMN "image_path",
DROP COLUMN "image_url",
ADD COLUMN     "image_id" TEXT;

-- CreateTable
CREATE TABLE "image" (
    "id" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "server_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "server_updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "image_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "image" ADD CONSTRAINT "image_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image" ADD CONSTRAINT "image_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_image_id_fkey" FOREIGN KEY ("image_id") REFERENCES "image"("id") ON DELETE SET NULL ON UPDATE CASCADE;
