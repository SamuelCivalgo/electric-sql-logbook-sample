-- AlterTable
ALTER TABLE "tenantUsers" ADD COLUMN     "invite_email" TEXT,
ADD COLUMN     "invite_sent_at" TIMESTAMP(3),
ADD COLUMN     "invite_status" TEXT;
