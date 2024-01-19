-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "task_status"("id") ON DELETE SET NULL ON UPDATE CASCADE;
