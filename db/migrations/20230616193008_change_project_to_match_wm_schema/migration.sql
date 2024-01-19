/*
  Warnings:

  - You are about to drop the column `archivedAt` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `locationLabel` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `locationLatitude` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `locationLongitude` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `projects` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "projects" DROP COLUMN "archivedAt",
DROP COLUMN "createdAt",
DROP COLUMN "deletedAt",
DROP COLUMN "locationLabel",
DROP COLUMN "locationLatitude",
DROP COLUMN "locationLongitude",
DROP COLUMN "updatedAt",
ADD COLUMN     "archived_at" TIMESTAMP(3),
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "location_label" TEXT,
ADD COLUMN     "location_latitude" DOUBLE PRECISION,
ADD COLUMN     "location_longitude" DOUBLE PRECISION,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
