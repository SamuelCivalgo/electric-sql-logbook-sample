-- AlterEnum
ALTER TYPE "DailyLogItemType" ADD VALUE 'equipment';

-- AlterTable
ALTER TABLE "daily_log_item" ADD COLUMN     "equipment_id" TEXT;

-- AddForeignKey
ALTER TABLE "daily_log_item" ADD CONSTRAINT "daily_log_item_equipment_id_fkey" FOREIGN KEY ("equipment_id") REFERENCES "equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;
