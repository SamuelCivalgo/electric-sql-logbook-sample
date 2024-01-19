/*
  Warnings:

  - You are about to drop the column `rating_note` on the `dailyLogs` table. All the data in the column will be lost.
  - Made the column `status` on table `dailyLogs` required. This step will fail if there are existing NULL values in that column.
  - Made the column `progress` on table `projects` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "dailyLogs" DROP COLUMN "rating_note",
ADD COLUMN     "ratingNote" TEXT,
ALTER COLUMN "status" SET NOT NULL;

-- AlterTable
ALTER TABLE "projects" ALTER COLUMN "progress" SET NOT NULL;

-- CreateTable
CREATE TABLE "dailyLogItems" (
    "id" TEXT NOT NULL,
    "note" TEXT,
    "isNoteVisible" BOOLEAN,
    "itemType" TEXT NOT NULL,
    "task_id" TEXT NOT NULL,
    "dailyLog_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "dailyLogItems_pkey" PRIMARY KEY ("id")
);
