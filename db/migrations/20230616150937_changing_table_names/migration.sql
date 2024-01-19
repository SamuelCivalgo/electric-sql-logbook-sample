/*
  Warnings:

  - You are about to drop the `Photo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Project` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectProperty` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProjectPropertyValue` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ProjectPropertyValue" DROP CONSTRAINT "ProjectPropertyValue_projectId_fkey";

-- DropForeignKey
ALTER TABLE "ProjectPropertyValue" DROP CONSTRAINT "ProjectPropertyValue_projectPropertyId_fkey";

-- DropTable
DROP TABLE "Photo";

-- DropTable
DROP TABLE "Project";

-- DropTable
DROP TABLE "ProjectProperty";

-- DropTable
DROP TABLE "ProjectPropertyValue";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Projects" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Projects_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectProperties" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "order" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ProjectProperties_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProjectPropertyValues" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "projectId" TEXT NOT NULL,
    "projectPropertyId" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ProjectPropertyValues_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ProjectPropertyValues" ADD CONSTRAINT "ProjectPropertyValues_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Projects"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProjectPropertyValues" ADD CONSTRAINT "ProjectPropertyValues_projectPropertyId_fkey" FOREIGN KEY ("projectPropertyId") REFERENCES "ProjectProperties"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
