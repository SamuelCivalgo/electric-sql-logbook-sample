CREATE OR REPLACE FUNCTION create_default_task_status()
RETURNS TRIGGER AS $$
declare
  new_task_status_id uuid;
BEGIN

    IF NOT EXISTS (SELECT 1 FROM task_status WHERE tenant_id = NEW.id) THEN

      new_task_status_id := gen_random_uuid();

      INSERT INTO task_status (id, display_order, icon_color, name, tenant_id, created_at, updated_at, server_created_at, server_updated_at)
      VALUES (new_task_status_id, 0, '#34d399', 'In Progress', NEW.id, NOW(), NOW(), NOW(), NOW());

    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER trigger_create_default_task_status
AFTER INSERT ON Tenant
FOR EACH ROW
EXECUTE FUNCTION create_default_task_status();
