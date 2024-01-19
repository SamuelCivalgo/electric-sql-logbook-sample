/*
  Warnings:

  - You are about to drop the column `path_high_res` on the `file` table. All the data in the column will be lost.
  - You are about to drop the column `path_low_res` on the `file` table. All the data in the column will be lost.
  - Added the required column `image_id` to the `file` table without a default value. This is not possible if the table is not empty.

*/

-- TRUNCATE TABLE FILE (MANUAL MIGRATION)
TRUNCATE TABLE "file" CASCADE;

-- AlterTable
ALTER TABLE "file" DROP COLUMN "path_high_res",
DROP COLUMN "path_low_res",
ADD COLUMN     "image_id" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_image_id_fkey" FOREIGN KEY ("image_id") REFERENCES "image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
