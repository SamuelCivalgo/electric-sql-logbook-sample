-- DropForeignKey
ALTER TABLE "tenant_user" DROP CONSTRAINT "tenant_user_user_id_fkey";

-- AlterTable
ALTER TABLE "tenant_user" ALTER COLUMN "user_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "tenant_user" ADD CONSTRAINT "tenant_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;
