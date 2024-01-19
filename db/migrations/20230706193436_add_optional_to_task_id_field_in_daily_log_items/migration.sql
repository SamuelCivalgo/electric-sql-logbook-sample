-- DropForeignKey
ALTER TABLE "dailyLogItems" DROP CONSTRAINT "dailyLogItems_task_id_fkey";

-- AlterTable
ALTER TABLE "dailyLogItems" ALTER COLUMN "task_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "dailyLogItems" ADD CONSTRAINT "dailyLogItems_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "tasks"("id") ON DELETE SET NULL ON UPDATE CASCADE;
