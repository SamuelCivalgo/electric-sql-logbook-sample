-- CreateTable
CREATE TABLE "api_key" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "tenant_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "api_key_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "api_key" ADD CONSTRAINT "api_key_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
