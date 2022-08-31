local status_ok, session = pcall(require, "session_manager")

if not status_ok then
        print("WARN! session-manager not found.")
        return
end

-- session.setup()
