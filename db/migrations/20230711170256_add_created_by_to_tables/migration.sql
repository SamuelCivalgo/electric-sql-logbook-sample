/*
  Warnings:

  - You are about to drop the column `user_id` on the `feedbacks` table. All the data in the column will be lost.
  - Added the required column `created_by` to the `dailyLogItems` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `dailyLogs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `feedbacks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `fileProperties` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `filePropertyValues` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `files` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `locationEntries` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `projects` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `tasks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_by` to the `tenants` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "feedbacks" DROP CONSTRAINT "feedbacks_user_id_fkey";

-- AlterTable
ALTER TABLE "dailyLogItems" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "dailyLogs" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "feedbacks" DROP COLUMN "user_id",
ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "fileProperties" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "filePropertyValues" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "files" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "locationEntries" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "projects" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "tasks" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "tenants" ADD COLUMN     "created_by" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "dailyLogs" ADD CONSTRAINT "dailyLogs_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dailyLogItems" ADD CONSTRAINT "dailyLogItems_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedbacks" ADD CONSTRAINT "feedbacks_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "files" ADD CONSTRAINT "files_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fileProperties" ADD CONSTRAINT "fileProperties_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "filePropertyValues" ADD CONSTRAINT "filePropertyValues_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "locationEntries" ADD CONSTRAINT "locationEntries_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenants" ADD CONSTRAINT "tenants_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tasks" ADD CONSTRAINT "tasks_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
