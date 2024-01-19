-- AlterTable
ALTER TABLE "file" ADD COLUMN     "daily_log_id" TEXT;

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_daily_log_id_fkey" FOREIGN KEY ("daily_log_id") REFERENCES "daily_log"("id") ON DELETE SET NULL ON UPDATE CASCADE;
