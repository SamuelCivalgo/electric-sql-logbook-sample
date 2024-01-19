/*
  Warnings:

  - Added the required column `created_by` to the `projectProperties` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `projectPropertyValues` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `taskProperties` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `taskStatus` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "projectProperties" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "projectPropertyValues" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "taskProperties" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "taskStatus" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "projectProperties" ADD CONSTRAINT "projectProperties_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projectPropertyValues" ADD CONSTRAINT "projectPropertyValues_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "taskProperties" ADD CONSTRAINT "taskProperties_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "taskStatus" ADD CONSTRAINT "taskStatus_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
