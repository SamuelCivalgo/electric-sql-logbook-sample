-- CreateIndex
CREATE INDEX "daily_log_tenant_id_idx" ON "daily_log"("tenant_id");

-- CreateIndex
CREATE INDEX "daily_log_item_tenant_id_idx" ON "daily_log_item"("tenant_id");

-- CreateIndex
CREATE INDEX "feedback_tenant_id_idx" ON "feedback"("tenant_id");

-- CreateIndex
CREATE INDEX "file_tenant_id_idx" ON "file"("tenant_id");

-- CreateIndex
CREATE INDEX "file_property_tenant_id_idx" ON "file_property"("tenant_id");

-- CreateIndex
CREATE INDEX "file_property_value_tenant_id_idx" ON "file_property_value"("tenant_id");

-- CreateIndex
CREATE INDEX "image_tenant_id_idx" ON "image"("tenant_id");

-- CreateIndex
CREATE INDEX "location_entry_tenant_id_idx" ON "location_entry"("tenant_id");

-- CreateIndex
CREATE INDEX "project_tenant_id_idx" ON "project"("tenant_id");

-- CreateIndex
CREATE INDEX "project_property_tenant_id_idx" ON "project_property"("tenant_id");

-- CreateIndex
CREATE INDEX "project_property_value_tenant_id_idx" ON "project_property_value"("tenant_id");

-- CreateIndex
CREATE INDEX "task_tenant_id_idx" ON "task"("tenant_id");

-- CreateIndex
CREATE INDEX "task_property_tenant_id_idx" ON "task_property"("tenant_id");

-- CreateIndex
CREATE INDEX "task_property_value_tenant_id_idx" ON "task_property_value"("tenant_id");

-- CreateIndex
CREATE INDEX "task_status_tenant_id_idx" ON "task_status"("tenant_id");

-- CreateIndex
CREATE INDEX "tenant_user_tenant_id_idx" ON "tenant_user"("tenant_id");

-- CreateIndex
CREATE INDEX "time_block_tenant_id_idx" ON "time_block"("tenant_id");

-- CreateIndex
CREATE INDEX "user_current_tenant_id_idx" ON "user"("current_tenant_id");

-- CreateIndex
CREATE INDEX "user_task_tenant_id_idx" ON "user_task"("tenant_id");
