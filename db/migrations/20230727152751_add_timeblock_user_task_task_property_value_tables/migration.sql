-- CreateTable
CREATE TABLE "task_property_value" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "task_property_id" TEXT NOT NULL,
    "task_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "task_property_value_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "time_block" (
    "id" TEXT NOT NULL,
    "duration" INTEGER,
    "entry_type" TEXT NOT NULL,
    "range_start_at" TIMESTAMP(3),
    "range_end_at" TIMESTAMP(3),
    "timer_start_at" TIMESTAMP(3),
    "timer_start_latitude" DOUBLE PRECISION,
    "timer_start_longitude" DOUBLE PRECISION,
    "timer_end_at" TIMESTAMP(3),
    "timer_end_latitude" DOUBLE PRECISION,
    "timer_end_longitude" DOUBLE PRECISION,
    "created_by" TEXT NOT NULL,
    "daily_log_item_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "time_block_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_task" (
    "id" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "task_id" TEXT NOT NULL,
    "tenant_id" TEXT,
    "user_id" TEXT NOT NULL,
    "archived_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "user_task_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "task_property_value" ADD CONSTRAINT "task_property_value_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property_value" ADD CONSTRAINT "task_property_value_task_property_id_fkey" FOREIGN KEY ("task_property_id") REFERENCES "task_property"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property_value" ADD CONSTRAINT "task_property_value_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property_value" ADD CONSTRAINT "task_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block" ADD CONSTRAINT "time_block_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block" ADD CONSTRAINT "time_block_daily_log_item_id_fkey" FOREIGN KEY ("daily_log_item_id") REFERENCES "daily_log_item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block" ADD CONSTRAINT "time_block_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_task_id_fkey" FOREIGN KEY ("task_id") REFERENCES "task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
