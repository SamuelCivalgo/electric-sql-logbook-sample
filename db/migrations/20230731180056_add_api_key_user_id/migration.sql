-- DropForeignKey
ALTER TABLE "api_key" DROP CONSTRAINT "api_key_tenant_id_fkey";

-- AlterTable
ALTER TABLE "api_key" ADD COLUMN     "user_id" TEXT,
ALTER COLUMN "tenant_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "api_key" ADD CONSTRAINT "api_key_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "api_key" ADD CONSTRAINT "api_key_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;
