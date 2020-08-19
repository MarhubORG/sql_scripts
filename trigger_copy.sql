CREATE TRIGGER trigger_copy BEFORE DELETE ON dialog_sessions FOR EACH ROW EXECUTE PROCEDURE function_copy_session();
