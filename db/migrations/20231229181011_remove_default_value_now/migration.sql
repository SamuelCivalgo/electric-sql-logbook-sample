-- AlterTable
ALTER TABLE "api_key" ALTER COLUMN "created_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "daily_log" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "daily_log_item" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "equipment" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "equipment_property" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "equipment_property_value" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "feedback" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "file" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "file_property" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "file_property_value" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "image" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "location_entry" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "project_property" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "project_property_value" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "task" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "task_property" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "task_property_value" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "task_status" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "tenant" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "tenant_user" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "time_block" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "user_task" ALTER COLUMN "created_at" DROP DEFAULT,
ALTER COLUMN "updated_at" DROP DEFAULT,
ALTER COLUMN "server_created_at" DROP DEFAULT,
ALTER COLUMN "server_updated_at" DROP DEFAULT;
