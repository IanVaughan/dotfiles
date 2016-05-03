session_root "~/Quiqup"

if initialize_session "Quiqup"; then
  load_window "api-dev"
  load_window "api-rails"
  load_window "background"

  select_window 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
