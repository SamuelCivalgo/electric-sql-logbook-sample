/*
  Warnings:

  - Made the column `system_status_id` on table `task` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
UPDATE "task" SET "system_status_id" = 'noStatus' WHERE "system_status_id" IS NULL;
ALTER TABLE "task" ALTER COLUMN "system_status_id" SET NOT NULL,
ALTER COLUMN "system_status_id" SET DEFAULT 'noStatus';
