-- AlterTable
ALTER TABLE "tenant" ALTER COLUMN "name" SET NOT NULL,
ALTER COLUMN "created_by" DROP NOT NULL;

-- AlterTable
ALTER TABLE "tenant_user" ALTER COLUMN "created_by" DROP NOT NULL;

-- Create unique tenants for users without a tenant
DO $$
DECLARE
    _user RECORD;
    new_tenant_id text;
BEGIN
    FOR _user IN SELECT id, email FROM "user" WHERE current_tenant_id IS NULL LOOP

        -- Generate a unique tenant ID
        new_tenant_id := uuid_generate_v4();

        -- Create a unique tenant for each user
        INSERT INTO tenant (id, name, settings, created_at, updated_at)
        VALUES (new_tenant_id, 'Tenant_' || COALESCE(_user.email, 'default'), '{}', NOW(), NOW());

        -- Link user to the newly created tenant in TenantUser
        INSERT INTO tenant_user (id, tenant_id, user_id, invite_status, user_role, created_at, updated_at)
        VALUES (uuid_generate_v4(), new_tenant_id, _user.id, 'accepted','owner', NOW(), NOW());

        -- Update the user's current_tenant_id
        UPDATE "user"
        SET current_tenant_id = new_tenant_id
        WHERE id = _user.id;
    END LOOP;
END;
$$;

DO $$
DECLARE
    _table_name text;
    _sql text;
    _tables text[] := ARRAY['daily_log', 'daily_log_item', 'equipment', 'equipment_property', 'equipment_property_value', 'feedback', 'file', 'file_property', 'file_property_value', 'image', 'location_entry', 'project', 'project_property', 'project_property_value', 'task', 'task_property', 'task_property_value', 'task_status', 'time_block', 'user_task'];
BEGIN
    FOR i IN 1..array_length(_tables, 1) LOOP
        _table_name := _tables[i];

        -- Construct the SQL statement
        _sql := format('UPDATE public.%I SET tenant_id = u.current_tenant_id FROM public.user u WHERE %I.created_by = u.id AND %I.tenant_id IS NULL;', _table_name, _table_name, _table_name);

        -- Execute the SQL statement
        EXECUTE _sql;
    END LOOP;

    -- Update the tenant_id column to NOT NULL fro api_key
    UPDATE "api_key" SET "tenant_id" = (SELECT MAX("tenant_id") FROM "tenant_user" WHERE "tenant_user"."user_id" = "api_key"."user_id") WHERE tenant_id IS NULL;

END;
$$;


-- DropForeignKey
ALTER TABLE "api_key" DROP CONSTRAINT "api_key_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "daily_log" DROP CONSTRAINT "daily_log_created_by_fkey";

-- DropForeignKey
ALTER TABLE "daily_log" DROP CONSTRAINT "daily_log_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item" DROP CONSTRAINT "daily_log_item_created_by_fkey";

-- DropForeignKey
ALTER TABLE "daily_log_item" DROP CONSTRAINT "daily_log_item_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_created_by_fkey";

-- DropForeignKey
ALTER TABLE "equipment" DROP CONSTRAINT "equipment_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property" DROP CONSTRAINT "equipment_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property" DROP CONSTRAINT "equipment_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "equipment_property_value" DROP CONSTRAINT "equipment_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "feedback" DROP CONSTRAINT "feedback_created_by_fkey";

-- DropForeignKey
ALTER TABLE "feedback" DROP CONSTRAINT "feedback_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "file" DROP CONSTRAINT "file_created_by_fkey";

-- DropForeignKey
ALTER TABLE "file" DROP CONSTRAINT "file_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "file_property" DROP CONSTRAINT "file_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "file_property" DROP CONSTRAINT "file_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "file_property_value" DROP CONSTRAINT "file_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "file_property_value" DROP CONSTRAINT "file_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "image" DROP CONSTRAINT "image_created_by_fkey";

-- DropForeignKey
ALTER TABLE "image" DROP CONSTRAINT "image_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "location_entry" DROP CONSTRAINT "location_entry_created_by_fkey";

-- DropForeignKey
ALTER TABLE "location_entry" DROP CONSTRAINT "location_entry_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "project" DROP CONSTRAINT "project_created_by_fkey";

-- DropForeignKey
ALTER TABLE "project" DROP CONSTRAINT "project_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "project_property" DROP CONSTRAINT "project_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "project_property" DROP CONSTRAINT "project_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "project_property_value" DROP CONSTRAINT "project_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "project_property_value" DROP CONSTRAINT "project_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task" DROP CONSTRAINT "task_created_by_fkey";

-- DropForeignKey
ALTER TABLE "task" DROP CONSTRAINT "task_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task_property" DROP CONSTRAINT "task_property_created_by_fkey";

-- DropForeignKey
ALTER TABLE "task_property" DROP CONSTRAINT "task_property_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task_property_value" DROP CONSTRAINT "task_property_value_created_by_fkey";

-- DropForeignKey
ALTER TABLE "task_property_value" DROP CONSTRAINT "task_property_value_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "task_status" DROP CONSTRAINT "task_status_created_by_fkey";

-- DropForeignKey
ALTER TABLE "task_status" DROP CONSTRAINT "task_status_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "tenant" DROP CONSTRAINT "tenant_created_by_fkey";

-- DropForeignKey
ALTER TABLE "tenant_user" DROP CONSTRAINT "tenant_user_created_by_fkey";

-- DropForeignKey
ALTER TABLE "tenant_user" DROP CONSTRAINT "tenant_user_user_id_fkey";

-- DropForeignKey
ALTER TABLE "time_block" DROP CONSTRAINT "time_block_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user" DROP CONSTRAINT "user_current_tenant_id_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_created_by_fkey";

-- DropForeignKey
ALTER TABLE "user_task" DROP CONSTRAINT "user_task_tenant_id_fkey";

-- AlterTable
ALTER TABLE "api_key" ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "daily_log" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "daily_log_item" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "equipment" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "equipment_property" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "equipment_property_value" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "feedback" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "file" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "file_property" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "file_property_value" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "image" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "location_entry" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "project" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "project_property" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "project_property_value" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "task" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "task_property" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "task_property_value" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "task_status" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "time_block" ALTER COLUMN "tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "current_tenant_id" SET NOT NULL;

-- AlterTable
ALTER TABLE "user_task" ALTER COLUMN "created_by" DROP NOT NULL,
ALTER COLUMN "tenant_id" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "daily_log" ADD CONSTRAINT "daily_log_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log" ADD CONSTRAINT "daily_log_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item" ADD CONSTRAINT "daily_log_item_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "daily_log_item" ADD CONSTRAINT "daily_log_item_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedback" ADD CONSTRAINT "feedback_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "feedback" ADD CONSTRAINT "feedback_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file" ADD CONSTRAINT "file_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property" ADD CONSTRAINT "file_property_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property" ADD CONSTRAINT "file_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property_value" ADD CONSTRAINT "file_property_value_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_property_value" ADD CONSTRAINT "file_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image" ADD CONSTRAINT "image_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image" ADD CONSTRAINT "image_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_entry" ADD CONSTRAINT "location_entry_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location_entry" ADD CONSTRAINT "location_entry_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project" ADD CONSTRAINT "project_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project" ADD CONSTRAINT "project_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property" ADD CONSTRAINT "project_property_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property" ADD CONSTRAINT "project_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property_value" ADD CONSTRAINT "project_property_value_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "project_property_value" ADD CONSTRAINT "project_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "task_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property" ADD CONSTRAINT "task_property_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property" ADD CONSTRAINT "task_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property_value" ADD CONSTRAINT "task_property_value_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_property_value" ADD CONSTRAINT "task_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_status" ADD CONSTRAINT "task_status_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "task_status" ADD CONSTRAINT "task_status_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant" ADD CONSTRAINT "tenant_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user" ADD CONSTRAINT "tenant_user_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tenant_user" ADD CONSTRAINT "tenant_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "time_block" ADD CONSTRAINT "time_block_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_current_tenant_id_fkey" FOREIGN KEY ("current_tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_task" ADD CONSTRAINT "user_task_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "api_key" ADD CONSTRAINT "api_key_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property" ADD CONSTRAINT "equipment_property_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property" ADD CONSTRAINT "equipment_property_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property_value" ADD CONSTRAINT "equipment_property_value_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_property_value" ADD CONSTRAINT "equipment_property_value_tenant_id_fkey" FOREIGN KEY ("tenant_id") REFERENCES "tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
