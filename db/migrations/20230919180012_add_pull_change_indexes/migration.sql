-- CreateIndex
CREATE INDEX "daily_log_server_created_at_idx" ON "daily_log"("server_created_at");

-- CreateIndex
CREATE INDEX "daily_log_server_updated_at_idx" ON "daily_log"("server_updated_at");

-- CreateIndex
CREATE INDEX "daily_log_deleted_at_idx" ON "daily_log"("deleted_at");

-- CreateIndex
CREATE INDEX "daily_log_item_server_created_at_idx" ON "daily_log_item"("server_created_at");

-- CreateIndex
CREATE INDEX "daily_log_item_server_updated_at_idx" ON "daily_log_item"("server_updated_at");

-- CreateIndex
CREATE INDEX "daily_log_item_deleted_at_idx" ON "daily_log_item"("deleted_at");

-- CreateIndex
CREATE INDEX "feedback_server_created_at_idx" ON "feedback"("server_created_at");

-- CreateIndex
CREATE INDEX "feedback_server_updated_at_idx" ON "feedback"("server_updated_at");

-- CreateIndex
CREATE INDEX "feedback_deleted_at_idx" ON "feedback"("deleted_at");

-- CreateIndex
CREATE INDEX "file_server_created_at_idx" ON "file"("server_created_at");

-- CreateIndex
CREATE INDEX "file_server_updated_at_idx" ON "file"("server_updated_at");

-- CreateIndex
CREATE INDEX "file_deleted_at_idx" ON "file"("deleted_at");

-- CreateIndex
CREATE INDEX "file_property_server_created_at_idx" ON "file_property"("server_created_at");

-- CreateIndex
CREATE INDEX "file_property_server_updated_at_idx" ON "file_property"("server_updated_at");

-- CreateIndex
CREATE INDEX "file_property_deleted_at_idx" ON "file_property"("deleted_at");

-- CreateIndex
CREATE INDEX "file_property_value_server_created_at_idx" ON "file_property_value"("server_created_at");

-- CreateIndex
CREATE INDEX "file_property_value_server_updated_at_idx" ON "file_property_value"("server_updated_at");

-- CreateIndex
CREATE INDEX "file_property_value_deleted_at_idx" ON "file_property_value"("deleted_at");

-- CreateIndex
CREATE INDEX "image_server_created_at_idx" ON "image"("server_created_at");

-- CreateIndex
CREATE INDEX "image_server_updated_at_idx" ON "image"("server_updated_at");

-- CreateIndex
CREATE INDEX "image_deleted_at_idx" ON "image"("deleted_at");

-- CreateIndex
CREATE INDEX "location_entry_server_created_at_idx" ON "location_entry"("server_created_at");

-- CreateIndex
CREATE INDEX "location_entry_server_updated_at_idx" ON "location_entry"("server_updated_at");

-- CreateIndex
CREATE INDEX "location_entry_deleted_at_idx" ON "location_entry"("deleted_at");

-- CreateIndex
CREATE INDEX "project_server_created_at_idx" ON "project"("server_created_at");

-- CreateIndex
CREATE INDEX "project_server_updated_at_idx" ON "project"("server_updated_at");

-- CreateIndex
CREATE INDEX "project_deleted_at_idx" ON "project"("deleted_at");

-- CreateIndex
CREATE INDEX "project_property_server_created_at_idx" ON "project_property"("server_created_at");

-- CreateIndex
CREATE INDEX "project_property_server_updated_at_idx" ON "project_property"("server_updated_at");

-- CreateIndex
CREATE INDEX "project_property_deleted_at_idx" ON "project_property"("deleted_at");

-- CreateIndex
CREATE INDEX "project_property_value_server_created_at_idx" ON "project_property_value"("server_created_at");

-- CreateIndex
CREATE INDEX "project_property_value_server_updated_at_idx" ON "project_property_value"("server_updated_at");

-- CreateIndex
CREATE INDEX "project_property_value_deleted_at_idx" ON "project_property_value"("deleted_at");

-- CreateIndex
CREATE INDEX "task_server_created_at_idx" ON "task"("server_created_at");

-- CreateIndex
CREATE INDEX "task_server_updated_at_idx" ON "task"("server_updated_at");

-- CreateIndex
CREATE INDEX "task_deleted_at_idx" ON "task"("deleted_at");

-- CreateIndex
CREATE INDEX "task_property_server_created_at_idx" ON "task_property"("server_created_at");

-- CreateIndex
CREATE INDEX "task_property_server_updated_at_idx" ON "task_property"("server_updated_at");

-- CreateIndex
CREATE INDEX "task_property_deleted_at_idx" ON "task_property"("deleted_at");

-- CreateIndex
CREATE INDEX "task_property_value_server_created_at_idx" ON "task_property_value"("server_created_at");

-- CreateIndex
CREATE INDEX "task_property_value_server_updated_at_idx" ON "task_property_value"("server_updated_at");

-- CreateIndex
CREATE INDEX "task_property_value_deleted_at_idx" ON "task_property_value"("deleted_at");

-- CreateIndex
CREATE INDEX "task_status_server_created_at_idx" ON "task_status"("server_created_at");

-- CreateIndex
CREATE INDEX "task_status_server_updated_at_idx" ON "task_status"("server_updated_at");

-- CreateIndex
CREATE INDEX "task_status_deleted_at_idx" ON "task_status"("deleted_at");

-- CreateIndex
CREATE INDEX "tenant_server_created_at_idx" ON "tenant"("server_created_at");

-- CreateIndex
CREATE INDEX "tenant_server_updated_at_idx" ON "tenant"("server_updated_at");

-- CreateIndex
CREATE INDEX "tenant_deleted_at_idx" ON "tenant"("deleted_at");

-- CreateIndex
CREATE INDEX "tenant_user_server_created_at_idx" ON "tenant_user"("server_created_at");

-- CreateIndex
CREATE INDEX "tenant_user_server_updated_at_idx" ON "tenant_user"("server_updated_at");

-- CreateIndex
CREATE INDEX "tenant_user_deleted_at_idx" ON "tenant_user"("deleted_at");

-- CreateIndex
CREATE INDEX "time_block_server_created_at_idx" ON "time_block"("server_created_at");

-- CreateIndex
CREATE INDEX "time_block_server_updated_at_idx" ON "time_block"("server_updated_at");

-- CreateIndex
CREATE INDEX "time_block_deleted_at_idx" ON "time_block"("deleted_at");

-- CreateIndex
CREATE INDEX "user_server_created_at_idx" ON "user"("server_created_at");

-- CreateIndex
CREATE INDEX "user_server_updated_at_idx" ON "user"("server_updated_at");

-- CreateIndex
CREATE INDEX "user_deleted_at_idx" ON "user"("deleted_at");

-- CreateIndex
CREATE INDEX "user_task_server_created_at_idx" ON "user_task"("server_created_at");

-- CreateIndex
CREATE INDEX "user_task_server_updated_at_idx" ON "user_task"("server_updated_at");

-- CreateIndex
CREATE INDEX "user_task_deleted_at_idx" ON "user_task"("deleted_at");
