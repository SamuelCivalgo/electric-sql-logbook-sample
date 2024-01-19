/*
  Warnings:

  - Added the required column `created_by` to the `tenantUsers` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "tenantUsers" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "tenantUsers" ADD CONSTRAINT "tenantUsers_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
