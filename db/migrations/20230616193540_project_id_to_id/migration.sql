/*
  Warnings:

  - The primary key for the `projects` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `project_id` on the `projects` table. All the data in the column will be lost.
  - The required column `id` was added to the `projects` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- AlterTable
ALTER TABLE "projects" DROP CONSTRAINT "projects_pkey",
DROP COLUMN "project_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "projects_pkey" PRIMARY KEY ("id");
