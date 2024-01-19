/*
  Warnings:

  - A unique constraint covering the columns `[tenant_id,user_id]` on the table `tenant_user` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[tenant_id,invite_email]` on the table `tenant_user` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "tenant_user_tenant_id_user_id_key" ON "tenant_user"("tenant_id", "user_id");

-- CreateIndex
CREATE UNIQUE INDEX "tenant_user_tenant_id_invite_email_key" ON "tenant_user"("tenant_id", "invite_email");
