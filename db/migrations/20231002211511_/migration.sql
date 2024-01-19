/*
  Warnings:

  - You are about to drop the column `owner_id` on the `tenant` table. All the data in the column will be lost.

*/

-- Update all tenant users that are owner of a tenant
UPDATE public.tenant_user
SET user_role = 'owner', server_updated_at = NOW()
WHERE user_id IN (
    SELECT owner_id
    FROM public.tenant
) and user_role != 'owner';

-- DropForeignKey
ALTER TABLE "tenant" DROP CONSTRAINT "tenant_owner_id_fkey";

-- AlterTable
ALTER TABLE "tenant" DROP COLUMN "owner_id";
