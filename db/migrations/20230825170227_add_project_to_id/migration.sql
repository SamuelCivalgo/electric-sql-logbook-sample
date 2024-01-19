-- AlterTable
ALTER TABLE "file" ADD COLUMN     "project_id" TEXT;

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "project"("id") ON DELETE SET NULL ON UPDATE CASCADE;
