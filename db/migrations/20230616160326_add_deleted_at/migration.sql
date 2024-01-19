/*
  Warnings:

  - You are about to drop the column `created_at` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `projects` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "projects" DROP COLUMN "created_at",
DROP COLUMN "updated_at",
ADD COLUMN     "createdA" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deletedAt" TIMESTAMP(3),
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
