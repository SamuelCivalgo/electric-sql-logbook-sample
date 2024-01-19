/*
  Warnings:

  - You are about to drop the column `status` on the `tasks` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "tasks" DROP COLUMN "status",
ADD COLUMN     "status_id" TEXT,
ADD COLUMN     "system_status_id" TEXT;
