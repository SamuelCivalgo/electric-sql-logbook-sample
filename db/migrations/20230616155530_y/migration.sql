/*
  Warnings:

  - You are about to drop the `ProjectProperties` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectPropertyValues` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Projects` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ProjectPropertyValues" DROP CONSTRAINT "ProjectPropertyValues_projectId_fkey";

-- DropForeignKey
ALTER TABLE "ProjectPropertyValues" DROP CONSTRAINT "ProjectPropertyValues_projectPropertyId_fkey";

-- DropTable
DROP TABLE "ProjectProperties";

-- DropTable
DROP TABLE "ProjectPropertyValues";

-- DropTable
DROP TABLE "Projects";

-- CreateTable
CREATE TABLE "projects" (
    "project_id" TEXT NOT NULL,
    "name" TEXT,
    "locationLabel" TEXT,
    "locationLatitude" DOUBLE PRECISION,
    "locationLongitude" DOUBLE PRECISION,
    "progress" DOUBLE PRECISION,
    "dueDate" TIMESTAMP(3),
    "description" TEXT,
    "archivedAt" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "projects_pkey" PRIMARY KEY ("project_id")
);
