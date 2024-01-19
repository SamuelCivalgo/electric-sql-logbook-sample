/*
  Warnings:

  - You are about to drop the `tenant_user_test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `time_block` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "tenant_user_test" DROP CONSTRAINT "tenant_user_test_createdBy_fkey";

-- DropForeignKey
ALTER TABLE "tenant_user_test" DROP CONSTRAINT "tenant_user_test_tenantId_fkey";

-- DropForeignKey
ALTER TABLE "tenant_user_test" DROP CONSTRAINT "tenant_user_test_userId_fkey";

-- DropForeignKey
ALTER TABLE "time_block" DROP CONSTRAINT "time_block_created_by_fkey";

-- DropForeignKey
ALTER TABLE "time_block" DROP CONSTRAINT "time_block_daily_log_item_id_fkey";

-- DropForeignKey
ALTER TABLE "time_block" DROP CONSTRAINT "time_block_tenant_id_fkey";

-- DropTable
DROP TABLE "tenant_user_test";

-- DropTable
DROP TABLE "time_block";

-- CreateTable
CREATE TABLE "TenantUser" (
    "id" TEXT NOT NULL,
    "userRole" TEXT NOT NULL,
    "inviteEmail" TEXT,
    "inviteSentAt" TIMESTAMPTZ,
    "inviteStatus" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT,
    "userId" TEXT,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "TenantUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "time_block_test" (
    "id" TEXT NOT NULL,
    "duration" INTEGER,
    "entryType" TEXT NOT NULL,
    "rangeStartAt" TIMESTAMPTZ,
    "rangeEndAt" TIMESTAMPTZ,
    "timerStartLatitude" DOUBLE PRECISION,
    "timerStartLongitude" DOUBLE PRECISION,
    "timerStartAddress" TEXT,
    "timerStartAt" TIMESTAMPTZ,
    "timerEndAt" TIMESTAMPTZ,
    "timerEndLatitude" DOUBLE PRECISION,
    "timerEndLongitude" DOUBLE PRECISION,
    "timerEndAddress" TEXT,
    "createdAt" TIMESTAMPTZ NOT NULL,
    "updatedAt" TIMESTAMPTZ NOT NULL,
    "archivedAt" TIMESTAMPTZ,
    "deletedAt" TIMESTAMPTZ,
    "createdBy" TEXT NOT NULL,
    "dailyLogItemId" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,

    CONSTRAINT "time_block_test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenantUser" ADD CONSTRAINT "TenantUser_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block_test" ADD CONSTRAINT "time_block_test_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block_test" ADD CONSTRAINT "time_block_test_dailyLogItemId_fkey" FOREIGN KEY ("dailyLogItemId") REFERENCES "DailyLogItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block_test" ADD CONSTRAINT "time_block_test_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
