window_root "~/Quiqup/realtime"
new_window "Background"
split_h

run_cmd "node app.js"
select_pane 1
run_cmd "cd ~/Quiqup/QuiqupAPI"
run_cmd "bundle exec sidekiq"
